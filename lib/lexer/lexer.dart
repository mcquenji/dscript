part 'keywords.dart';
part 'tokens.dart';
part 'metadata.dart';

/// Represents the mutable source code buffer with tracking of line and column
/// positions for error reporting and token metadata.
class SourceCode {
  /// The remaining unconsumed code.
  String _code;

  /// The original full source code.
  final String code;

  /// Returns the number of characters left in the buffer.
  int get length => _code.length;

  int _line = 1;

  /// Current line number in the source (1-based).
  int get line => _line;

  int _column = 1;

  /// Current column number in the source (1-based).
  int get column => _column;

  /// Initializes the SourceCode with the given [code], asserting it is not empty.
  SourceCode(this.code) : _code = code {
    assert(_code.trim().isNotEmpty, 'Source code cannot be empty');
    // Optionally normalize whitespace here if needed
    // _code = _code.trim();
    // _code = _code.replaceAll(RegExp(r'\s+'), ' ');
  }

  /// Returns true if there is no more code to consume.
  bool get isEmpty => _code.isEmpty;

  /// Returns true if there is remaining code to consume.
  bool get isNotEmpty => _code.isNotEmpty;

  /// Consumes [length] characters from the buffer, updating line and column,
  /// and returns the consumed substring. Throws if not enough characters.
  String consume([int length = 1]) {
    if (length > _code.length) {
      throw Exception('Not enough characters to consume');
    }

    // Update line and column tracking
    if (_code[0] == '\n') {
      _line++;
      _column = length;
    } else {
      _column += length;
    }

    final String consumed = _code.substring(0, length);
    _code = _code.substring(length);
    return consumed;
  }

  /// Peeks ahead [length] characters without consuming them. Throws if not enough.
  String peek([int length = 1]) {
    if (length > _code.length) {
      throw Exception('Not enough characters to peek');
    }
    return _code.substring(0, length);
  }
}

