part of '../ast.dart';

/// Parser extension for parsing hooks and implementations.
extension FunctionParser on Parser {
  /// Parses the parameter list of a function declaration.
  List<Parameter> _parseParameters() {
    final List<Parameter> parameters = [];
    consume<OpenParenthesisToken>();

    while (peek() is! CloseParenthesisToken) {
      final parameterType = consume<IdentifierToken>();
      bool nullable = false;

      if (peek() is QuestionToken) {
        consume<QuestionToken>();
        nullable = true;
      }
      final parameterName = consume<IdentifierToken>();
      parameters.add(
        Parameter(
          parameterName.value,
          $Type.from(parameterType.value + (nullable ? '?' : '')),
        ),
      );

      if (peek() is CommaToken) {
        consume<CommaToken>();
        if (peek() is CloseParenthesisToken) {
          throw UnexpectedTokenException(found: peek());
        }
      }
    }
    consume<CloseParenthesisToken>();
    return parameters;
  }

  /// Parses the return type of a function declaration.
  $Type _parseReturnType([String? expected, String? errorMessage]) {
    String returnType = 'void';
    if (peek() is ArrowToken) {
      consume<ArrowToken>();
      final returnTypeToken = consume<IdentifierToken>();
      returnType = returnTypeToken.value;
    }

    if (peek() is QuestionToken) {
      consume<QuestionToken>();
      returnType += '?';
    }

    if (expected != null && returnType != expected) {
      throw ParseException(
        errorMessage ??
            'Expected return type "$expected", but found "$returnType".',
        line: peek().line,
        column: peek().column,
      );
    }

    return $Type.from(returnType);
  }

  /// Parses an `impl` function implementation.
  ///
  /// Expects an [ImplToken], function name, parameter list, optional return type,
  /// and a block body returning an [Implementation] AST node.
  Implementation _parseImplementation() {
    consume<ImplToken>();
    final functionName = consume<IdentifierToken>();

    final List<Parameter> parameters = _parseParameters();

    return Implementation(
      name: functionName.value,
      parameters: parameters,
      returnType: _parseReturnType(),
      body: _parseBlock(),
    );
  }

  /// Parses a `hook` function declaration.
  ///
  /// Expects a [HookToken], function name, parameter list, optional return arrow,
  /// and a block body, returning a [Hook] AST node.
  Hook _parseHook() {
    consume<HookToken>();
    final functionName = consume<IdentifierToken>();

    final List<Parameter> parameters = _parseParameters();

    _parseReturnType('void', 'Hooks must return void');

    return Hook(
      name: functionName.value,
      parameters: parameters,
      body: _parseBlock(),
    );
  }

  /// Parses a call to an external function.
  ExternalCall _parseExternalCall(IdentifierToken namespace) {
    consume<DoubleColonToken>();
    final functionName = consume<IdentifierToken>() as IdentifierToken;

    final func = _parseFunctionCall(functionName);

    return ExternalCall(
      namespace: namespace.value,
      method: functionName.value,
      positionalArgs: func.positionalArgs,
      namedArgs: func.namedArgs,
      lineStart: namespace.line,
      columnStart: namespace.column,
      lineEnd: func.lineEnd,
      columnEnd: func.columnEnd,
    );
  }

  /// Parses the arguments passed to a function call.
  Token _parseArgs(List<Expression> args, Map<String, Expression> namedArgs) {
    consume<OpenParenthesisToken>();
    while (peek() is! CloseParenthesisToken) {
      if (peek() is CommaToken) {
        consume<CommaToken>();
        continue;
      }

      if (peek(true) is IdentifierToken && peek(false, 2) is ColonToken) {
        final name = consume<IdentifierToken>().value;
        consume<ColonToken>();
        final value = _parseExpression();
        namedArgs[name] = value;
      } else {
        final arg = _parseExpression();
        args.add(arg);
      }
    }

    return consume<CloseParenthesisToken>();
  }

  /// Parses a function call.
  CallExpression _parseFunctionCall(IdentifierToken id) {
    final List<Expression> args = [];
    final Map<String, Expression> namedArgs = {};

    final end = _parseArgs(args, namedArgs);

    if (peek() is DoubleColonToken) {
      return _parseExternalCall(id);
    }

    return CallExpression(
      method: id.value,
      positionalArgs: args,
      namedArgs: namedArgs,
      lineStart: id.line,
      columnStart: id.column,
      lineEnd: end.line,
      columnEnd: end.endColumn,
    );
  }
}
