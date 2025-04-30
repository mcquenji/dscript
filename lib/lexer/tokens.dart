part of 'lexer.dart';

sealed class Token {
  final String value;

  const Token(this.value);

  Map<String, dynamic> toJson() {
    return {
      'token': runtimeType.toString(),
      'value': value,
    };
  }

  @override
  String toString() {
    final json = toJson();
    return jsonEncode(json);
  }
}

class NumberToken extends Token {
  const NumberToken(super.value);
}

class EndOfFileToken extends Token {
  const EndOfFileToken() : super('EOF');
}

class SemiColonToken extends Token {
  const SemiColonToken() : super(';');
}

class CommaToken extends Token {
  const CommaToken() : super(',');
}

class BooleanToken extends Token {
  const BooleanToken(super.value);
}

class EqualsToken extends Token {
  const EqualsToken() : super('=');
}

class BinaryOperatorToken extends Token {
  const BinaryOperatorToken(super.value);
}

class IdentifierToken extends Token {
  const IdentifierToken(super.value);
}

class ColonToken extends Token {
  const ColonToken() : super(':');
}

class OpenBracketToken extends Token {
  const OpenBracketToken() : super('[');
}

class CloseBracketToken extends Token {
  const CloseBracketToken() : super(']');
}

class OpenParenthesisToken extends Token {
  const OpenParenthesisToken() : super('(');
}

class CloseParenthesisToken extends Token {
  const CloseParenthesisToken() : super(')');
}

class OpenBraceToken extends Token {
  const OpenBraceToken() : super('{');
}

class CloseBraceToken extends Token {
  const CloseBraceToken() : super('}');
}

class DotToken extends Token {
  const DotToken() : super('.');
}

class ExclamationToken extends Token {
  const ExclamationToken() : super('!');
}

class QuestionToken extends Token {
  const QuestionToken() : super('?');
}

class AmpersandToken extends Token {
  const AmpersandToken() : super('&');
}

class PipeToken extends Token {
  const PipeToken() : super('|');
}

class QuoteToken extends Token {
  const QuoteToken() : super('"');
}

class SingleQuoteToken extends Token {
  const SingleQuoteToken() : super("'");
}

class ArrowToken extends Token {
  const ArrowToken() : super('->');
}

class DollarToken extends Token {
  const DollarToken() : super('\$');
}