/// Scans the provided [src] buffer and returns a list of [Token]s representing
/// the lexical structure of the input source code.
///
/// The tokenizer supports:
/// - Whitespace skipping
/// - Line comments starting with `//`
/// - Multi-character operators (`->`, `==`, `!=`, `>=`, `<=`, `&&`, `||`, `::`)
/// - Single-character symbols and operators
/// - Numbers, identifiers, keywords, booleans, null, and string literals
/// - End-of-file marker
List<Token> tokenize(SourceCode src) {
  final List<Token> tokens = [];

  while (src.isNotEmpty) {
    // Skip whitespace
    if (src.peek().contains(RegExp(r'\s'))) {
      src.consume();
      continue;
    }

    // Skip line comments `// ...`
    if (src.length >= 2 && src.peek(2) == '//') {
      while (src.isNotEmpty && src.peek() != '\n' && src.peek() != '\r') {
        src.consume();
      }
      continue;
    }

    // Multi-character operators and punctuation
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

    // Double colon namespace separator
    if (src.length >= 2 && src.peek(2) == '::') {
      tokens.add(DoubleColonToken(line: src.line, column: src.column));
      src.consume(2);
      continue;
    }

    // Single-character relational operators
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

    // Numeric literals (integers)
    if (src.peek().contains(RegExp(r'\d'))) {
      String number = '';
      while (src.isNotEmpty && src.peek().contains(RegExp(r'\d'))) {
        number += src.consume();
      }
      tokens.add(NumberToken(number, line: src.line, column: src.column - 1));
      continue;
    }

    // Identifiers and keywords
    if (src.peek().contains(RegExp(r'[a-zA-Z_]'))) {
      String identifier = '';
      while (src.isNotEmpty && src.peek().contains(RegExp(r'[a-zA-Z0-9_]'))) {
        identifier += src.consume();
      }
      final int column = src.column - identifier.length;

      // Keyword dispatch
      switch (identifier) {
        case 'final':
          tokens.add(FinalToken(line: src.line, column: column));
          break;
        case 'var':
          tokens.add(VarToken(line: src.line, column: column));
          break;
        case 'const':
          tokens.add(ConstToken(line: src.line, column: column));
          break;
        case 'true':
        case 'false':
          tokens.add(BooleanToken(identifier, line: src.line, column: column));
          break;
        case 'null':
          tokens.add(NullToken(line: src.line, column: column));
          break;
        case 'impl':
          tokens.add(ImplToken(line: src.line, column: column));
          break;
        case 'contract':
          tokens.add(ContractToken(line: src.line, column: column));
          break;
        case 'permissions':
          tokens.add(PermissionToken(line: src.line, column: column));
          break;
        case 'return':
          tokens.add(ReturnToken(line: src.line, column: column));
          break;
        case 'if':
          tokens.add(IfToken(line: src.line, column: column));
          break;
        case 'else':
          tokens.add(ElseToken(line: src.line, column: column));
          break;
        case 'for':
          tokens.add(ForToken(line: src.line, column: column));
          break;
        case 'while':
          tokens.add(WhileToken(line: src.line, column: column));
          break;
        case 'break':
          tokens.add(BreakToken(line: src.line, column: column));
          break;
        case 'continue':
          tokens.add(ContinueToken(line: src.line, column: column));
          break;
        case 'hook':
          tokens.add(HookToken(line: src.line, column: column));
          break;
        case 'author':
          tokens.add(AuthorToken(line: src.line, column: column));
          break;
        case 'version':
          tokens.add(VersionToken(line: src.line, column: column));
          break;
        case 'name':
          tokens.add(NameToken(line: src.line, column: column));
          break;
        case 'description':
          tokens.add(DescriptionToken(line: src.line, column: column));
          break;
        case 'license':
          tokens.add(LicenseToken(line: src.line, column: column));
          break;
        case 'website':
          tokens.add(WebsiteToken(line: src.line, column: column));
          break;
        case 'repo':
          tokens.add(RepoToken(line: src.line, column: column));
          break;
        default:
          tokens
              .add(IdentifierToken(identifier, line: src.line, column: column));
      }
      continue;
    }

    // Single-character punctuation and operators
    switch (src.peek()) {
      case ';':
        tokens.add(SemiColonToken(line: src.line, column: src.column));
        src.consume();
        continue;
      case ':':
        tokens.add(ColonToken(line: src.line, column: src.column));
        src.consume();
        continue;
      case ',':
        tokens.add(CommaToken(line: src.line, column: src.column));
        src.consume();
        continue;
      case '=':
        tokens.add(EqualsToken(line: src.line, column: src.column));
        src.consume();
        continue;
      case '[':
        tokens.add(OpenBracketToken(line: src.line, column: src.column));
        src.consume();
        continue;
      case ']':
        tokens.add(CloseBracketToken(line: src.line, column: src.column));
        src.consume();
        continue;
      case '(':
        tokens.add(OpenParenthesisToken(line: src.line, column: src.column));
        src.consume();
        continue;
      case ')':
        tokens.add(CloseParenthesisToken(line: src.line, column: src.column));
        src.consume();
        continue;
      case '{':
        tokens.add(OpenBraceToken(line: src.line, column: src.column));
        src.consume();
        continue;
      case '}':
        tokens.add(CloseBraceToken(line: src.line, column: src.column));
        src.consume();
        continue;
      case '.':
        tokens.add(DotToken(line: src.line, column: src.column));
        src.consume();
        continue;
      case '!':
        tokens.add(ExclamationToken(line: src.line, column: src.column));
        src.consume();
        continue;
      case '?':
        tokens.add(QuestionToken(line: src.line, column: src.column));
        src.consume();
        continue;
      case '&':
        tokens.add(AmpersandToken(line: src.line, column: src.column));
        src.consume();
        continue;
      case '|':
        tokens.add(PipeToken(line: src.line, column: src.column));
        src.consume();
        continue;
      case '"':
        // String literal with double quotes
        final terminator = src.consume();
        var string = '';
        while (src.isNotEmpty && src.peek() != terminator) {
          string += src.consume();
        }
        if (src.isEmpty) {
          throw Exception(
            'Unterminated string literal at line ${src.line}, column ${src.column}',
          );
        }
        src.consume(); // closing quote
        tokens.add(StringToken(
          string,
          line: src.line,
          column: src.column - string.length,
        ));
        continue;
      case "'":
        // String literal with single quotes
        final term = src.consume();
        var strVal = '';
        while (src.isNotEmpty && src.peek() != term) {
          strVal += src.consume();
        }
        if (src.isEmpty) {
          throw Exception(
            'Unterminated string literal at line ${src.line}, column ${src.column}',
          );
        }
        src.consume();
        tokens.add(StringToken(
          strVal,
          line: src.line,
          column: src.column - strVal.length,
        ));
        continue;
      case r'$':
        tokens.add(DollarToken(line: src.line, column: src.column));
        src.consume();
        continue;
      default:
        // Arithmetic operators +, -, *, /, %
        if (['+', '-', '*', '/', '%'].contains(src.peek())) {
          final String op = src.consume();
          tokens.add(
              BinaryOperatorToken(op, line: src.line, column: src.column - 1));
          continue;
        }
    }

    // Unknown character => error
    throw Exception(
      'Unknown token: ${src.peek()} at line ${src.line}, column ${src.column}',
    );
  }

  // Emit EOF marker
  tokens.add(EndOfFileToken(line: src.line, column: src.column));

  return tokens;
}
