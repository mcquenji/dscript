part of 'runtime.dart';

/// Represents a variable in the runtime environment.
///
/// Holds a [value] of type [RuntimeValue], and indicates whether the variable
/// is [mutable] (can be changed) or [nullable] (can hold null values).
class RuntimeVariable {
  /// The runtime value of the variable.
  RuntimeValue value;

  /// Indicates if the variable can be modified.
  final bool mutable;

  /// Indicates if the variable can hold null values.
  final bool nullable;

  /// Represents a variable in the runtime environment.
  ///
  /// Holds a [value] of type [RuntimeValue], and indicates whether the variable
  /// is [mutable] (can be changed) or [nullable] (can hold null values).
  @internal
  RuntimeVariable(this.value, {this.mutable = true, this.nullable = false});
}

/// Represents an execution environment with scoped variables and built-in constants.
///
/// Supports nested scopes for function calls and provides lookups for variables,
/// falling back to parent scopes when a name is not found.
class Scope {
  /// Map storing variable names to their corresponding runtime values.
  @internal
  final Map<String, RuntimeVariable> variables = {
    'pi': RuntimeVariable(const RuntimeValue(pi), mutable: false),
    'e': RuntimeVariable(const RuntimeValue(e), mutable: false),
    'sqrt2': RuntimeVariable(const RuntimeValue(sqrt2), mutable: false),
    'sqrt1_2': RuntimeVariable(const RuntimeValue(sqrt1_2), mutable: false),
    'log2e': RuntimeVariable(const RuntimeValue(log2e), mutable: false),
    'log10e': RuntimeVariable(const RuntimeValue(log10e), mutable: false),
    'ln2': RuntimeVariable(const RuntimeValue(ln2), mutable: false),
    'ln10': RuntimeVariable(const RuntimeValue(ln10), mutable: false),
  };

  /// Optional parent scope for resolving names not found in this scope.
  final Scope? _parent;

  /// Creates a new [Scope], optionally nested under a [_parent] scope.
  Scope([this._parent]);

  /// Defines or updates the variable [name] with the given [value] in this scope.
  void set(String name, RuntimeValue value,
      {bool mutable = true, bool nullable = false}) {
    if (!variables.containsKey(name)) {
      variables[name] =
          RuntimeVariable(value, mutable: mutable, nullable: nullable);
    } else {
      final variable = variables[name]!;

      if (!variable.mutable) {
        throw RuntimeException('Cannot modify immutable variable $name');
      }

      if (!variable.nullable && value is NullValue) {
        throw RuntimeException(
            'Cannot assign null to non-nullable variable $name');
      }

      variable.value = value;
    }
  }

  /// Retrieves the runtime value for [name], searching this scope first,
  /// then delegating to the parent scope if not found.
  ///
  /// Throws an [Exception] if the variable is not defined in any enclosing scope.
  RuntimeValue get(String name) {
    if (variables.containsKey(name)) {
      return variables[name]!.value;
    } else if (_parent != null) {
      return _parent.get(name);
    } else {
      throw RuntimeException('Variable $name not defined');
    }
  }

  /// Returns the root-most ancestor scope in a chain of nested scopes.
  ///
  /// Useful for resetting the environment after a function call.
  Scope get root => _parent?.root ?? this;

  /// Returns the parent scope of this scope, or itself if no parent exists.
  Scope pop() {
    return _parent ?? this;
  }
}

/// Evaluates DSL statements and expressions.
class Interpreter {
  /// The current scope for variable lookups and assignments.
  Scope scope = Scope();

  /// A map of namespaces to their provided bindings.
  final List<LibraryBinding> bindings;

  /// Permissions granted to the script.
  final List<ScriptPermission> permissions;

  /// Evaluates DSL statements and expressions.
  Interpreter({required this.bindings, required this.permissions});

  RuntimeValue _external(ExternalCall call) {
    if (!bindings.any((b) => b.name == call.namespace)) {
      throw RuntimeException('No such namespace: ${call.namespace}');
    }

    final binding = bindings.firstWhere((b) => b.name == call.namespace);

    if (!binding.bindings.any((b) => b.name == call.method)) {
      throw RuntimeException(
        'No such function defined in ${binding.name}: ${call.method}',
      );
    }

    final function = binding.bindings.firstWhere((b) => b.name == call.method);

    return RuntimeValue(
      function(
        call.positionalArgs
            .map(
              (arg) => eval(arg),
            )
            .toList(),
        namedArgs: call.namedArgs.map(
          (name, expr) => MapEntry(
            Symbol(name),
            eval(
              expr,
            ),
          ),
        ),
      ),
    );
  }

