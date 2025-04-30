import 'dart:convert';
import 'package:dscript/dscript.dart';

part 'nodes.dart';
part 'expceptions.dart';

class Parser {
  List<Token> _tokens = [];

  Parser();

  Implementation _parseImplementation() {
    consume<ImplToken>();
    final functionName = consume<IdentifierToken>();

    List<Parameter> parameters = [];
    consume<OpenParenthesisToken>();

    while (peek() is! CloseParenthesisToken) {
      final parameterType = consume<IdentifierToken>();
      final parameterName = consume<IdentifierToken>();
      parameters.add(Parameter(parameterName.value, parameterType.value));

      if (peek() is CommaToken) {
        consume<CommaToken>();
        if (peek() is CloseParenthesisToken) {
          throw Exception(
            'Unexpected token: ${peek()}',
          );
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

  List<Statement> _parseBlock() {
    List<Statement> body = [];
    consume<OpenBraceToken>();

    while (peek() is! CloseBraceToken) {
      if (peek() is EndOfFileToken) {
        throw Exception('Unexpected end of file');
      }

      if (peek() is ReturnToken) {
        consume<ReturnToken>();

        final expression = _parseExpression();
        body.add(ReturnStatement(expression));

        consume<SemiColonToken>();

        continue;
      }

      if (peek() is IfToken) {
        body.add(_parseIfStatement());

        continue;
      }

      if (peek() is ElseToken) {
        throw Exception('Missing if statement before else');
      }

      body.add(_parseExpression());
    }

    consume<CloseBraceToken>();
    return body;
  }

  IfStatement _parseIfStatement() {
    consume<IfToken>();

    consume<OpenParenthesisToken>();
    final condition = _parseBooleanExpression(const CloseParenthesisToken());
    final body = _parseBlock();

    ElseStatement? elseBody;

    if (peek() is ElseToken) {
      consume<ElseToken>();

      if (peek() is IfToken) {
        final ifStatement = _parseIfStatement();

        elseBody = ElseIfStatement(ifStatement.condition, ifStatement.body);
      } else {
        elseBody = ElseStatement(_parseBlock());
      }
    }

    return IfStatement(condition, body, elseBody);
  }

  BooleanExpression _parseBooleanExpression([
    Token terminator = const SemiColonToken(),
  ]) {
    return BooleanLiteral(true);
  }

  Expression _parseExpression([Token terminator = const SemiColonToken()]) {
    return _parseAdditiveExpr();
  }

  Expression _parsePrimaryExpression() {
    final token = peek();

    switch (token) {
      case IdentifierToken():
        final identifier = consume();
        return Identifier(identifier.value);
      case NumberToken():
        return _parseNumericLiteral();
      case OpenParenthesisToken():
        consume<OpenParenthesisToken>();
        final expression = _parseExpression();
        consume<CloseParenthesisToken>();
        return expression;
      default:
        throw UnexpectedTokenException(
          found: token,
        );
    }
  }

  NumericLiteral _parseNumericLiteral() {
    final number = consume<NumberToken>();

    if (peek() is DotToken) {
      consume<DotToken>();
      final decimal = consume<NumberToken>();
      return DoubleLiteral(
        double.parse('${number.value}.${decimal.value}'),
      );
    }

    return IntegerLiteral(num.parse(number.value));
  }

  Expression _parseAdditiveExpr() {
    var left = _parseMultiplicativeExpr();

    while (peek().value == '+' || peek().value == '-') {
      final operator = consume<BinaryOperatorToken>();
      final right = _parseMultiplicativeExpr();

      left = BinaryExpression(operator.value, left, right);
    }

    return left;
  }

  Expression _parseMultiplicativeExpr() {
    var left = _parsePrimaryExpression();

    while (peek().value == '*' || peek().value == '/' || peek().value == '%') {
      final operator = consume<BinaryOperatorToken>();
      final right = _parsePrimaryExpression();

      left = BinaryExpression(operator.value, left, right);
    }

    return left;
  }

  Contract _parseContract() {
    List<Implementation> implementations = [];
    consume<ContractToken>();
    final contractName = consume<IdentifierToken>();
    consume<OpenBraceToken>();

    while (peek() is! EndOfFileToken) {
      switch (peek()) {
        case ImplToken():
          implementations.add(_parseImplementation());
          continue;
        case ContractToken():
          throw Exception("Can't declare nested contracts.");
        case PermissionToken():
          throw ParseException(
            'Permission declaration must be before contract declaration.',
          );
        case CloseBraceToken():
          consume<CloseBraceToken>();
          return Contract(
            contractName.value,
            implementations,
          );
        default:
          throw UnexpectedTokenException(
            found: peek(),
          );
      }
    }

    consume<CloseBraceToken>();

    return Contract(
      contractName.value,
      implementations,
    );
  }

  Script parse(SourceCode code) {
    _tokens = tokenize(code);

    final List<Permission> permissions = [];
    Contract? contract;

    while (peek() is! EndOfFileToken) {
      switch (peek()) {
        case SemiColonToken():
          consume<SemiColonToken>();
          continue;
        case ContractToken():
          if (contract != null) {
            throw ParseException("Only one contract per script is allowed.");
          }

          contract = _parseContract();
        case PermissionToken():
          if (contract != null) {
            throw ParseException(
              'Permission declaration must be before contract declaration.',
            );
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
            permissions.add(Permission(namespace.value, permission.value));
          }

          consume<SemiColonToken>();
          continue;

        case EndOfFileToken():
          break;
        default:
          throw UnexpectedTokenException(
            found: peek(),
          );
      }
    }

    if (contract == null) {
      throw ParseException(
        'This script does not implement a contract. Thus parsing failed.',
      );
    }

    return Script(permissions, contract);
  }

  Token peek() {
    if (_tokens.isEmpty) {
      throw Exception('No more tokens available');
    }
    return _tokens.first;
  }

  Token consume<T extends Token>() {
    if (_tokens.isEmpty) {
      throw Exception('No more tokens available');
    }
    final token = _tokens.first;
    if (token is T) {
      return _tokens.removeAt(0);
    }
    throw UnexpectedTokenException(expected: T, found: token);
  }
}
