import 'dart:convert';
import 'package:dscript/dscript.dart';
import 'package:pub_semver/pub_semver.dart';

part 'nodes.dart';
part 'exceptions.dart';

/// Performs syntax analysis on a token stream to produce an AST [Script].
///
/// Uses recursive descent parsing to handle implementations, hooks,
/// control flow, expressions, and statements, throwing [ParseException]
/// or [UnexpectedTokenException] upon encountering invalid syntax.
class Parser {
  /// Internal list of tokens to consume during parsing.
  late List<Token> _tokens;

  /// Constructs a new [Parser] instance.
  Parser();

  /// Parses an `impl` function implementation.
  ///
  /// Expects an [ImplToken], function name, parameter list, optional return type,
  /// and a block body returning an [Implementation] AST node.
  Implementation _parseImplementation() {
    consume<ImplToken>();
    final functionName = consume<IdentifierToken>();

    final List<Parameter> parameters = [];
    consume<OpenParenthesisToken>();

    while (peek() is! CloseParenthesisToken) {
      final parameterType = consume<IdentifierToken>();
      final parameterName = consume<IdentifierToken>();
      parameters.add(Parameter(parameterName.value, parameterType.value));

      if (peek() is CommaToken) {
        consume<CommaToken>();
        if (peek() is CloseParenthesisToken) {
          throw UnexpectedTokenException(found: peek());
        }
      }
    }
    consume<CloseParenthesisToken>();

    String returnType = 'void';
    if (peek() is ArrowToken) {
      consume<ArrowToken>();
      final returnTypeToken = consume<IdentifierToken>();
      returnType = returnTypeToken.value;
    }

    return Implementation(
      name: functionName.value,
      parameters: parameters,
      body: _parseBlock(),
      returnType: returnType,
    );
  }

  /// Parses a `hook` function declaration.
  ///
  /// Expects a [HookToken], function name, parameter list, optional return arrow,
  /// and a block body, returning a [Hook] AST node.
  Hook _parseHook() {
    consume<HookToken>();
    final functionName = consume<IdentifierToken>();

    final List<Parameter> parameters = [];
    consume<OpenParenthesisToken>();

    while (peek() is! CloseParenthesisToken) {
      final parameterType = consume<IdentifierToken>();
      final parameterName = consume<IdentifierToken>();
      parameters.add(Parameter(parameterName.value, parameterType.value));

      if (peek() is CommaToken) {
        consume<CommaToken>();
        if (peek() is CloseParenthesisToken) {
          throw UnexpectedTokenException(found: peek());
        }
      }
    }
    consume<CloseParenthesisToken>();

    if (peek() is ArrowToken) {
      consume<ArrowToken>();
      consume<IdentifierToken>();
    }

    return Hook(
      name: functionName.value,
      parameters: parameters,
      body: _parseBlock(),
    );
  }

  /// Parses a block of statements delimited by `{` and `}`.
  ///
  /// Returns a list of [Statement] nodes parsed from the block.
  List<Statement> _parseBlock() {
    final List<Statement> body = [];
    consume<OpenBraceToken>();

    while (peek() is! CloseBraceToken) {
      final token = peek(true);

      if (token is EndOfFileToken) {
        throw ParseException('Unexpected end of file');
      }

      if (token is ReturnToken) {
        consume<ReturnToken>();
        if (peek() is SemiColonToken) {
          consume<SemiColonToken>();
          body.add(const ReturnStatement(null));
          continue;
        }

        final expression = _parseExpression();
        body.add(ReturnStatement(expression));
        consume<SemiColonToken>();
        continue;
      }

      if (token is IfToken) {
        body.add(_parseIfStatement());
        continue;
      }

      if (token is ElseToken) {
        throw ParseException('Missing if statement before else');
      }

      // Fallback: treat as expression statement
      body.add(_parseExpression());
    }

    consume<CloseBraceToken>();
    return body;
  }

  /// Parses an `if` statement, including optional `else if` and `else`.
  ///
  /// Returns an [IfStatement] AST node.
  IfStatement _parseIfStatement() {
    consume<IfToken>();
    consume<OpenParenthesisToken>();
    final condition = _parseBooleanExpression(const CloseParenthesisToken());
    final body = _parseBlock();

    ElseStatement? elseBody;
    if (peek() is ElseToken) {
      consume<ElseToken>();
      if (peek() is IfToken) {
        final ifStmt = _parseIfStatement();
        elseBody = ElseIfStatement(ifStmt.condition, ifStmt.body);
      } else {
        elseBody = ElseStatement(_parseBlock());
      }
    }

    return IfStatement(condition, body, elseBody);
  }

