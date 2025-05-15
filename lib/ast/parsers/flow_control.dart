part of '../ast.dart';

/// Parser extension for parsing flow control statements.
extension FlowControlParser on Parser {
  /// Parses an `if` statement, including optional `else if` and `else`.
  ///
  /// Returns an [IfStatement] AST node.
  IfStatement _parseIfStatement() {
    consume<IfToken>();
    consume<OpenParenthesisToken>();
    final condition = _parseBooleanExpression(const CloseParenthesisToken());
    final body = _parseBlock();

    ElseStatement? elseBody;
    if (peek() is ElseToken) {
      consume<ElseToken>();
      if (peek() is IfToken) {
        final ifStmt = _parseIfStatement();
        elseBody = ElseIfStatement(ifStmt.condition, ifStmt.body);
      } else {
        elseBody = ElseStatement(_parseBlock());
      }
    }

    return IfStatement(condition, body, elseBody);
  }
}
