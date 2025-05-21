part of '../ast.dart';

/// Parser extension for parsing binary operations.
extension BinaryOperationParser on Parser {
  /// Parses addition and subtraction expressions.
  Expression _parseAdditiveExpr() {
    var left = _parseMultiplicativeExpr();
    final start = left;

    while (peek().value == '+' || peek().value == '-') {
      final op = consume<BinaryOperatorToken>();
      final right = _parseMultiplicativeExpr();
      left = BinaryExpression(
        op.value,
        left,
        right,
        lineStart: start.lineStart,
        columnStart: start.columnStart,
        lineEnd: right.lineEnd,
        columnEnd: right.columnEnd,
      );
    }
    return left;
  }

  /// Parses multiplication, division, and modulo expressions.
  Expression _parseMultiplicativeExpr() {
    var left = _parsePrimaryExpression();
    final start = left;
    while (peek().value == '*' || peek().value == '/' || peek().value == '%') {
      final op = consume<BinaryOperatorToken>();
      final right = _parsePrimaryExpression();
      left = BinaryExpression(
        op.value,
        left,
        right,
        lineStart: start.lineStart,
        columnStart: start.columnStart,
        lineEnd: right.lineEnd,
        columnEnd: right.columnEnd,
      );
    }
    return left;
  }
}
