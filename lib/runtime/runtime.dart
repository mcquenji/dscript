import 'dart:math';

import 'package:dscript/dscript.dart';

part 'values.dart';

class Scope {
  final Map<String, dynamic> _variables = {
    'true': const BooleanValue(true),
    'false': const BooleanValue(false),
    'null': const NullValue(),
    'pi': const DoubleValue(pi),
    'e': const DoubleValue(e),
  };
  final Scope? _parent;

  Scope([this._parent]);

  void set(String name, RuntimeValue value) {
    _variables[name] = value;
  }

  RuntimeValue get(String name) {
    if (_variables.containsKey(name)) {
      return _variables[name];
    } else if (_parent != null) {
      return _parent.get(name);
    } else {
      throw Exception('Variable $name not found');
    }
  }

  Scope get root {
    return _parent?.root ?? this;
  }
}

class ScriptPermission {
  final String namespace;
  final String method;

  const ScriptPermission._(this.namespace, this.method);

  const ScriptPermission.custom(this.method) : namespace = 'external';

  @override
  String toString() {
    return '$namespace::$method';
  }

  static const readFiles = ScriptPermission._('fs', 'read');
  static const writeFiles = ScriptPermission._('fs', 'write');
  static const networkClient = ScriptPermission._('ntwk', 'client');
  static const networkServer = ScriptPermission._('ntwk', 'server');

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    if (other is! ScriptPermission) return false;

    return namespace == other.namespace && method == other.method;
  }

  @override
  int get hashCode => Object.hash(namespace, method);
}

class Runtime {
  Scope scope = Scope();

  final List<ScriptPermission> _permissions = [];

  final List<ScriptPermission> _requiredPermissions = [];

  final Script _script;

  Runtime(this._script) {
    _requiredPermissions.addAll(
      _script.permissions.map((p) => ScriptPermission._(p.namespace, p.method)),
    );
  }

  List<ScriptPermission> get permissions => List.unmodifiable(_permissions);
  List<ScriptPermission> get missingPermissions =>
      _requiredPermissions.where((p) => !_permissions.contains(p)).toList();

  void allow(ScriptPermission permission, [bool allowed = true]) {
    if (allowed) {
      _permissions.add(permission);
    } else {
      _permissions.removeWhere(
        (p) =>
            p.namespace == permission.namespace &&
            p.method == permission.method,
      );
    }
  }

  RuntimeValue _eval(Statement stmt) {
    switch (stmt) {
      case ComparisonExpression():
      case IfStatement():
      case ElseStatement():
      case WhileStatement():
        throw UnimplementedError(
          'Control flow statements are not implemented yet.',
        );

      case Identifier():
        return scope.get(stmt.name);
      case StringLiteral():
        return StringValue(
          stmt.value,
        );
      case NullLiteral():
        return const NullValue();

      case IntegerLiteral():
        return IntegerValue(
          stmt.value,
        );
      case DoubleLiteral():
        return DoubleValue(
          stmt.value,
        );
      case BooleanLiteral():
        return BooleanValue(
          stmt.value,
        );
      case BinaryExpression():
        return _evalBinop(stmt);
      case AssignmentStatement():
        final value = _eval(stmt.expression);
        scope.set(stmt.variable, value);
        return value;
      case ReturnStatement():
      case Script():
      case PermissionStmt():
      case Contract():
      case FunctionDeclaration():
      case Parameter():
        throw Exception(
          'Unexpected statement in function body: ${stmt.runtimeType}',
        );
    }
  }

  RuntimeValue _invoke(
    FunctionDeclaration function,
    Map<String, dynamic> args,
  ) {
    if (missingPermissions.isNotEmpty) {
      throw Exception(
        'Missing permissions: ${missingPermissions.join(', ')}',
      );
    }

    scope = Scope(scope);

    for (final param in function.parameters) {
      if (args.containsKey(param.name)) {
        if (param.type == 'string') {
          scope.set(param.name, StringValue(args[param.name]));
        } else if (param.type == 'int') {
          scope.set(param.name, IntegerValue(args[param.name]));
        } else if (param.type == 'double') {
          scope.set(param.name, DoubleValue(args[param.name]));
        } else if (param.type == 'boolean') {
          scope.set(param.name, BooleanValue(args[param.name]));
        } else {
          throw Exception('Invalid parameter type: ${param.type}');
        }
      } else {
        throw Exception('Missing argument: ${param.name}');
      }
    }

    RuntimeValue result = const NullValue();

    for (final stmt in function.body) {
      if (stmt is ReturnStatement) {
        result = _eval(stmt.expression);
        break;
      }

      _eval(stmt);
    }

    scope = scope.root;

    if (result.type != function.returnType) {
      if (result.hasImplicitCast(function.returnType)) {
        return result.implictCast(function.returnType);
      }

      throw Exception(
        'Cannot return ${result.type} from ${function.returnType} function',
      );
    }

    return result;
  }

  RuntimeValue _evalBinop(BinaryExpression binop) {
    final left = _eval(binop.left);
    final right = _eval(binop.right);

    if (left is NumberValue && right is NumberValue) {
      var intResult = left is IntegerValue && right is IntegerValue;

      final num result;

      switch (binop.operator) {
        case '+':
          result = left.value + right.value;
          break;
        case '-':
          result = left.value - right.value;
          break;
        case '%':
          result = left.value % right.value;
          intResult = true;
          break;
        case '*':
          result = left.value * right.value;
          break;
        case '/':
          if (right.value == 0) {
            throw Exception('Division by zero');
          }
          result = left.value / right.value;
          intResult = false;
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
          throw Exception('Invalid number operator: ${binop.operator}');
      }

      if (intResult) {
        return IntegerValue(result);
      } else {
        return DoubleValue(result);
      }
    } else if (left is StringValue || right is StringValue) {
      final leftStr = left is StringValue ? left.value : '';
      final rightStr = right is StringValue ? right.value : '';

      switch (binop.operator) {
        case '+':
          return StringValue(leftStr + rightStr);
        case '==':
          return BooleanValue(leftStr == rightStr);
        case '!=':
          return BooleanValue(leftStr != rightStr);
        default:
          throw Exception('Invalid string operator: ${binop.operator}');
      }
    } else if (left is BooleanValue && right is BooleanValue) {
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
          throw Exception('Invalid boolean operator: ${binop.operator}');
      }
    } else {
      throw Exception('Invalid operands for operator: ${binop.operator}');
    }
  }

  dynamic run(String name, Map<String, dynamic> args) {
    final impl = _script.contract.implementations.firstWhere(
      (impl) => impl.name == name,
      orElse: () => throw Exception('Implementation $name not found'),
    );

    return _invoke(impl, args).value;
  }

  void invoke(String event, Map<String, dynamic> args) {
    if (!_script.contract.hooks.any((hook) => hook.name == event)) {
      return;
    }

    final hook = _script.contract.hooks.firstWhere(
      (hook) => hook.name == event,
    );

    _invoke(hook, args);
  }
}
