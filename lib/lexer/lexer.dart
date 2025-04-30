import 'dart:convert';

part 'keywords.dart';
part 'tokens.dart';

class SourceCode {
  String _code;
  final String code;

  int get length => _code.length;

  int _line = 1;
  int get line => _line;
  int _column = 1;
  int get column => _column;

  SourceCode(this.code) : _code = code {
    assert(_code.trim().isNotEmpty, 'Source code cannot be empty');

    // _code = _code.trim();
    // _code = _code.replaceAll(RegExp(r'\s+'), ' ');
  }

  bool get isEmpty => _code.isEmpty;
  bool get isNotEmpty => _code.isNotEmpty;

  String consume([int length = 1]) {
    if (length > _code.length) {
      throw Exception('Not enough characters to consume');
    }

    // Update line and column numbers
    if (_code[0] == '\n') {
      _line++;
      _column = length;
    } else {
      _column += length;
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
    if (src.peek().contains(RegExp(r'\s'))) {
      src.consume();
      continue;
    }

    if (src.length >= 2 && src.peek(2) == '->') {
      tokens.add(ArrowToken(line: src.line, column: src.column));
      src.consume(2);
      continue;
    }

    if (src.length >= 2 && src.peek(2) == '==') {
      tokens.add(EqualsEqualsToken(line: src.line, column: src.column));
      src.consume(2);
      continue;
    }

    if (src.length >= 2 && src.peek(2) == '!=') {
      tokens.add(NotEqualsToken(line: src.line, column: src.column));
      src.consume(2);
      continue;
    }

    if (src.length >= 2 && src.peek(2) == '>=') {
      tokens.add(GreaterThanOrEqualsToken(line: src.line, column: src.column));
      src.consume(2);
      continue;
    }

    if (src.length >= 2 && src.peek(2) == '<=') {
      tokens.add(LessThanOrEqualsToken(line: src.line, column: src.column));
      src.consume(2);
      continue;
    }

    if (src.length >= 2 && src.peek(2) == '&&') {
      tokens.add(AndToken(line: src.line, column: src.column));
      src.consume(2);
      continue;
    }

    if (src.length >= 2 && src.peek(2) == '||') {
      tokens.add(OrToken(line: src.line, column: src.column));
      src.consume(2);
      continue;
    }

    if (src.peek(2) == '::') {
      tokens.add(DoubleColonToken(line: src.line, column: src.column));
      src.consume(2);
      continue;
    }

    if (src.peek() == '>') {
      tokens.add(GreaterThanToken(line: src.line, column: src.column));
      src.consume();
      continue;
    }

    if (src.peek() == '<') {
      tokens.add(LessThanToken(line: src.line, column: src.column));
      src.consume();
      continue;
    }

    if (src.peek().contains(RegExp(r'\d'))) {
      String number = '';
      while (src.isNotEmpty && src.peek().contains(RegExp(r'\d'))) {
        number += src.consume();
      }
      tokens.add(NumberToken(number, line: src.line, column: src.column - 1));
      continue;
    }

    if (src.peek().contains(RegExp(r'[a-zA-Z_]'))) {
      String identifier = '';
      while (src.isNotEmpty && src.peek().contains(RegExp(r'[a-zA-Z0-9_]'))) {
        identifier += src.consume();
      }

      int column = src.column - identifier.length;

      if (identifier == 'final') {
        tokens.add(FinalToken(line: src.line, column: column));
        continue;
      }

      if (identifier == 'var') {
        tokens.add(VarToken(line: src.line, column: column));
        continue;
      }
      if (identifier == 'true' || identifier == 'false') {
        tokens.add(BooleanToken(identifier, line: src.line, column: column));
        continue;
      }
      if (identifier == 'null') {
        tokens.add(NullToken(line: src.line, column: column));
        continue;
      }

      if (identifier == 'impl') {
        tokens.add(ImplToken(line: src.line, column: column));
        continue;
      }

      if (identifier == 'contract') {
        tokens.add(ContractToken(line: src.line, column: column));
        continue;
      }

      if (identifier == 'permissions') {
        tokens.add(PermissionToken(line: src.line, column: column));
        continue;
      }

      if (identifier == 'return') {
        tokens.add(ReturnToken(line: src.line, column: column));
        continue;
      }
      if (identifier == 'if') {
        tokens.add(IfToken(line: src.line, column: column));
        continue;
      }
      if (identifier == 'else') {
        tokens.add(ElseToken(line: src.line, column: column));
        continue;
      }

      if (identifier == 'for') {
        tokens.add(ForToken(line: src.line, column: column));
        continue;
      }

      if (identifier == 'while') {
        tokens.add(WhileToken(line: src.line, column: column));
        continue;
      }

      if (identifier == 'break') {
        tokens.add(BreakToken(line: src.line, column: column));
        continue;
      }

      if (identifier == 'continue') {
        tokens.add(ContinueToken(line: src.line, column: column));
        continue;
      }

      if (identifier == 'hook') {
        tokens.add(HookToken(line: src.line, column: column));
        continue;
      }

      tokens.add(IdentifierToken(identifier, line: src.line, column: column));
      continue;
    }

    if (src.peek() == ';') {
      tokens.add(SemiColonToken(line: src.line, column: src.column));
      src.consume();
      continue;
    }

    if (src.peek() == ':') {
      tokens.add(ColonToken(line: src.line, column: src.column));
      src.consume();
      continue;
    }

    if (src.peek() == ',') {
      tokens.add(CommaToken(line: src.line, column: src.column));
      src.consume();
      continue;
    }
    if (src.peek() == '=') {
      tokens.add(EqualsToken(line: src.line, column: src.column));
      src.consume();
      continue;
    }

    if (src.peek() == '[') {
      tokens.add(OpenBracketToken(line: src.line, column: src.column));
      src.consume();
      continue;
    }

    if (src.peek() == ']') {
      tokens.add(CloseBracketToken(line: src.line, column: src.column));
      src.consume();
      continue;
    }

    if (src.peek() == '(') {
      tokens.add(OpenParenthesisToken(line: src.line, column: src.column));
      src.consume();
      continue;
    }

    if (src.peek() == ')') {
      tokens.add(CloseParenthesisToken(line: src.line, column: src.column));
      src.consume();
      continue;
    }

    if (src.peek() == '{') {
      tokens.add(OpenBraceToken(line: src.line, column: src.column));
      src.consume();
      continue;
    }

    if (src.peek() == '}') {
      tokens.add(CloseBraceToken(line: src.line, column: src.column));
      src.consume();
      continue;
    }

    if (['+', '-', '*', '/', '%'].contains(src.peek())) {
      String operator = src.consume();
      tokens.add(BinaryOperatorToken(operator,
          line: src.line, column: src.column - 1));
      continue;
    }

    if (src.peek() == '.') {
      tokens.add(DotToken(line: src.line, column: src.column));
      src.consume();
      continue;
    }

    if (src.peek() == '!') {
      tokens.add(ExclamationToken(line: src.line, column: src.column));
      src.consume();
      continue;
    }

    if (src.peek() == '?') {
      tokens.add(QuestionToken(line: src.line, column: src.column));
      src.consume();
      continue;
    }

    if (src.peek() == '&') {
      tokens.add(AmpersandToken(line: src.line, column: src.column));
      src.consume();
      continue;
    }

    if (src.peek() == '|') {
      tokens.add(PipeToken(line: src.line, column: src.column));
      src.consume();
      continue;
    }

    if (src.peek() == '"') {
      tokens.add(QuoteToken(line: src.line, column: src.column));
      src.consume();
      continue;
    }

    if (src.peek() == "'") {
      tokens.add(SingleQuoteToken(line: src.line, column: src.column));
      src.consume();
      continue;
    }

    if (src.peek() == r'$') {
      tokens.add(DollarToken(line: src.line, column: src.column));
      src.consume();
      continue;
    }

    throw Exception(
      'Unknown token: ${src.peek()} at line ${src.line}, column ${src.column}',
    );
  }

  tokens.add(EndOfFileToken(line: src.line, column: src.column));

  return tokens;
}
