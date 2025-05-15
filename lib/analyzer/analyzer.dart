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

  /// Sets the type of a variable in this scope.
  ///
  /// Throws an [AnalyzerError] if the variable is already defined in this scope.
  void set(String name, $Type type) {
    if (type == PrimitiveType.VOID) {
      throw AnalyzerError('Variable cannot be void: $name');
    }

    if (_types.containsKey(name)) {
      throw AnalyzerError('Variable $name already defined');
    }
    _types[name] = type;
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
  /// The [Script] being analyzed.
  final Script script;

  /// List of [ImplementationSignature]s the script is required to define.
  final List<ImplementationSignature> implementations;

  /// List of [HookSignature]s the script may listen to.
  final List<HookSignature> hooks;

  /// List of struct definitions passed to the contract or returned from it.
  final List<Struct> structs;

  /// List of implementations defined in the script.
  late final List<ImplementationSignature> scriptImplementations;

  /// List of hooks defined in the script.
  late final List<HookSignature> scriptHooks;

  /// The scope of the script.
  TypeScope scope = TypeScope(null);

  /// Creates an [Analyzer] for the given [script].
  Analyzer({
    required this.script,
    this.implementations = const [],
    this.hooks = const [],
    this.structs = const [],
  }) {
    scriptImplementations = script.contract.implementations
        .map((e) => ImplementationSignature.from(e))
        .toList();
    scriptHooks =
        script.contract.hooks.map((e) => HookSignature.from(e)).toList();
  }

  /// Analyzes the script for errors and checks for missing permissions.
  ///
  /// Throws an [AnalysisReport] if any issues are found.
  void analyze() {
    final report = AnalysisReport();

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

  AnalysisReport _analyzeFunction(FunctionDeclaration function) {
    final report = AnalysisReport();

    scope = TypeScope(scope);

    for (final parameter in function.parameters) {
      infer(parameter);
    }

    final returnType = $Type.from(function.returnType);

    for (final stmt in function.body) {
      switch (stmt) {
        case ReturnStatement():
          if (stmt.expression != null && returnType == PrimitiveType.VOID) {
            report.report(
              AnalyzerError('Void function cannot return a value: $function'),
            );
          }

          if (stmt.expression != null) {
            final type = infer(stmt.expression!);
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
          infer(stmt);
          break;
        default:
          infer(stmt);
      }
    }

    return report;
  }

  /// Infers the type of a statement.
  $Type infer(Statement statement) {
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
        scope.set(statement.name, type);
        return type;
      case BinaryExpression():
        final leftType = infer(statement.left);
        final rightType = infer(statement.right);

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
        if (statement.initializer == null && statement.type != null) {
          if (statement.type!.nullable) {
            scope.set(statement.variable, statement.type!);
            return statement.type!;
          }

          throw AnalyzerError(
            'Non-nullable type without initializer: $statement',
          );
        }

        if (statement.initializer != null && statement.type == null) {
          final type = infer(statement.initializer!);
          scope.set(statement.variable, type);
          return type;
        }

        if (statement.initializer != null && statement.type != null) {
          final type = infer(statement.initializer!);
          if (type == statement.type) {
            scope.set(statement.variable, type);
            return type;
          }

          if (type == PrimitiveType.INT &&
              statement.type == PrimitiveType.DOUBLE) {
            scope.set(statement.variable, PrimitiveType.DOUBLE);
            return PrimitiveType.DOUBLE;
          }

          throw TypeError(
            statement.type!,
            type,
          );
        }

        throw InferenceError(
          statement,
        );
      default:
        throw InferenceError(
          statement,
        );
    }
  }

  /// Looks up an undefined type in the list of structs.
  $Type lookup($Type type) {
    return type.lookup(structs);
  }
}
