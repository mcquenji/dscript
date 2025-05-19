part of 'ast.dart';

/// Base class for all AST statement nodes.
///
/// Each [Statement] can be converted to a JSON-compatible map via [toMap],
/// and serialized to a JSON string via [toJson] or [toString].
sealed class Statement {
  /// The starting line number of the statement in the source code.
  final int lineStart;

  /// The starting column number of the statement in the source code.
  final int columnStart;

  /// The ending line number of the statement in the source code.
  final int lineEnd;

  /// The ending column number of the statement in the source code.
  final int columnEnd;

  /// Creates an instance of a [Statement].
  const Statement({
    this.lineStart = -1,
    this.columnStart = -1,
    this.lineEnd = -1,
    this.columnEnd = -1,
  });

  /// Converts this AST node into a map representation.
  ///
  /// Subclasses must implement this to provide their specific fields.
  Map<String, dynamic> toMap();

  /// Serializes this AST node to JSON.
  ///
  /// The output map will include a `node` key with the runtime type name,
  /// merged with the result of [toMap].
  Map<String, dynamic> toJson() {
    return {'node': runtimeType.toString(), ...toMap()};
  }

  @override

  /// Returns the JSON-encoded string representation of this node.
  String toString() {
    return jsonEncode(this);
  }
}

/// Represents the root of a script, containing permissions and a contract.
class Script extends Statement {
  /// List of permission statements declared at the top of the script.
  final List<PermissionStmt> permissions;

  /// The main contract declared in the script.
  final Contract contract;

  /// The author of the script.
  final String author;

  /// The version of the script.
  final Version version;

  /// Optional description of the script.
  final String? description;

  /// Optional license information for the script.
  final String? license;

  /// Optional repository URL for the script.
  final String? repo;

  /// The name of the script.
  final String name;

  /// Optional website URL for the script.
  final String? website;

  /// Creates a [Script] with the given [permissions] and [contract].
  const Script(
    this.permissions,
    this.contract, {
    required this.author,
    required this.version,
    required this.name,
    this.description,
    this.license,
    this.repo,
    this.website,
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'permissions': permissions,
      'contract': contract,
    };
  }
}

/// AST node for a permissions declaration: `namespace::method`.
class PermissionStmt extends Statement {
  /// The namespace portion of the permission.
  final String namespace;

  /// The method or action portion of the permission.
  final String method;

  /// Creates a [PermissionStmt] for [namespace] and [method].
  const PermissionStmt(
    this.namespace,
    this.method, {
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'namespace': namespace,
      'method': method,
    };
  }
}

/// AST node for a contract declaration containing implementations and hooks.
class Contract extends Statement {
  /// The identifier name of the contract.
  final String name;

  /// List of function implementations required by the contract.
  final List<Implementation> implementations;

  /// List of optional hook definitions in the contract.
  final List<Hook> hooks;

  /// Creates a [Contract] named [name] with [implementations] and [hooks].
  const Contract(
    this.name,
    this.implementations,
    this.hooks, {
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'implementations': implementations,
      'hooks': hooks,
    };
  }
}

/// AST node for a generic function declaration (base for impl and hook).
class FunctionDeclaration extends Statement {
  /// The block of statements inside the function.
  final List<Statement> body;

  /// The function's identifier name.
  final String name;

  /// Ordered list of parameters accepted by the function.
  final List<Parameter> parameters;

  /// Return type of the function as a string.
  final String returnType;

