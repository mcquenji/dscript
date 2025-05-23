import 'package:dscript/dscript.dart';
import 'package:dscript/runtime/stdlib/stdlib.dart';
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
      throw AnalyzerError('Variable cannot be void: $name', statement: null);
    }

    if (_types.containsKey(name)) {
      throw AnalyzerError('Variable $name already defined', statement: null);
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

    throw AnalyzerError('Variable $name not defined', statement: null);
  }

  /// Gets the type of a variable in this scope.
  $Type get(String name) {
    if (_types.containsKey(name)) {
      return _types[name]!;
    } else if (_parent != null) {
      return _parent.get(name);
    } else {
      throw AnalyzerError('Variable $name not defined', statement: null);
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

  /// Creates an [Analyzer] for the given [script].
  Analyzer({
    required this.contracts,
  });

  /// Analyzes the script for errors and checks for missing permissions.
  ///
  /// Throws an [AnalysisReport] if any issues are found.
  AnalysisReport analyze(Script script) {
    final report = AnalysisReport();

    final contract = getContract(script);

    final scriptImplementations = script.contract.implementations
        .map((e) => ImplementationSignature.from(e))
        .toList();
    final scriptHooks =
        script.contract.hooks.map((e) => HookSignature.from(e)).toList();

    final implementations = contract.implementations;
    final hooks = contract.hooks;

    for (final implementation in implementations) {
      if (!scriptImplementations.contains(implementation)) {
        report.report(
          AnalyzerError(
            'Missing implementation: $implementation',
            statement: implementation.node,
          ),
        );
      }
    }

    final bindings = [contract.bindings, ...LibraryBinding.stdLib(script)];

    for (final hook in scriptHooks) {
      if (!hooks.contains(hook)) {
        report.report(
          AnalyzerError(
            'Unrecognized hook: $hook',
            statement: hook.node,
          ),
        );
        continue;
      }

      final result = _analyzeFunction(
        script.contract.hooks.firstWhere(
          (e) => e.name == hook.name,
        ),
        bindings: bindings,
        script: script,
      );

      report.merge(result);
    }

    for (final implementation in scriptImplementations) {
      if (!implementations.contains(implementation)) {
        report.report(
          AnalyzerError(
            'Unrecognized implementation: $implementation',
            statement: implementation.node,
          ),
        );
        continue;
      }

      final result = _analyzeFunction(
        script.contract.implementations.firstWhere(
          (e) => e.name == implementation.name,
        ),
        bindings: bindings,
        script: script,
      );

      report.merge(result);
    }

    return report;
  }

  /// Returns the matching contract from [contracts] for the given [script].
  ContractSignature getContract(Script script) {
    return contracts.firstWhere(
      (c) => c.name == script.contract.name,
      orElse: () => throw AnalyzerError(
        'Contract not found: ${script.contract.name}',
        statement: script.contract,
      ),
    );
  }

  AnalysisReport _analyzeFunction(
    FunctionDeclaration function, {
    TypeScope? parentScope,
    required Script script,
    required List<LibraryBinding> bindings,
  }) {
    final report = AnalysisReport();

    final scope = TypeScope(parentScope);

    for (final parameter in function.parameters) {
      try {
        infer(parameter, scope, bindings);
      } on AnalyzerError catch (e) {
        report.report(e);
      }
    }

    final returnType = function.returnType;

    for (final stmt in function.body) {
      try {
        switch (stmt) {
          case ReturnStatement():
            if (stmt.expression != null) {
              final type = infer(stmt.expression!, scope, bindings);

              if (!type.canCast(returnType)) {
                report.report(
                  ReturnError(
                    returnType,
                    type,
                    statement: stmt,
                  ),
                );
              }
            } else if (returnType != PrimitiveType.VOID &&
                !returnType.nullable) {
              report.report(
                ReturnError(
                  returnType,
                  PrimitiveType.NULL,
                  statement: stmt,
                ),
              );
            }
            break;
          case VariableDeclaration():
            infer(stmt, scope, bindings);
            break;
          case ExternalCall():
            infer(stmt, scope, bindings);
            break;
          default:
            infer(stmt, scope, bindings);
        }
      } on AnalyzerError catch (e) {
        report.report(e);
      }
    }

    return report;
  }

  /// Infers the type of a statement.
  $Type infer(
    Statement stmt,
    TypeScope scope,
    List<LibraryBinding> bindings,
  ) {
    switch (stmt) {
      case IntegerLiteral():
        return PrimitiveType.INT;
      case StringLiteral():
        return PrimitiveType.STRING;
      case BooleanLiteral():
        return PrimitiveType.BOOL;
      case DoubleLiteral():
        return PrimitiveType.DOUBLE;
      case Identifier():
        return scope.get(stmt.name);
      case ExternalCall():
        final binding = bindings.firstWhere(
          (b) => b.name == stmt.namespace,
          orElse: () => throw AnalyzerError(
            'Undefined namespace: ${stmt.namespace}',
            statement: stmt,
          ),
        );

        final functionBinding = binding.bindings.firstWhere(
          (b) => b.name == stmt.method,
          orElse: () => throw AnalyzerError(
            'No such function in namespace ${stmt.namespace}: ${stmt.method}',
            statement: stmt,
          ),
        );

        final report = AnalysisReport();

        for (var i = 0; i < stmt.positionalArgs.length; i++) {
          final arg = stmt.positionalArgs[i];
          final type = infer(arg, scope, bindings);

          if (i >= functionBinding.positionalParams.length) {
            report.report(
              AnalyzerError(
                'Too many positional arguments for ${stmt.method}: ${stmt.positionalArgs.length}; expected ${functionBinding.positionalParams.length}',
                statement: arg,
              ),
            );

            break;
          }

          final paramType = functionBinding.positionalParams[i];

          if (!type.canCast(paramType)) {
            report.report(
              TypeError(
                paramType,
                type,
                statement: arg,
              ),
            );
          }
        }

        for (final arg in stmt.namedArgs.entries) {
          final name = arg.key;
          final value = arg.value;

          final type = infer(value, scope, bindings);

          if (!functionBinding.namedParams.containsKey(Symbol(name))) {
            report.report(
              AnalyzerError(
                'No such named parameter for ${stmt.method}: $name',
                statement: value,
              ),
            );

            continue;
          }

          final paramType = functionBinding.namedParams[Symbol(name)]!;

          if (!type.canCast(paramType)) {
            report.report(
              TypeError(
                paramType,
                type,
                statement: value,
              ),
            );
          }
        }

        report.throwIfErrors();

        return functionBinding.returnType;

      case Parameter():
        final type = stmt.type;
        if (type == PrimitiveType.VOID) {
          throw AnalyzerError(
            'Parameter cannot be void: $stmt',
            statement: stmt,
          );
        }
        scope.set(stmt.name, type, true);
        return type;
      case BinaryExpression():
        final leftType = infer(stmt.left, scope, bindings);
        final rightType = infer(stmt.right, scope, bindings);

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
          statement: stmt,
        );
      case VariableDeclaration():
        if (stmt.initializer == null && stmt.type == null) {
          throw InferenceError(
            statement: stmt,
          );
        }

        final mutable = stmt is VarDeclaration;

        if (stmt.initializer == null && stmt.type != null) {
          if (stmt.type!.nullable) {
            scope.set(stmt.variable, stmt.type!, mutable);
            return stmt.type!;
          }

          throw AnalyzerError(
            'Non-nullable type without initializer: $stmt',
            statement: stmt,
          );
        }

        if (stmt.initializer != null && stmt.type == null) {
          final type = infer(stmt.initializer!, scope, bindings);
          scope.set(stmt.variable, type, mutable);
          return type;
        }

        if (stmt.initializer != null && stmt.type != null) {
          final type = infer(stmt.initializer!, scope, bindings);
          if (type == stmt.type) {
            scope.set(stmt.variable, type, mutable);
            return type;
          }

          // if the type can be implicitly casted to the type of the variable
          // then we can assign it
          if (type.canCast(stmt.type ?? PrimitiveType.VOID)) {
            scope.set(stmt.variable, type, mutable);
            return type;
          }

          throw AssignmentError(
            stmt.variable,
            stmt.type!,
            type,
            statement: stmt,
          );
        }

        throw InferenceError(
          statement: stmt,
          message:
              'Failed to infer type for variable, try adding explicit typing',
        );
      case AssignmentStatement():
        final type = infer(stmt.expression, scope, bindings);

        if (scope.mutable(stmt.variable)) {
          final declaedType = scope.get(stmt.variable);
          if (type.canCast(declaedType)) {
            return type;
          }

          throw AssignmentError(
            stmt.variable,
            declaedType,
            type,
            statement: stmt,
          );
        }

        throw AnalyzerError(
          'Cannot assign to immutable variable: ${stmt.variable}',
          statement: stmt,
        );

      default:
        throw InferenceError(
          statement: stmt,
        );
    }
  }
}
