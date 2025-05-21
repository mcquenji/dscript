part of '../ast.dart';

/// Parser extension for parsing variable declarations and assignments.
extension VariablesParser on Parser {
  VariableDeclaration _parseVariableDeclaration() {
    final keyword = consume<VariableKeywordToken>() as VariableKeywordToken;
    var typeOrName = consume<IdentifierToken>().value;

    IdentifierToken? nameToken;
    Expression? value;
    late final Token endToken;

    switch (peek()) {
      case EqualsToken():
        consume<EqualsToken>();
        value = _parseExpression();
        endToken = consume<SemiColonToken>();
        break;
      case SemiColonToken():
        endToken = consume<SemiColonToken>();
        break;
      case QuestionToken():
        final q = consume<QuestionToken>();
        typeOrName += q.value;
        continue parseName;
      parseName:
      case IdentifierToken():
        nameToken = consume<IdentifierToken>() as IdentifierToken;
        if (peek() is EqualsToken) {
          consume<EqualsToken>();
          value = _parseExpression();
          endToken = consume<SemiColonToken>();
        } else {
          endToken = consume<SemiColonToken>();
        }
        break;
      default:
        throw UnexpectedTokenException(
          expected: SemiColonToken,
          found: peek(),
        );
    }

    final type = nameToken != null ? $Type.from(typeOrName) : null;
    final name = nameToken?.value ?? typeOrName;

    switch (keyword) {
      case ConstToken():
        return ConstDeclaration(
          name,
          value,
          type: type,
          lineStart: keyword.line,
          columnStart: keyword.column,
          lineEnd: endToken.line,
          columnEnd: endToken.endColumn,
        );
      case FinalToken():
        return FinalDeclaration(
          name,
          value,
          type: type,
          lineStart: keyword.line,
          columnStart: keyword.column,
          lineEnd: endToken.line,
          columnEnd: endToken.endColumn,
        );
      case VarToken():
        return VarDeclaration(
          name,
          value,
          type: type,
          lineStart: keyword.line,
          columnStart: keyword.column,
          lineEnd: endToken.line,
          columnEnd: endToken.endColumn,
        );
    }
  }

  /// Parses an assignment statement (e.g., `x = 5;`).
  AssignmentStatement _parseAssignmentStatement() {
    final id = consume<IdentifierToken>();
    consume<EqualsToken>();
    final value = _parseExpression();
    final end = consume<SemiColonToken>();

    return AssignmentStatement(
      id.value,
      value,
      lineStart: id.line,
      columnStart: id.column,
      lineEnd: end.line,
      columnEnd: end.endColumn,
    );
  }
}
