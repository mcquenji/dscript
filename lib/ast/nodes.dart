part of 'ast.dart';

sealed class Statement {
  const Statement();

  Map<String, dynamic> toMap();

  Map<String, dynamic> toJson() {
    return {'node': runtimeType.toString(), ...toMap()};
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class Script extends Statement {
  final List<PermissionStmt> permissions;
  final Contract contract;

  const Script(this.permissions, this.contract);

  @override
  Map<String, dynamic> toMap() {
    return {
      'permissions': permissions,
      'contract': contract,
    };
  }
}

class PermissionStmt extends Statement {
  final String namespace;
  final String method;

  const PermissionStmt(this.namespace, this.method);

  @override
  Map<String, dynamic> toMap() {
    return {
      'namespace': namespace,
      'method': method,
    };
  }
}

class Contract extends Statement {
  final String name;
  final List<Implementation> implementations;
  final List<Hook> hooks;

  const Contract(this.name, this.implementations, this.hooks);

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'implementations': implementations,
      'hooks': hooks,
    };
  }
}

class FunctionDeclaration extends Statement {
  final List<Statement> body;
  final String name;
  final List<Parameter> parameters;
  final String returnType;

  const FunctionDeclaration({
    required this.name,
    required this.parameters,
    required this.returnType,
    required this.body,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'parameters': parameters,
      'returnType': returnType,
      'body': body,
    };
  }
}

class Implementation extends FunctionDeclaration {
  const Implementation({
    required super.name,
    required super.parameters,
    required super.returnType,
    required super.body,
  });
}

class Hook extends FunctionDeclaration {
  const Hook({
    required super.name,
    required super.parameters,
    required super.body,
  }) : super(
          returnType: 'void',
        );
}

class Parameter extends Statement {
  final String name;
  final String type;

  const Parameter(this.name, this.type);

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type,
    };
  }
}

sealed class Expression extends Statement {
  const Expression();
}

class BinaryExpression extends Expression {
  final String operator;
  final Expression left;
  final Expression right;

  const BinaryExpression(this.operator, this.left, this.right);

  @override
  Map<String, dynamic> toMap() {
    return {
      'operator': operator,
      'left': left,
      'right': right,
    };
  }
}

class Identifier extends Expression {
  final String name;

  const Identifier(this.name);

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }
}

sealed class NumericLiteral extends Expression {
  final num value;

  const NumericLiteral(this.value);

  @override
  Map<String, dynamic> toMap() {
    return {
      'value': value,
    };
  }
}

class IntegerLiteral extends NumericLiteral {
  const IntegerLiteral(super.value);
}

class DoubleLiteral extends NumericLiteral {
  const DoubleLiteral(super.value);
}

class StringLiteral extends Expression {
  final String value;

  const StringLiteral(this.value);

  @override
  Map<String, dynamic> toMap() {
    return {
      'value': value,
    };
  }
}

class NullLiteral extends Expression {
  const NullLiteral();

  @override
  Map<String, dynamic> toMap() {
    return {};
  }
}

class BooleanLiteral extends BooleanExpression {
  final bool value;

  const BooleanLiteral(this.value);

  @override
  Map<String, dynamic> toMap() {
    return {
      'value': value,
    };
  }
}

class ReturnStatement extends Statement {
  final Expression expression;

  const ReturnStatement(this.expression);

  @override
  Map<String, dynamic> toMap() {
    return {
      'expression': expression,
    };
  }
}

class AssignmentStatement extends Statement {
  final String variable;
  final Expression expression;

  const AssignmentStatement(this.variable, this.expression);

  @override
  Map<String, dynamic> toMap() {
    return {
      'variable': variable,
      'expression': expression,
    };
  }
}

sealed class FlowControlStatement extends Statement {
  const FlowControlStatement();
}

class IfStatement extends FlowControlStatement {
  final BooleanExpression condition;
  final List<Statement> body;
  final ElseStatement? elseBody;

  const IfStatement(this.condition, this.body, this.elseBody);

  @override
  Map<String, dynamic> toMap() {
    return {
      'condition': condition,
      'body': body,
      'elseBody': elseBody,
    };
  }
}

class ElseStatement extends FlowControlStatement {
  final List<Statement> body;

  const ElseStatement(this.body);

  @override
  Map<String, dynamic> toMap() {
    return {
      'body': body,
    };
  }
}

class ElseIfStatement extends ElseStatement {
  final BooleanExpression condition;

  const ElseIfStatement(this.condition, super.body);

  @override
  Map<String, dynamic> toMap() {
    return {
      'condition': condition,
      'body': body,
    };
  }
}

class WhileStatement extends FlowControlStatement {
  final BooleanExpression condition;
  final List<Statement> body;

  const WhileStatement(this.condition, this.body);

  @override
  Map<String, dynamic> toMap() {
    return {
      'condition': condition,
      'body': body,
    };
  }
}

sealed class BooleanExpression extends Expression {
  const BooleanExpression();
}

class ComparisonExpression extends BooleanExpression {
  final String operator;
  final Expression left;
  final Expression right;

  const ComparisonExpression(this.operator, this.left, this.right);

  @override
  Map<String, dynamic> toMap() {
    return {
      'operator': operator,
      'left': left,
      'right': right,
    };
  }
}