  /// Evaluates a single [Statement] node and returns its [RuntimeValue].
  ///
  /// Handles expressions, assignments, and binary operations; control flow
  /// and function declarations are not directly evaluated here.
  RuntimeValue eval(Statement stmt) {
    switch (stmt) {
      case Identifier():
        return scope.get(stmt.name);
      case StringLiteral():
        return RuntimeValue(stmt.value);
      case NullLiteral():
        return const NullValue();
      case IntegerLiteral():
        return RuntimeValue(stmt.value);
      case DoubleLiteral():
        return RuntimeValue(stmt.value);
      case BooleanLiteral():
        return RuntimeValue(stmt.value);
      case BinaryExpression():
        return _evalBinop(stmt);
      case AssignmentStatement():
        final assign = stmt;
        final value = eval(assign.expression);
        scope.set(assign.variable, value);
        return value;
      case ExternalCall():
        return _external(stmt);
      case ConstDeclaration():
        if (stmt.initializer == null) {
          throw const RuntimeException(
            'Const variables must have an initializer',
          );
        }
        final value = eval(stmt.initializer!);
        scope.set(
          stmt.variable,
          value,
          mutable: false,
          nullable: stmt.type?.nullable ?? value.type.nullable,
        );
        return value;
      case FinalDeclaration():
        if (stmt.initializer == null) {
          throw const RuntimeException(
            'Final variables must have an initializer',
          );
        }
        final value = eval(stmt.initializer!);
        scope.set(
          stmt.variable,
          value,
          mutable: false,
          nullable: stmt.type?.nullable ?? value.type.nullable,
        );
        return value;
      case VarDeclaration():
        if (stmt.initializer != null) {
          final value = eval(stmt.initializer!);
          scope.set(
            stmt.variable,
            value,
            mutable: true,
            nullable: stmt.type?.nullable ?? value.type.nullable,
          );

          return value;
        } else if (stmt.type != null) {
          final type = stmt.type!;
          if (type.nullable) {
            scope.set(
              stmt.variable,
              const NullValue(),
              mutable: true,
              nullable: true,
            );

            return const NullValue();
          } else {
            throw RuntimeException(
              'Non-nullable variable ${stmt.variable} must be initialized',
            );
          }
        } else {
          throw RuntimeException(
            'Variable ${stmt.variable} must have a type or initializer',
          );
        }

      case ReturnStatement():
        throw const RuntimeException(
          'Return should be handled in function invocation',
        );
      default:
        throw RuntimeException('Unsupported statement: ${stmt.runtimeType}');
    }
  }

  /// Executes the given [FunctionDeclaration] with the provided [args].
  RuntimeValue exec(
    FunctionDeclaration function,
    Map<String, dynamic> args,
  ) {
// Create a nested scope for this invocation
    scope = Scope(scope);

    try {
      // Bind each parameter from provided args
      for (final param in function.parameters) {
        final argValue = args[param.name];
        final actualType = $Type.from(
          argValue.runtimeType.toString(),
        );

        if (!actualType.canCast(param.type)) {
          throw RuntimeException(
            'Cannot assign $actualType to ${param.name} of type ${param.type}',
          );
        }

        scope.set(
          param.name,
          RuntimeValue(actualType.cast(param.type, argValue)),
          mutable: true,
          nullable: param.type.nullable,
        );
      }

      // Execute the function body
      RuntimeValue result = const NullValue();

      for (final stmt in function.body) {
        if (stmt is ReturnStatement) {
          if (stmt.expression != null) {
            result = eval(stmt.expression!);
          }
          break;
        }
        eval(stmt);
      }

      return result.cast(function.returnType);
    } finally {
      scope = scope.pop();
    }
  }

  /// Evaluates a binary expression [binop], handling numeric, string, and boolean ops.
  RuntimeValue _evalBinop(BinaryExpression binop) {
    final left = eval(binop.left);
    final right = eval(binop.right);

    // Numeric operations
    if ((left.type == PrimitiveType.DOUBLE || left.type == PrimitiveType.INT) &&
        (right.type == PrimitiveType.DOUBLE ||
            right.type == PrimitiveType.INT)) {
      switch (binop.operator) {
        case '+':
          return RuntimeValue(left.value + right.value);
        case '-':
          return RuntimeValue(left.value - right.value);
        case '*':
          return RuntimeValue(left.value * right.value);
        case '/':
          if (right.value == 0) {
            throw const RuntimeException('Division by zero');
          }
          return RuntimeValue(left.value / right.value);
        case '%':
          return RuntimeValue(left.value % right.value);
        case '==':
          return RuntimeValue(left.value == right.value);
        case '!=':
          return RuntimeValue(left.value != right.value);
        case '<':
          return RuntimeValue(left.value < right.value);
        case '<=':
          return RuntimeValue(left.value <= right.value);
        case '>':
          return RuntimeValue(left.value > right.value);
        case '>=':
          return RuntimeValue(left.value >= right.value);
        default:
          throw RuntimeException('Invalid operator: ${binop.operator}');
      }
    }

    // String concatenation and comparison
    if (left.type == PrimitiveType.STRING ||
        right.type == PrimitiveType.STRING) {
      final l = left.type == PrimitiveType.STRING ? left.value : '';
      final r = right.type == PrimitiveType.STRING ? right.value : '';
      switch (binop.operator) {
        case '+':
          return RuntimeValue(l + r);
        case '==':
          return RuntimeValue(l == r);
        case '!=':
          return RuntimeValue(l != r);
        default:
          throw RuntimeException('Invalid string operator: ${binop.operator}');
      }
    }

    // Boolean logical ops
    if (left.type == PrimitiveType.BOOL && right.type == PrimitiveType.BOOL) {
      switch (binop.operator) {
        case '&&':
          return RuntimeValue(left.value && right.value);
        case '||':
          return RuntimeValue(left.value || right.value);
        case '==':
          return RuntimeValue(left.value == right.value);
        case '!=':
          return RuntimeValue(left.value != right.value);
        default:
          throw RuntimeException('Invalid boolean operator: ${binop.operator}');
      }
    }

    switch (binop.operator) {
      case '==':
        return RuntimeValue(left.value == right.value);
      case '!=':
        return RuntimeValue(left.value != right.value);
      default:
        throw RuntimeException('Unsupported operands for ${binop.operator}');
    }
  }
}
