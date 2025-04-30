part of 'ast.dart';

sealed class Statement {
  const Statement();

  Map<String, dynamic> toJson();

  @override
  String toString() {
    final json = toJson();
    json['node'] = runtimeType.toString();
    return jsonEncode(json);
  }
}

class Script extends Statement {
  final List<Permission> permissions;
  final Contract contract;

  const Script(this.permissions, this.contract);

  @override
  Map<String, dynamic> toJson() {
    return {
      'permissions': permissions,
      'contract': contract,
    };
  }
}

class Permission extends Statement {
  final String namespace;
  final String permission;

  const Permission(this.namespace, this.permission);

  @override
  Map<String, dynamic> toJson() {
    return {
      'namespace': namespace,
      'permission': permission,
    };
  }
}

class Contract extends Statement {
  final String name;
  final List<Implementation> body;

  const Contract(this.name, this.body);

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'body': body,
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
  Map<String, dynamic> toJson() {
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
    required super.returnType,
    required super.body,
  });
}

class Parameter extends Statement {
  final String name;
  final String type;

  const Parameter(this.name, this.type);

  @override
  Map<String, dynamic> toJson() {
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
  Map<String, dynamic> toJson() {
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
  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}

sealed class NumericLiteral extends Expression {
  final num value;

  const NumericLiteral(this.value);

  @override
  Map<String, dynamic> toJson() {
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
  Map<String, dynamic> toJson() {
    return {
      'value': value,
    };
  }
}

class BooleanLiteral extends BooleanExpression {
  final String value;

  const BooleanLiteral(this.value);

  @override
  Map<String, dynamic> toJson() {
    return {
      'value': value,
    };
  }
}

class ReturnStatement extends Statement {
  final Expression expression;

  const ReturnStatement(this.expression);

  @override
  Map<String, dynamic> toJson() {
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
  Map<String, dynamic> toJson() {
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
  Map<String, dynamic> toJson() {
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
  Map<String, dynamic> toJson() {
    return {
      'body': body,
    };
  }
}

class ElseIfStatement extends ElseStatement {
  final BooleanExpression condition;

  const ElseIfStatement(this.condition, super.body);

  @override
  Map<String, dynamic> toJson() {
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
  Map<String, dynamic> toJson() {
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
  Map<String, dynamic> toJson() {
    return {
      'operator': operator,
      'left': left,
      'right': right,
    };
  }
}
