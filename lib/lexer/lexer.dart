import 'dart:convert';

part 'keyworkds.dart';
part 'tokens.dart';

class SourceCode {
  String _code;

  int get length => _code.length;

  SourceCode(this._code) {
    assert(_code.trim().isNotEmpty, 'Source code cannot be empty');

    _code = _code.trim();
    _code = _code.replaceAll(RegExp(r'\s+'), ' ');
  }

  bool get isEmpty => _code.isEmpty;
  bool get isNotEmpty => _code.isNotEmpty;

  String consume([int length = 1]) {
    if (length > _code.length) {
      throw Exception('Not enough characters to consume');
    }

    String consumed = _code.substring(0, length);
    _code = _code.substring(length);
    return consumed;
  }

  String peek([int length = 1]) {
    if (length > _code.length) {
      throw Exception('Not enough characters to peek');
    }

    return _code.substring(0, length);
  }
}

List<Token> tokenize(SourceCode src) {
  List<Token> tokens = [];

  while (src.isNotEmpty) {
    if (src.length >= 2 && src.peek(2) == '->') {
      tokens.add(const ArrowToken());
      src.consume(2);
      continue;
    }

    if (src.peek().contains(RegExp(r'[\s]'))) {
      src.consume();
      continue;
    }

    if (src.peek().contains(RegExp(r'\d'))) {
      String number = '';
      while (src.isNotEmpty && src.peek().contains(RegExp(r'\d'))) {
        number += src.consume();
      }
      tokens.add(NumberToken(number));
      continue;
    }

    if (src.peek().contains(RegExp(r'[a-zA-Z_]'))) {
      String identifier = '';
      while (src.isNotEmpty && src.peek().contains(RegExp(r'[a-zA-Z0-9_]'))) {
        identifier += src.consume();
      }

      if (identifier == 'final') {
        tokens.add(const FinalToken());
        continue;
      }

      if (identifier == 'var') {
        tokens.add(const VarToken());
        continue;
      }
      if (identifier == 'true' || identifier == 'false') {
        tokens.add(BooleanToken(identifier));
        continue;
      }
      if (identifier == 'null') {
        tokens.add(const NullToken());
        continue;
      }

      if (identifier == 'impl') {
        tokens.add(const ImplToken());
        continue;
      }

      if (identifier == 'contract') {
        tokens.add(const ContractToken());
        continue;
      }

      if (identifier == 'permissions') {
        tokens.add(const PermissionToken());
        continue;
      }

      if (identifier == 'return') {
        tokens.add(const ReturnToken());
        continue;
      }
      if (identifier == 'if') {
        tokens.add(const IfToken());
        continue;
      }
      if (identifier == 'else') {
        tokens.add(const ElseToken());
        continue;
      }

      if (identifier == 'for') {
        tokens.add(const ForToken());
        continue;
      }

      if (identifier == 'while') {
        tokens.add(const WhileToken());
        continue;
      }

      if (identifier == 'break') {
        tokens.add(const BreakToken());
        continue;
      }

      if (identifier == 'continue') {
        tokens.add(const ContinueToken());
        continue;
      }

      if (identifier == 'hook') {
        tokens.add(const HookToken());
        continue;
      }

      tokens.add(IdentifierToken(identifier));
      continue;
    }

    if (src.peek() == ';') {
      tokens.add(const SemiColonToken());
      src.consume();
      continue;
    }

    if (src.peek() == ':') {
      tokens.add(const ColonToken());
      src.consume();
      continue;
    }

    if (src.peek() == ',') {
      tokens.add(const CommaToken());
      src.consume();
      continue;
    }
    if (src.peek() == '=') {
      tokens.add(const EqualsToken());
      src.consume();
      continue;
    }

    if (src.peek() == '[') {
      tokens.add(const OpenBracketToken());
      src.consume();
      continue;
    }

    if (src.peek() == ']') {
      tokens.add(const CloseBracketToken());
      src.consume();
      continue;
    }

    if (src.peek() == '(') {
      tokens.add(const OpenParenthesisToken());
      src.consume();
      continue;
    }

    if (src.peek() == ')') {
      tokens.add(const CloseParenthesisToken());
      src.consume();
      continue;
    }

    if (src.peek() == '{') {
      tokens.add(const OpenBraceToken());
      src.consume();
      continue;
    }

    if (src.peek() == '}') {
      tokens.add(const CloseBraceToken());
      src.consume();
      continue;
    }

    if (['+', '-', '*', '/', '%'].contains(src.peek())) {
      String operator = src.consume();
      tokens.add(BinaryOperatorToken(operator));
      continue;
    }

    if (src.peek() == '.') {
      tokens.add(const DotToken());
      continue;
    }

    if (src.peek() == '!') {
      tokens.add(const ExclamationToken());
      src.consume();
      continue;
    }

    if (src.peek() == '?') {
      tokens.add(const QuestionToken());
      src.consume();
      continue;
    }

    if (src.peek() == '&') {
      tokens.add(const AmpersandToken());
      src.consume();
      continue;
    }

    if (src.peek() == '|') {
      tokens.add(const PipeToken());
      src.consume();
      continue;
    }

    if (src.peek() == '"') {
      tokens.add(const QuoteToken());
      src.consume();
      continue;
    }

    if (src.peek() == "'") {
      tokens.add(const SingleQuoteToken());
      src.consume();
      continue;
    }

    if (src.peek() == r'$') {
      tokens.add(const DollarToken());
      src.consume();
      continue;
    }

    throw Exception('Unknown token: ${src.peek()}');
  }

  tokens.add(const EndOfFileToken());

  return tokens;
}
