part of 'runtime.dart';

class _RuntimeVariable {
  RuntimeValue value;
  final bool mutable;
  final bool nullable;
  _RuntimeVariable(this.value, {this.mutable = true, this.nullable = false});
}

/// Represents an execution environment with scoped variables and built-in constants.
///
/// Supports nested scopes for function calls and provides lookups for variables,
/// falling back to parent scopes when a name is not found.
class Scope {
  /// Map storing variable names to their corresponding runtime values.
  final Map<String, _RuntimeVariable> _variables = {
    'pi': _RuntimeVariable(const DoubleValue(pi), mutable: false),
    'e': _RuntimeVariable(const DoubleValue(e), mutable: false),
    'sqrt2': _RuntimeVariable(const DoubleValue(sqrt2), mutable: false),
    'sqrt1_2': _RuntimeVariable(const DoubleValue(sqrt1_2), mutable: false),
  };

  /// Optional parent scope for resolving names not found in this scope.
  final Scope? _parent;

  /// Creates a new [Scope], optionally nested under a [_parent] scope.
  Scope([this._parent]);

  /// Defines or updates the variable [name] with the given [value] in this scope.
  void set(String name, RuntimeValue value,
      {bool mutable = true, bool nullable = false}) {
    if (!_variables.containsKey(name)) {
      _variables[name] =
          _RuntimeVariable(value, mutable: mutable, nullable: nullable);
    } else {
      final variable = _variables[name]!;

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
    if (_variables.containsKey(name)) {
      return _variables[name]!.value;
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

    final function =
        binding.bindings.firstWhere((b) => b.name == call.method).function;

    return function(
      call.positionalArgs,
      namedArgs: call.namedArgs,
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
        return StringValue(stmt.value);
      case NullLiteral():
        return const NullValue();
      case IntegerLiteral():
        return IntegerValue(stmt.value);
      case DoubleLiteral():
        return DoubleValue(stmt.value);
      case BooleanLiteral():
        return BooleanValue(stmt.value);
      case BinaryExpression():
        return _evalBinop(stmt);
      case AssignmentStatement():
        final assign = stmt;
        final value = eval(assign.expression);
        scope.set(assign.variable, value);
        return value;
      case ExternalCall():
        return _external(stmt);
      // case ConstVariableDeclaration():
      //   if (stmt.initializer == null) {
      //     throw RuntimeException('Const variables must have an initializer');
      //   }
      //   final value = _eval(stmt.initializer!);
      //   scope.set(stmt.variable, value, mutable: false);
      // case FinalVariableDeclaration():
      //   if (stmt.initializer == null) {
      //     throw RuntimeException('Final variables must have an initializer');
      //   }
      //   final value = _eval(stmt.initializer!);
      //   scope.set(stmt.variable, value, mutable: false);
      //   return value;
      // case VarVariableDeclaration():

      case ReturnStatement():
        throw const RuntimeException(
            'Return should be handled in function invocation');
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
        if (argValue == null) {
          throw RuntimeException('Missing argument: ${param.name}');
        }
        switch (param.type) {
          case 'int':
            scope.set(param.name, IntegerValue(argValue as int));
            break;
          case 'double':
            scope.set(param.name, DoubleValue(argValue as double));
            break;
          case 'boolean':
            scope.set(param.name, BooleanValue(argValue as bool));
            break;
          case 'string':
            scope.set(param.name, StringValue(argValue as String));
            break;
          default:
            throw RuntimeException('Invalid parameter type: ${param.type}');
        }
      }

      // Execute the function body
      RuntimeValue result = const NullValue();
      for (final stmt in function.body) {
        if (stmt is ReturnStatement) {
          if (stmt.expression == null && function.returnType != 'void') {
            throw RuntimeException(
              'Function ${function.name} must return a value',
            );
          }

          if (stmt.expression != null) {
            result = eval(stmt.expression!);
          }
          break;
        }
        eval(stmt);
      }

      // Check and perform implicit casts on return
      if (result.type != function.returnType &&
          !(result is NullValue && function.returnType == 'void')) {
        if (result.hasImplicitCast(function.returnType)) {
          return result.implictCast(function.returnType);
        }
        throw RuntimeException(
          'Cannot return ${result.type} from ${function.returnType} function',
        );
      }

      return result;
    } finally {
      scope = scope.pop();
    }
  }

  /// Evaluates a binary expression [binop], handling numeric, string, and boolean ops.
  RuntimeValue _evalBinop(BinaryExpression binop) {
    final left = eval(binop.left);
    final right = eval(binop.right);

    // Numeric operations
    if (left is NumberValue && right is NumberValue) {
      bool intResult = left is IntegerValue && right is IntegerValue;
      num raw;
      switch (binop.operator) {
        case '+':
          raw = left.value + right.value;
          break;
        case '-':
          raw = left.value - right.value;
          break;
        case '*':
          raw = left.value * right.value;
          break;
        case '/':
          if (right.value == 0) {
            throw const RuntimeException('Division by zero');
          }
          raw = left.value / right.value;
          intResult = false;
          break;
        case '%':
          raw = left.value % right.value;
          intResult = true;
          break;
        case '==':
          return BooleanValue(left.value == right.value);
        case '!=':
          return BooleanValue(left.value != right.value);
        case '<':
          return BooleanValue(left.value < right.value);
        case '<=':
          return BooleanValue(left.value <= right.value);
        case '>':
          return BooleanValue(left.value > right.value);
        case '>=':
          return BooleanValue(left.value >= right.value);
        default:
          throw RuntimeException('Invalid operator: ${binop.operator}');
      }
      return intResult ? IntegerValue(raw) : DoubleValue(raw);
    }

    // String concatenation and comparison
    if (left is StringValue || right is StringValue) {
      final l = left is StringValue ? left.value : '';
      final r = right is StringValue ? right.value : '';
      switch (binop.operator) {
        case '+':
          return StringValue(l + r);
        case '==':
          return BooleanValue(l == r);
        case '!=':
          return BooleanValue(l != r);
        default:
          throw RuntimeException('Invalid string operator: ${binop.operator}');
      }
    }

    // Boolean logical ops
    if (left is BooleanValue && right is BooleanValue) {
      switch (binop.operator) {
        case '&&':
          return BooleanValue(left.value && right.value);
        case '||':
          return BooleanValue(left.value || right.value);
        case '==':
          return BooleanValue(left.value == right.value);
        case '!=':
          return BooleanValue(left.value != right.value);
        default:
          throw RuntimeException('Invalid boolean operator: ${binop.operator}');
      }
    }

    throw RuntimeException('Unsupported operands for ${binop.operator}');
  }
}
