part of '../ast.dart';

/// Parser extension for parsing hooks and implementations.
extension FunctionParser on Parser {
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
          parameterType.value,
          nullable,
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

  String _parseReturnType([String? expected, String? errorMessage]) {
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

    return returnType;
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
}
