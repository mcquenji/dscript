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
  final String? expected;
  final String found;

  UnexpectedTokenException({
    this.expected,
    required this.found,
    String? message,
    int line = -1,
    int column = -1,
  }) : super(
          message ??
              (expected != null
                  ? 'Expected $expected but found $found'
                  : 'Unexpected token $found'),
          line: line,
          column: column,
        );
}
