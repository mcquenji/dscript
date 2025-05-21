part of 'lexer.dart';

/// Base class for all tokens produced by the lexer.
///
/// Each token has a [value] representing its text, and optional
/// [line] and [column] metadata for error reporting or debugging.
sealed class Token {
  /// The string representation of the token.
  final String value;

  /// Line number where the token was found (1-based), or null if not set.
  final int line;

  /// Column number where the token starts (1-based), or null if not set.
  final int column;

  /// Creates a [Token] with the given [value], and optional [line] and [column].
  const Token(this.value, {this.line = -1, this.column = -1});

  /// The column number where the token ends.
  int get endColumn {
    return column + value.length;
  }

  /// Serializes this token to JSON for debugging or communication.
  ///
  /// Returns a map containing:
  /// - `token`: the runtime type name of the token
  /// - `value`: the token text
  /// - `line`: the line number
  /// - `column`: the column number
  Map<String, dynamic> toJson() {
    return {
      'token': runtimeType.toString(),
      'value': value,
      'line': line,
      'column': column,
    };
  }

  @override
  String toString() {
    return value;
  }
}

/// Token representing an integer literal.
class NumberToken extends Token {
  /// [value] contains the numeric string, with optional [line] and [column].
  const NumberToken(super.value, {super.line, super.column});
}

/// Token marking the end of file (EOF).
class EndOfFileToken extends Token {
  /// Creates an EOF token with optional position metadata.
  const EndOfFileToken({super.line, super.column}) : super('EOF');
}

/// Token for a semicolon (`;`).
class SemiColonToken extends Token {
  /// Creates a semicolon token with optional position metadata.
  const SemiColonToken({super.line, super.column}) : super(';');
}

/// Token for a comma (`,`).
class CommaToken extends Token {
  /// Creates a comma token with optional position metadata.
  const CommaToken({super.line, super.column}) : super(',');
}

/// Token representing a boolean literal (`true` or `false`).
class BooleanToken extends Token {
  /// [value] is either "true" or "false", with optional position metadata.
  const BooleanToken(super.value, {super.line, super.column});
}

/// Token for the assignment or equality operator (`=`).
class EqualsToken extends Token {
  /// Creates an equals token with optional position metadata.
  const EqualsToken({super.line, super.column}) : super('=');
}

/// Token for binary operators (`+`, `-`, `*`, `/`, `%`).
class BinaryOperatorToken extends Token {
  /// [value] is the operator string, with optional position metadata.
  const BinaryOperatorToken(super.value, {super.line, super.column});
}

/// Token for identifiers (variable names, function names, etc.).
class IdentifierToken extends Token {
  /// [value] is the identifier text, with optional position metadata.
  const IdentifierToken(super.value, {super.line, super.column});
}

/// Token for a colon (`:`).
class ColonToken extends Token {
  /// Creates a colon token with optional position metadata.
  const ColonToken({super.line, super.column}) : super(':');
}

/// Token for an open bracket (`[`).
class OpenBracketToken extends Token {
  /// Creates an open bracket token with optional position metadata.
  const OpenBracketToken({super.line, super.column}) : super('[');
}

/// Token for a close bracket (`]`).
class CloseBracketToken extends Token {
  /// Creates a close bracket token with optional position metadata.
  const CloseBracketToken({super.line, super.column}) : super(']');
}

/// Token for an open parenthesis (`(`).
class OpenParenthesisToken extends Token {
  /// Creates an open parenthesis token with optional position metadata.
  const OpenParenthesisToken({super.line, super.column}) : super('(');
}

/// Token for a close parenthesis (`)`).
class CloseParenthesisToken extends Token {
  /// Creates a close parenthesis token with optional position metadata.
  const CloseParenthesisToken({super.line, super.column}) : super(')');
}

/// Token for an open brace (`{`).
class OpenBraceToken extends Token {
  /// Creates an open brace token with optional position metadata.
  const OpenBraceToken({super.line, super.column}) : super('{');
}

/// Token for a close brace (`}`).
class CloseBraceToken extends Token {
  /// Creates a close brace token with optional position metadata.
  const CloseBraceToken({super.line, super.column}) : super('}');
}

