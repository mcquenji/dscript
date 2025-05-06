part of 'ast.dart';

/// Exception thrown when a parse error occurs, including positional metadata.
///
/// Contains an error [message] and optional [line] and [column] information
/// to help identify where in the source the error was encountered.
class ParseException implements Exception {
  /// Human-readable description of the parse error.
  final String message;

  /// Line number where the error occurred (1-based), or -1 if unspecified.
  final int line;

  /// Column number where the error occurred (1-based), or -1 if unspecified.
  final int column;

  /// Creates a [ParseException] with the given [message], and optional
  /// [line] and [column] indicating the error location.
  ParseException(this.message, {this.line = -1, this.column = -1});

  @override

  /// Returns a string representation including message and position.
  String toString() {
    return 'ParseException: $message at line $line, column $column';
  }
}

/// Exception thrown when the parser encounters a token that does not match
/// the expected type or value.
///
/// Extends [ParseException] to include the [expected] token (or description)
/// and the actual [found] token, preserving its position metadata.
class UnexpectedTokenException extends ParseException {
  /// Description or type of the expected token(s), or null if unspecified.
  final Object? expected;

  /// The token that was actually found and caused the exception.
  final Token found;

  /// Creates an [UnexpectedTokenException].
  ///
  /// If [message] is not provided, a default message is generated based
  /// on [expected] and the [found] token.
  UnexpectedTokenException({
    this.expected,
    required this.found,
    String? message,
  }) : super(
          message ??
              (expected != null
                  ? 'Expected $expected but found $found'
                  : 'Unexpected token $found'),
          line: found.line,
          column: found.column,
        );
}
