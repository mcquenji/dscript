import 'dart:convert';
import 'package:dscript/analyzer/analyzer.dart';
import 'package:dscript/dscript.dart';
import 'package:pub_semver/pub_semver.dart';

part 'nodes.dart';
part 'exceptions.dart';
part 'parsers/functions.dart';
part 'parsers/flow_control.dart';
part 'parsers/expressions.dart';
part 'parsers/contract.dart';
part 'parsers/metadata.dart';
part 'parsers/variables.dart';
part 'parsers/binop.dart';

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

  /// Parses a block of statements delimited by `{` and `}`.
  ///
  /// Returns a list of [Statement] nodes parsed from the block.
  List<Statement> _parseBlock() {
    final List<Statement> body = [];
    consume<OpenBraceToken>();

    while (peek() is! CloseBraceToken) {
      final token = peek(true);

      if (token is EndOfFileToken) {
        throw ParseException(
          'Unexpected end of file',
          line: token.line,
          column: token.column,
        );
      }

      if (token is ReturnToken) {
        final start = consume<ReturnToken>();
        if (peek() is SemiColonToken) {
          final end = consume<SemiColonToken>();
          body.add(
            ReturnStatement(
              null,
              lineStart: start.line,
              columnStart: start.column,
              lineEnd: end.line,
              columnEnd: end.endColumn,
            ),
          );
          continue;
        }

        final expression = _parseExpression();
        body.add(
          ReturnStatement(
            expression,
            lineStart: start.line,
            columnStart: start.column,
            lineEnd: expression.lineEnd,
            columnEnd: expression.columnEnd,
          ),
        );
        consume<SemiColonToken>();
        continue;
      }

      if (token is IfToken) {
        body.add(_parseIfStatement());
        continue;
      }

      if (token is ElseToken) {
        throw ParseException(
          'Missing if statement before else',
          line: token.line,
          column: token.column,
        );
      }

      if (token is VariableKeywordToken) {
        body.add(_parseVariableDeclaration());
        continue;
      }

      if (token is IdentifierToken && peek(false, 2) is EqualsToken) {
        body.add(_parseAssignmentStatement());
        continue;
      }

      // Fallback: treat as expression statement
      body.add(_parseExpression());
      consume<SemiColonToken>();
    }

    consume<CloseBraceToken>();
    return body;
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
        final id = consume<IdentifierToken>() as IdentifierToken;

        if (peek() is OpenParenthesisToken) {
          return _parseFunctionCall(id);
        }

        if (peek() is DoubleColonToken) {
          return _parseExternalCall(id);
        }

        return Identifier(
          id.value,
          lineStart: id.line,
          columnStart: id.column,
          lineEnd: id.line,
          columnEnd: id.endColumn,
        );
      case NumberToken():
        return _parseNumericLiteral();
      case OpenParenthesisToken():
        consume<OpenParenthesisToken>();
        final expr = _parseExpression();
        consume<CloseParenthesisToken>();
        return expr;
      case BooleanToken():
        final boolTok = consume<BooleanToken>();
        return BooleanLiteral(
          boolTok.value == 'true',
          lineStart: boolTok.line,
          columnStart: boolTok.column,
          lineEnd: boolTok.line,
          columnEnd: boolTok.endColumn,
        );
      case NullToken():
        final tk = consume<NullToken>();
        return NullLiteral(
          lineStart: tk.line,
          columnStart: tk.column,
          lineEnd: tk.line,
          columnEnd: tk.endColumn,
        );
      case StringToken():
        final stringTok = consume<StringToken>();
        return StringLiteral(
          stringTok.value,
          lineStart: stringTok.line,
          columnStart: stringTok.column,
          lineEnd: stringTok.line,
          columnEnd: stringTok.endColumn,
        );
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
      return DoubleLiteral(
        double.parse('${number.value}.${decimal.value}'),
        lineStart: number.line,
        columnStart: number.column,
        lineEnd: decimal.line,
        columnEnd: decimal.endColumn,
      );
    }
    return IntegerLiteral(
      num.parse(number.value),
      lineStart: number.line,
      columnStart: number.column,
      lineEnd: number.line,
      columnEnd: number.endColumn,
    );
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
            throw ParseException(
              'Only one contract per script is allowed.',
              line: peek().line,
              column: peek().column,
            );
          }
          contract = _parseContract();
          continue;
        case PermissionToken():
          if (contract != null) {
            throw ParseException(
              'Permission declaration must be before contract declaration.',
              line: peek().line,
              column: peek().column,
            );
          }
          permissions.addAll(_parsePermissions());
          continue;
        case AuthorToken():
          if (author != null) {
            throw ParseException(
              'Multiple author declarations found.',
              line: peek().line,
              column: peek().column,
            );
          }
          author = _parseAuthor();
          continue;
        case VersionToken():
          if (version != null) {
            throw ParseException(
              'Multiple version declarations found.',
              line: peek().line,
              column: peek().column,
            );
          }
          version = _parseVersion();
          continue;
        case NameToken():
          if (name != null) {
            throw ParseException(
              'Multiple name declarations found.',
              line: peek().line,
              column: peek().column,
            );
          }
          name = _parseName();
          continue;
        case DescriptionToken():
          if (description != null) {
            description += '\n';
          } else {
            description = '';
          }

          description += _parseDescription();
          continue;
        case LicenseToken():
          if (license != null) {
            throw ParseException(
              'Multiple license declarations found.',
              line: peek().line,
              column: peek().column,
            );
          }

          license = _parseLicense();
          continue;
        case WebsiteToken():
          if (website != null) {
            throw ParseException(
              'Multiple website declarations found.',
              line: peek().line,
              column: peek().column,
            );
          }
          website = _parseWebsite();
          continue;
        case RepoToken():
          if (repo != null) {
            throw ParseException(
              'Multiple repo declarations found.',
              line: peek().line,
              column: peek().column,
            );
          }
          repo = _parseRepo();
          continue;

        case EndOfFileToken():
          break;
        default:
          throw UnexpectedTokenException(found: peek());
      }
    }

    if (contract == null) {
      throw ParseException(
        'This script does not implement a contract. Thus parsing failed.',
      );
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
  Token peek([bool convertMetadata = false, int length = 1]) {
    if (_tokens.isEmpty) {
      throw ParseException('No more tokens available');
    }

    if (length > _tokens.length) {
      throw ParseException('Requested length exceeds available tokens');
    }

    final token = _tokens[length - 1];

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
