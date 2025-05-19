import 'package:dscript/dscript.dart';
import 'package:equatable/equatable.dart';

part 'errors.dart';
part 'signatures.dart';

/// Same as [Scope] but only stores the types of variables and not their values.
class TypeScope {
  /// The parent scope of this scope.
  final TypeScope? _parent;

  /// Same as [Scope] but only stores the types of variables and not their values.
  TypeScope(this._parent);

  final Map<String, $Type> _types = {
    'pi': PrimitiveType.DOUBLE,
    'e': PrimitiveType.DOUBLE,
    'sqrt2': PrimitiveType.DOUBLE,
    'sqrt1_2': PrimitiveType.DOUBLE,
  };

  /// List of mutable variables in this scope.
  final List<String> _mutables = [];

  /// Sets the type of a variable in this scope.
  ///
  /// Throws an [AnalyzerError] if the variable is already defined in this scope.
  void set(String name, $Type type, bool mutable) {
    if (type == PrimitiveType.VOID) {
      throw AnalyzerError('Variable cannot be void: $name');
    }

    if (_types.containsKey(name)) {
      throw AnalyzerError('Variable $name already defined');
    }

    _types[name] = type;

    if (mutable) {
      _mutables.add(name);
    }
  }

  /// Checks if a variable is mutable in this scope.
  bool mutable(String name) {
    if (_types.containsKey(name)) {
      return _mutables.contains(name);
    } else if (_parent != null) {
      return _parent.mutable(name);
    }

    throw AnalyzerError('Variable $name not defined');
  }

  /// Gets the type of a variable in this scope.
  $Type get(String name) {
    if (_types.containsKey(name)) {
      return _types[name]!;
    } else if (_parent != null) {
      return _parent.get(name);
    } else {
      throw AnalyzerError('Variable $name not defined');
    }
  }

  /// Returns the parent scope or this scope if there is no parent.
  TypeScope pop() {
    return _parent ?? this;
  }

  /// Returns the root scope of this scope.
  TypeScope get root {
    return _parent?.root ?? this;
  }
}

/// Static analyzer for DScript scripts.
class Analyzer {
  /// List of contracts defined by the host.
  final List<ContractSignature> contracts;

  /// List of implementations defined in the script.
  late final List<ImplementationSignature> scriptImplementations;

  /// List of hooks defined in the script.
  late final List<HookSignature> scriptHooks;

  /// Creates an [Analyzer] for the given [script].
  Analyzer({
    required this.contracts,
  });

  /// Analyzes the script for errors and checks for missing permissions.
  ///
  /// Throws an [AnalysisReport] if any issues are found.
  void analyze(Script script) {
    final report = AnalysisReport();

    final contract = contracts.firstWhere(
      (c) => c.name == script.contract.name,
      orElse: () =>
          throw AnalyzerError('Contract not found: ${script.contract.name}'),
    );

    final scriptImplementations = script.contract.implementations
        .map((e) => ImplementationSignature.from(e))
        .toList();
    final scriptHooks =
        script.contract.hooks.map((e) => HookSignature.from(e)).toList();

    final implementations = contract.implementations;
    final hooks = contract.hooks;

    for (final implementation in implementations) {
      if (!scriptImplementations.contains(implementation)) {
        report.report(AnalyzerError('Missing implementation: $implementation'));
      }
    }

    for (final hook in scriptHooks) {
      if (!hooks.contains(hook)) {
        report.report(AnalyzerError('Unrecognized hook: $hook'));
        continue;
      }

      final result = _analyzeFunction(script.contract.hooks.firstWhere(
        (e) => e.name == hook.name,
      ));

      report.merge(result);
    }

    for (final implementation in scriptImplementations) {
      if (!implementations.contains(implementation)) {
        report.report(
          AnalyzerError('Unrecognized implementation: $implementation'),
        );
        continue;
      }

      final result =
          _analyzeFunction(script.contract.implementations.firstWhere(
        (e) => e.name == implementation.name,
      ));

      report.merge(result);
    }

    report.throwIfErrors();
  }