  /// Creates a [FunctionDeclaration] with named fields.
  const FunctionDeclaration({
    required this.name,
    required this.parameters,
    required this.returnType,
    required this.body,
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
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

  /// Checks if this function is equivalent to [other].
  ///
  /// Two functions are considered the same if they have the same name,
  /// the same number of parameters, and the same return type.
  ///
  /// Function bodies and order of parameters are not considered in this equality check.
  bool sameAs(FunctionDeclaration other) {
    return name == other.name &&
        parameters.length == other.parameters.length &&
        returnType == other.returnType;
  }
}

/// AST node for a contract implementation function.
///
/// Extends [FunctionDeclaration] without changing its structure.
class Implementation extends FunctionDeclaration {
  /// Creates an [Implementation] with required name, parameters, returnType, and body.
  const Implementation({
    required super.name,
    required super.parameters,
    required super.returnType,
    required super.body,
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
  });
}

/// AST node for a hook function, always returns void.
class Hook extends FunctionDeclaration {
  /// Creates a [Hook] with required name, parameters, and body.
  /// The returnType is always `void`.
  const Hook({
    required super.name,
    required super.parameters,
    required super.body,
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
  }) : super(
          returnType: 'void',
        );
}

/// AST node representing a function parameter: `type name`.
class Parameter extends Statement {
  /// The parameter's identifier.
  final String name;

  /// The declared type of the parameter.
  final String type;

  /// Indicating if the parameter is nullable.
  final bool nullable;

  /// AST node representing a function parameter: `type name`.
  const Parameter(
    this.name,
    this.type,
    this.nullable, {
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type,
    };
  }
}

/// Base class for all expression nodes.
sealed class Expression extends Statement {
  /// Creates an [Expression].
  const Expression({
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
  });
}

/// AST node for a binary expression with an operator.
class BinaryExpression extends Expression {
  /// The operator token text (e.g., `+`, `-`, `==`).
  final String operator;

  /// Left-hand side expression.
  final Expression left;

  /// Right-hand side expression.
  final Expression right;

  /// Creates a [BinaryExpression] with [operator], [left], and [right].
  const BinaryExpression(
    this.operator,
    this.left,
    this.right, {
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'operator': operator,
      'left': left,
      'right': right,
    };
  }
}

/// AST node for an identifier in expressions.
class Identifier extends Expression {
  /// The identifier name.
  final String name;

  /// Creates an [Identifier] with the given [name].
  const Identifier(
    this.name, {
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
  });

  @override
  Map<String, dynamic> toMap() {
    return {'name': name};
  }
}

/// Base class for numeric literals (integer or double).
sealed class NumericLiteral extends Expression {
  /// The numeric value.
  final num value;

  /// Creates a [NumericLiteral] with the given [value].
  const NumericLiteral(
    this.value, {
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
  });

  @override
  Map<String, dynamic> toMap() {
    return {'value': value};
  }
}

/// AST node for integer literals.
class IntegerLiteral extends NumericLiteral {
  /// Creates an [IntegerLiteral] with the given numeric [value].
  const IntegerLiteral(
    super.value, {
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
  });
}

/// AST node for double (floating-point) literals.
class DoubleLiteral extends NumericLiteral {
  /// Creates a [DoubleLiteral] with the given numeric [value].
  const DoubleLiteral(
    super.value, {
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
  });
}

/// AST node for string literals.
class StringLiteral extends Expression {
  /// The literal content, without surrounding quotes.
  final String value;

  /// Creates a [StringLiteral] with the given [value].
  const StringLiteral(
    this.value, {
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
  });

  @override
  Map<String, dynamic> toMap() {
    return {'value': value};
  }
}

/// AST node representing a null literal.
class NullLiteral extends Expression {
  /// Creates a [NullLiteral].
  const NullLiteral();

  @override
  Map<String, dynamic> toMap() {
    return {};
  }
}

/// Base class for boolean expressions (e.g., comparisons).
sealed class BooleanExpression extends Expression {
  /// Creates a [BooleanExpression].
  const BooleanExpression({
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
  });
}

/// AST node for boolean literals.
class BooleanLiteral extends BooleanExpression {
  /// The boolean value.
  final bool value;

  /// Creates a [BooleanLiteral] with the given [value].
  const BooleanLiteral(
    this.value, {
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
  });

  @override
  Map<String, dynamic> toMap() {
    return {'value': value};
  }
}

/// AST node for comparison expressions (`<`, `>`, `==`, etc.).
class ComparisonExpression extends BooleanExpression {
  /// The operator token text (e.g., `<`, `>=`).
  final String operator;

  /// Left-hand side expression.
  final Expression left;

  /// Right-hand side expression.
  final Expression right;

  /// Creates a [ComparisonExpression] with [operator], [left], and [right].
  const ComparisonExpression(
    this.operator,
    this.left,
    this.right, {
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'operator': operator,
      'left': left,
      'right': right,
    };
  }
}

/// AST node for a return statement: `return expression;`.
class ReturnStatement extends Statement {
  /// The expression to return.
  final Expression? expression;

  /// Creates a [ReturnStatement] for the given [expression].
  const ReturnStatement(
    this.expression, {
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
  });

  @override
  Map<String, dynamic> toMap() {
    return {'expression': expression};
  }
}

/// AST node for variable assignment: `variable = expression;`.
class AssignmentStatement extends Statement {
  /// The target variable name.
  final String variable;

  /// The expression whose value is assigned.
  final Expression expression;

  /// Creates an [AssignmentStatement] with [variable] and [expression].
  const AssignmentStatement(
    this.variable,
    this.expression, {
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'variable': variable,
      'expression': expression,
    };
  }
}

/// AST node for variable declaration: `[var | final | const] variable = expression;`.
sealed class VariableDeclaration extends Statement {
  /// The variable name.
  final String variable;

  /// The expression assigned to the variable.
  final Expression? initializer;

  /// The declared type of the variable, if any.
  final $Type? type;

  /// Creates a [VariableDeclaration] with [type], [variable], and [initializer].
  const VariableDeclaration(
    this.variable,
    this.initializer, {
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
    this.type,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'variable': variable,
      'expression': initializer,
      'type': type?.toMap(),
    };
  }
}

/// AST node for final variable declaration: `final variable = expression;`.
class FinalDeclaration extends VariableDeclaration {
  /// Creates a [FinalDeclaration] with [variable] and [expression].
  const FinalDeclaration(
    super.variable,
    super.expression, {
    super.type,
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
  });
}

/// AST node for const variable declaration: `const variable = expression;`.
class ConstDeclaration extends VariableDeclaration {
  /// Creates a [ConstDeclaration] with [variable] and [expression].
  const ConstDeclaration(
    super.variable,
    super.expression, {
    super.type,
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
  });
}

/// AST node for var variable declaration: `var variable = expression;`.
class VarDeclaration extends VariableDeclaration {
  /// Creates a [VarDeclaration] with [variable] and [expression].
  const VarDeclaration(
    super.variable,
    super.expression, {
    super.type,
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
  });
}

/// Base class for loop and conditional control flow statements.
sealed class FlowControlStatement extends Statement {
  /// Creates a [FlowControlStatement].
  const FlowControlStatement({
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
  });
}

/// AST node for an `if` statement with optional else or elseif.
class IfStatement extends FlowControlStatement {
  /// Boolean condition expression.
  final BooleanExpression condition;

  /// List of statements in the `if` block.
  final List<Statement> body;

  /// Optional else branch as [ElseStatement] or [ElseIfStatement].
  final ElseStatement? elseBody;

  /// Creates an [IfStatement] with [condition], [body], and optional [elseBody].
  const IfStatement(
    this.condition,
    this.body,
    this.elseBody, {
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'condition': condition,
      'body': body,
      'elseBody': elseBody,
    };
  }
}

/// AST node for an `else` block.
class ElseStatement extends FlowControlStatement {
  /// List of statements in the else block.
  final List<Statement> body;

  /// Creates an [ElseStatement] with the given [body].
  const ElseStatement(
    this.body, {
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
  });

  @override
  Map<String, dynamic> toMap() {
    return {'body': body};
  }
}

/// AST node for an `else if` branch, with its own condition.
class ElseIfStatement extends ElseStatement {
  /// Boolean condition for the elseif.
  final BooleanExpression condition;

  /// Creates an [ElseIfStatement] with [condition] and [body].
  const ElseIfStatement(
    this.condition,
    super.body, {
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'condition': condition,
      'body': body,
    };
  }
}

/// AST node for a `while` loop.
class WhileStatement extends FlowControlStatement {
  /// Boolean condition expression controlling the loop.
  final BooleanExpression condition;

  /// List of statements in the loop body.
  final List<Statement> body;

  /// Creates a [WhileStatement] with [condition] and [body].
  const WhileStatement(
    this.condition,
    this.body, {
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'condition': condition,
      'body': body,
    };
  }
}

/// AST node for an external call to a method in a namespace (e.g., `math::floor(3.5)`).
class ExternalCall extends Expression {
  /// The namespace of the external method.
  final String namespace;

  /// The method name being called.
  final String method;

  /// Named arguments passed to the method, as a map of parameter names to expressions.
  final Map<String, Expression> namedArgs;

  /// Positional arguments passed to the method, as a list of expressions in order.
  final List<Expression> positionalArgs;

  /// AST node for an external call to a method in a namespace (e.g., `math::floor(3.5)`).
  const ExternalCall(
    this.namespace,
    this.method,
    this.namedArgs,
    this.positionalArgs, {
    super.lineStart,
    super.columnStart,
    super.lineEnd,
    super.columnEnd,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'namespace': namespace,
      'method': method,
      'args': namedArgs,
    };
  }
}
