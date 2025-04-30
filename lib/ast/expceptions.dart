part of 'ast.dart';

class ParseException implements Exception {
  final String message;
  final int line;
  final int column;

  ParseException(this.message, {this.line = -1, this.column = -1});

  @override
  String toString() {
    return 'ParseException: $message at line $line, column $column';
  }
}

class UnexpectedTokenException extends ParseException {
  final Object? expected;
  final Token found;

  UnexpectedTokenException({
    this.expected,
    required this.found,
    String? message,
  }) : super(
          message ??
              (expected != null
                  ? 'Expected $expected but found $found'
                  : 'Unexpected token $found'),
          line: found.line ?? -1,
          column: found.column ?? -1,
        );
}