/// Token for a dot (`.`).
class DotToken extends Token {
  /// Creates a dot token with optional position metadata.
  const DotToken({super.line, super.column}) : super('.');
}

/// Token for an exclamation mark (`!`).
class ExclamationToken extends Token {
  /// Creates an exclamation token with optional position metadata.
  const ExclamationToken({super.line, super.column}) : super('!');
}

/// Token for a question mark (`?`).
class QuestionToken extends Token {
  /// Creates a question mark token with optional position metadata.
  const QuestionToken({super.line, super.column}) : super('?');
}

/// Token for an ampersand (`&`).
class AmpersandToken extends Token {
  /// Creates an ampersand token with optional position metadata.
  const AmpersandToken({super.line, super.column}) : super('&');
}

/// Token for a pipe (`|`).
class PipeToken extends Token {
  /// Creates a pipe token with optional position metadata.
  const PipeToken({super.line, super.column}) : super('|');
}

/// Token for a double quote (`").
class QuoteToken extends Token {
  /// Creates a double-quote token with optional position metadata.
  const QuoteToken({super.line, super.column}) : super('"');
}

/// Token for a single quote (`'`).
class SingleQuoteToken extends Token {
  /// Creates a single-quote token with optional position metadata.
  const SingleQuoteToken({super.line, super.column}) : super("'");
}

/// Token for the arrow operator (`->`).
class ArrowToken extends Token {
  /// Creates an arrow token with optional position metadata.
  const ArrowToken({super.line, super.column}) : super('->');
}

/// Token for the dollar sign (`$`).
class DollarToken extends Token {
  /// Creates a dollar token with optional position metadata.
  const DollarToken({super.line, super.column}) : super(r'$');
}

/// Token for the namespace separator (`::`).
class DoubleColonToken extends Token {
  /// Creates a double-colon token with optional position metadata.
  const DoubleColonToken({super.line, super.column}) : super('::');
}

/// Base class for logical and relational tokens (e.g. `&&`, `||`, `!=`, `<`, `>`).
sealed class LogicToken extends Token {
  /// [value] is the operator, with optional position metadata.
  const LogicToken(super.value, {super.line, super.column});
}

/// Token for logical OR (`||`).
class OrToken extends LogicToken {
  /// Creates an OR token with optional position metadata.
  const OrToken({super.line, super.column}) : super('||');
}

/// Token for logical AND (`&&`).
class AndToken extends LogicToken {
  /// Creates an AND token with optional position metadata.
  const AndToken({super.line, super.column}) : super('&&');
}

/// Token for not-equals operator (`!=`).
class NotEqualsToken extends LogicToken {
  /// Creates a not-equals token with optional position metadata.
  const NotEqualsToken({super.line, super.column}) : super('!=');
}

/// Token for less-than operator (`<`).
class LessThanToken extends LogicToken {
  /// Creates a less-than token with optional position metadata.
  const LessThanToken({super.line, super.column}) : super('<');
}

/// Token for greater-than operator (`>`).
class GreaterThanToken extends LogicToken {
  /// Creates a greater-than token with optional position metadata.
  const GreaterThanToken({super.line, super.column}) : super('>');
}

/// Token for less-than-or-equals operator (`<=`).
class LessThanOrEqualsToken extends LogicToken {
  /// Creates a less-than-or-equals token with optional position metadata.
  const LessThanOrEqualsToken({super.line, super.column}) : super('<=');
}

/// Token for greater-than-or-equals operator (`>=`).
class GreaterThanOrEqualsToken extends LogicToken {
  /// Creates a greater-than-or-equals token with optional position metadata.
  const GreaterThanOrEqualsToken({super.line, super.column}) : super('>=');
}

/// Token for equality operator (`==`).
class EqualsEqualsToken extends LogicToken {
  /// Creates an equals-equals token with optional position metadata.
  const EqualsEqualsToken({super.line, super.column}) : super('==');
}

/// Token for string literals.
class StringToken extends Token {
  /// [value] holds the literal content (without quotes), with optional position metadata.
  const StringToken(super.value, {super.line, super.column});
}
