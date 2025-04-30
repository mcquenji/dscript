part of 'lexer.dart';

sealed class Token {
  final String value;
  final int? line;
  final int? column;

  const Token(this.value, {this.line, this.column});

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
    final json = toJson();
    return jsonEncode(json);
  }
}

class NumberToken extends Token {
  const NumberToken(super.value, {super.line, super.column});
}

class EndOfFileToken extends Token {
  const EndOfFileToken({super.line, super.column}) : super('EOF');
}

class SemiColonToken extends Token {
  const SemiColonToken({super.line, super.column}) : super(';');
}

class CommaToken extends Token {
  const CommaToken({super.line, super.column}) : super(',');
}

class BooleanToken extends Token {
  const BooleanToken(super.value, {super.line, super.column});
}

class EqualsToken extends Token {
  const EqualsToken({super.line, super.column}) : super('=');
}

class BinaryOperatorToken extends Token {
  const BinaryOperatorToken(super.value, {super.line, super.column});
}

class IdentifierToken extends Token {
  const IdentifierToken(super.value, {super.line, super.column});
}

class ColonToken extends Token {
  const ColonToken({super.line, super.column}) : super(':');
}

class OpenBracketToken extends Token {
  const OpenBracketToken({super.line, super.column}) : super('[');
}

class CloseBracketToken extends Token {
  const CloseBracketToken({super.line, super.column}) : super(']');
}

class OpenParenthesisToken extends Token {
  const OpenParenthesisToken({super.line, super.column}) : super('(');
}

class CloseParenthesisToken extends Token {
  const CloseParenthesisToken({super.line, super.column}) : super(')');
}

class OpenBraceToken extends Token {
  const OpenBraceToken({super.line, super.column}) : super('{');
}

class CloseBraceToken extends Token {
  const CloseBraceToken({super.line, super.column}) : super('}');
}

class DotToken extends Token {
  const DotToken({super.line, super.column}) : super('.');
}

class ExclamationToken extends Token {
  const ExclamationToken({super.line, super.column}) : super('!');
}

class QuestionToken extends Token {
  const QuestionToken({super.line, super.column}) : super('?');
}

class AmpersandToken extends Token {
  const AmpersandToken({super.line, super.column}) : super('&');
}

class PipeToken extends Token {
  const PipeToken({super.line, super.column}) : super('|');
}

class QuoteToken extends Token {
  const QuoteToken({super.line, super.column}) : super('"');
}

class SingleQuoteToken extends Token {
  const SingleQuoteToken({super.line, super.column}) : super("'");
}

class ArrowToken extends Token {
  const ArrowToken({super.line, super.column}) : super('->');
}

class DollarToken extends Token {
  const DollarToken({super.line, super.column}) : super('\$');
}

class DoubleColonToken extends Token {
  const DoubleColonToken({super.line, super.column}) : super('::');
}

sealed class LogicToken extends Token {
  const LogicToken(super.value, {super.line, super.column});
}

class OrToken extends LogicToken {
  const OrToken({super.line, super.column}) : super('||');
}

class AndToken extends LogicToken {
  const AndToken({super.line, super.column}) : super('&&');
}

class NotEqualsToken extends LogicToken {
  const NotEqualsToken({super.line, super.column}) : super('!=');
}

class LessThanToken extends LogicToken {
  const LessThanToken({super.line, super.column}) : super('<');
}

class GreaterThanToken extends LogicToken {
  const GreaterThanToken({super.line, super.column}) : super('>');
}

class LessThanOrEqualsToken extends LogicToken {
  const LessThanOrEqualsToken({super.line, super.column}) : super('<=');
}

class GreaterThanOrEqualsToken extends LogicToken {
  const GreaterThanOrEqualsToken({super.line, super.column}) : super('>=');
}

class EqualsEqualsToken extends LogicToken {
  const EqualsEqualsToken({super.line, super.column}) : super('==');
}