  AnalysisReport _analyzeFunction(FunctionDeclaration function,
      [TypeScope? parentScope]) {
    final report = AnalysisReport();

    final scope = TypeScope(parentScope);

    for (final parameter in function.parameters) {
      try {
        infer(parameter, scope);
      } on AnalyzerError catch (e) {
        report.report(e);
      }
    }

    final returnType = $Type.from(function.returnType);

    for (final stmt in function.body) {
      try {
        switch (stmt) {
          case ReturnStatement():
            if (stmt.expression != null && returnType == PrimitiveType.VOID) {
              report.report(
                AnalyzerError('Void function cannot return a value: $function'),
              );
            }

            if (stmt.expression != null) {
              final type = infer(stmt.expression!, scope);

              if (type != returnType) {
                report.report(
                  TypeError(
                    returnType,
                    type,
                  ),
                );
              }
            } else if (returnType != PrimitiveType.VOID) {
              report.report(
                AnalyzerError('Missing return value: $function'),
              );
            }
            break;
          case VariableDeclaration():
            infer(stmt, scope);
            break;
          default:
            infer(stmt, scope);
        }
      } on AnalyzerError catch (e) {
        report.report(e);
      }
    }

    return report;
  }

  /// Infers the type of a statement.
  $Type infer(Statement statement, TypeScope scope) {
    switch (statement) {
      case IntegerLiteral():
        return PrimitiveType.INT;
      case StringLiteral():
        return PrimitiveType.STRING;
      case BooleanLiteral():
        return PrimitiveType.BOOL;
      case DoubleLiteral():
        return PrimitiveType.DOUBLE;
      case Identifier():
        return scope.get(statement.name);
      case Parameter():
        final type = $Type.from(statement.type);
        if (type == PrimitiveType.VOID) {
          throw AnalyzerError('Parameter cannot be void: $statement');
        }
        scope.set(statement.name, type, true);
        return type;
      case BinaryExpression():
        final leftType = infer(statement.left, scope);
        final rightType = infer(statement.right, scope);

        if (leftType == rightType) {
          return leftType;
        }

        if (leftType == PrimitiveType.INT &&
            rightType == PrimitiveType.DOUBLE) {
          return PrimitiveType.DOUBLE;
        }

        if (leftType == PrimitiveType.DOUBLE &&
            rightType == PrimitiveType.INT) {
          return PrimitiveType.DOUBLE;
        }

        throw InferenceError(
          statement,
        );
      case VariableDeclaration():
        if (statement.initializer == null && statement.type == null) {
          throw InferenceError(
            statement,
          );
        }

        final mutable = statement is VarDeclaration;

        if (statement.initializer == null && statement.type != null) {
          if (statement.type!.nullable) {
            scope.set(statement.variable, statement.type!, mutable);
            return statement.type!;
          }

          throw AnalyzerError(
            'Non-nullable type without initializer: $statement',
          );
        }

        if (statement.initializer != null && statement.type == null) {
          final type = infer(statement.initializer!, scope);
          scope.set(statement.variable, type, mutable);
          return type;
        }

        if (statement.initializer != null && statement.type != null) {
          final type = infer(statement.initializer!, scope);
          if (type == statement.type) {
            scope.set(statement.variable, type, mutable);
            return type;
          }

          if (type == PrimitiveType.INT &&
              statement.type == PrimitiveType.DOUBLE) {
            scope.set(statement.variable, PrimitiveType.DOUBLE, mutable);
            return PrimitiveType.DOUBLE;
          }

          throw AssignmentError(
            statement.variable,
            statement.type!,
            type,
          );
        }

        throw InferenceError(
          statement,
        );
      case AssignmentStatement():
        final type = infer(statement.expression, scope);

        if (scope.mutable(statement.variable)) {
          final declaedType = scope.get(statement.variable);
          if (declaedType == type) {
            return type;
          }

          throw AssignmentError(
            statement.variable,
            declaedType,
            type,
          );
        }

        throw AnalyzerError(
          'Cannot assign to immutable variable: ${statement.variable}',
        );

      default:
        throw InferenceError(
          statement,
        );
    }
  }
}
