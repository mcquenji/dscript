part of '../ast.dart';

/// Parses the top-level `contract` declaration and its contents.
extension ContractParser on Parser {
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
          throw ParseException(
            "Can't declare nested contracts.",
            line: peek().line,
            column: peek().column,
          );
        case PermissionToken():
          throw ParseException(
            'Permission declaration must be before contract declaration.',
            line: peek().line,
            column: peek().column,
          );
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
}
