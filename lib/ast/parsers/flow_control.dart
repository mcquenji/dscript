part of '../ast.dart';

/// Parser extension for parsing flow control statements.
extension FlowControlParser on Parser {
  /// Parses an `if` statement, including optional `else if` and `else`.
  ///
  /// Returns an [IfStatement] AST node.
  IfStatement _parseIfStatement() {
    final start = consume<IfToken>();
    consume<OpenParenthesisToken>();
    final condition = _parseBooleanExpression(const CloseParenthesisToken());
    final body = _parseBlock();

    ElseStatement? elseBody;
    if (peek() is ElseToken) {
      final start = consume<ElseToken>();
      if (peek() is IfToken) {
        final ifStmt = _parseIfStatement();
        elseBody = ElseIfStatement(
          ifStmt.condition,
          ifStmt.body,
          lineStart: start.line,
          columnStart: start.column,
          lineEnd: ifStmt.lineEnd,
          columnEnd: ifStmt.columnEnd,
        );
      } else {
        final body = _parseBlock();
        elseBody = ElseStatement(
          body,
          lineStart: start.line,
          columnStart: start.column,
          lineEnd: body.last.lineEnd,
          columnEnd: body.last.columnEnd,
        );
      }
    }

    return IfStatement(
      condition,
      body,
      elseBody,
      lineStart: start.line,
      columnStart: start.column,
      lineEnd: body.last.lineEnd,
      columnEnd: body.last.columnEnd,
    );
  }
}