  /// Parses a boolean expression up to an optional terminator.
  ///
  /// Currently returns a placeholder [BooleanLiteral].
  BooleanExpression _parseBooleanExpression(
      [Token terminator = const SemiColonToken()]) {
    return const BooleanLiteral(true);
  }

  /// Parses a general expression (alias for additive parsing).
  Expression _parseExpression() => _parseAdditiveExpr();

  /// Parses primary expressions: identifiers, literals, parenthesized.
  Expression _parsePrimaryExpression() {
    var token = peek();

    if (token is MetadataToken) {
      token = token.demote();
    }

    switch (token) {
      case IdentifierToken():
        final id = consume<IdentifierToken>();
        return Identifier(id.value);
      case NumberToken():
        return _parseNumericLiteral();
      case OpenParenthesisToken():
        consume<OpenParenthesisToken>();
        final expr = _parseExpression();
        consume<CloseParenthesisToken>();
        return expr;
      case BooleanToken():
        final boolTok = consume<BooleanToken>();
        return BooleanLiteral(boolTok.value == 'true');
      case NullToken():
        consume<NullToken>();
        return const NullLiteral();
      case StringToken():
        return StringLiteral(consume<StringToken>().value);
      default:
        throw UnexpectedTokenException(found: token);
    }
  }

  /// Parses numeric literals, handling integer and double formats.
  NumericLiteral _parseNumericLiteral() {
    final number = consume<NumberToken>();
    if (peek() is DotToken) {
      consume<DotToken>();
      final decimal = consume<NumberToken>();
      return DoubleLiteral(double.parse('${number.value}.${decimal.value}'));
    }
    return IntegerLiteral(num.parse(number.value));
  }

  /// Parses addition and subtraction expressions.
  Expression _parseAdditiveExpr() {
    var left = _parseMultiplicativeExpr();
    while (peek().value == '+' || peek().value == '-') {
      final op = consume<BinaryOperatorToken>();
      final right = _parseMultiplicativeExpr();
      left = BinaryExpression(op.value, left, right);
    }
    return left;
  }

  /// Parses multiplication, division, and modulo expressions.
  Expression _parseMultiplicativeExpr() {
    var left = _parsePrimaryExpression();
    while (peek().value == '*' || peek().value == '/' || peek().value == '%') {
      final op = consume<BinaryOperatorToken>();
      final right = _parsePrimaryExpression();
      left = BinaryExpression(op.value, left, right);
    }
    return left;
  }

  /// Parses the top-level `contract` declaration and its contents.
  ///
  /// Expects a [ContractToken], contract name, and braces enclosing
  /// implementations and hooks, returning a [Contract] AST node.
  Contract _parseContract() {
    final List<Implementation> implementations = [];
    final List<Hook> hooks = [];
    consume<ContractToken>();

    final contractName = consume<IdentifierToken>();
    consume<OpenBraceToken>();

    while (peek() is! EndOfFileToken) {
      switch (peek()) {
        case ImplToken():
          implementations.add(_parseImplementation());
          continue;
        case HookToken():
          hooks.add(_parseHook());
          continue;
        case ContractToken():
          throw ParseException("Can't declare nested contracts.");
        case PermissionToken():
          throw ParseException(
              'Permission declaration must be before contract declaration.');
        case CloseBraceToken():
          consume<CloseBraceToken>();
          return Contract(contractName.value, implementations, hooks);
        default:
          throw UnexpectedTokenException(found: peek());
      }
    }

    consume<CloseBraceToken>();
    return Contract(contractName.value, implementations, hooks);
  }

  /// Parses the full [Script] from the given [SourceCode], consuming permissions
  /// declarations and exactly one contract, then returns the AST root.
  Script parse(SourceCode code) {
    _tokens = tokenize(code);

    final List<PermissionStmt> permissions = [];
    Contract? contract;
    String? author;
    Version? version;
    String? description;
    String? license;
    String? name;
    String? website;
    String? repo;

    while (peek() is! EndOfFileToken) {
      switch (peek()) {
        case SemiColonToken():
          consume<SemiColonToken>();
          continue;
        case ContractToken():
          if (contract != null) {
            throw ParseException('Only one contract per script is allowed.');
          }
          contract = _parseContract();
          continue;
        case PermissionToken():
          if (contract != null) {
            throw ParseException(
                'Permission declaration must be before contract declaration.');
          }
          consume<PermissionToken>();
          while (peek() is! SemiColonToken) {
            if (peek() is CommaToken) {
              consume<CommaToken>();
              continue;
            }
            final namespace = consume<IdentifierToken>();
            consume<DoubleColonToken>();
            final permission = consume<IdentifierToken>();
            permissions.add(PermissionStmt(namespace.value, permission.value));
          }
          consume<SemiColonToken>();
          continue;
        case AuthorToken():
          if (author != null) {
            throw ParseException('Multiple author declarations found.');
          }
          consume<AuthorToken>();
          author = consume<StringToken>().value;
          consume<SemiColonToken>();
          continue;
        case VersionToken():
          if (version != null) {
            throw ParseException('Multiple version declarations found.');
          }
          consume<VersionToken>();
          final versionToken = consume<StringToken>();
          final versionString = versionToken.value;
          try {
            version = Version.parse(versionString);
            consume<SemiColonToken>();
          } on FormatException {
            throw ParseException(
                'Invalid version format: "$versionString". Version must follow semantic versioning (see https://semver.org/).',
                line: versionToken.line,
                column: versionToken.column);
          }
          continue;
        case NameToken():
          if (name != null) {
            throw ParseException('Multiple name declarations found.');
          }
          consume<NameToken>();
          name = consume<StringToken>().value;
          consume<SemiColonToken>();
          continue;
        case DescriptionToken():
          if (description != null) {
            description += '\n';
          } else {
            description = '';
          }

          consume<DescriptionToken>();
          description += consume<StringToken>().value;
          consume<SemiColonToken>();
          continue;
        case LicenseToken():
          if (license != null) {
            throw ParseException('Multiple license declarations found.');
          }

          consume<LicenseToken>();
          final licenseValue = consume<StringToken>().value;

          license = licenseValue;
          consume<SemiColonToken>();
          continue;
        case WebsiteToken():
          if (website != null) {
            throw ParseException('Multiple website declarations found.');
          }
          consume<WebsiteToken>();
          website = consume<StringToken>().value;
          consume<SemiColonToken>();
          continue;
        case RepoToken():
          if (repo != null) {
            throw ParseException('Multiple repo declarations found.');
          }
          consume<RepoToken>();
          repo = consume<StringToken>().value;
          consume<SemiColonToken>();
          continue;

        case EndOfFileToken():
          break;
        default:
          throw UnexpectedTokenException(found: peek());
      }
    }

    if (contract == null) {
      throw ParseException(
          'This script does not implement a contract. Thus parsing failed.');
    }

    if (author == null) {
      throw ParseException('No author declaration found.');
    }
    if (version == null) {
      throw ParseException('Script version is missing.');
    }

    if (name == null) {
      throw ParseException('Script name is missing.');
    }

    return Script(
      permissions,
      contract,
      author: author,
      version: version,
      name: name,
      description: description,
      license: license,
      website: website,
      repo: repo,
    );
  }

  /// Returns the next token without consuming it.
  /// Throws if no tokens remain.
  Token peek([bool convertMetadata = false]) {
    if (_tokens.isEmpty) {
      throw ParseException('No more tokens available');
    }
    final token = _tokens.first;

    if (token is MetadataToken && convertMetadata) {
      return token.demote();
    }

    return token;
  }

  /// Removes and returns the next token, asserting it is of type [T].
  /// Throws [UnexpectedTokenException] on mismatch or [ParseException] if empty.
  Token consume<T extends Token>([bool convertMetadata = true]) {
    if (_tokens.isEmpty) {
      throw ParseException('No more tokens available');
    }

    if (T == IdentifierToken && peek() is MetadataToken && convertMetadata) {
      final token = _tokens.removeAt(0);
      if (token is MetadataToken) {
        return token.demote();
      }
    }

    final token = _tokens.first;
    if (token is T) {
      return _tokens.removeAt(0);
    }

    throw UnexpectedTokenException(expected: T, found: token);
  }
}
