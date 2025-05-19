part of 'lexer.dart';

/// Base class for all keyword tokens in the DSL lexer.
///
/// Extends [Token] to represent reserved words that have special meaning
/// in the language syntax. Carries the keyword text and optional
/// source position metadata for error reporting.
sealed class KeywordToken extends Token {
  /// Creates a keyword token with the provided [value], and optional
  /// [line] and [column] indicating where it was found in the source.
  const KeywordToken(super.value, {super.line, super.column});
}

/// Token representing the `final` keyword.
///
/// Used to mark declarations that cannot be reassigned.
class FinalToken extends VariableKeywordToken {
  /// Creates a `final` keyword token with optional position metadata.
  const FinalToken({super.line, super.column}) : super('final');
}

/// Token representing any keywords that have to do with variable declarations.
sealed class VariableKeywordToken extends KeywordToken {
  /// Creates a `variable` keyword token with optional position metadata.
  const VariableKeywordToken(super.value, {super.line, super.column});
}

/// Token representing the `var` keyword.
///
/// Used to declare mutable local variables without an explicit type.
class VarToken extends VariableKeywordToken {
  /// Creates a `var` keyword token with optional position metadata.
  const VarToken({super.line, super.column}) : super('var');
}

/// Token representing the `const` keyword.
///
/// Used to declare compile-time constants that may not be reassigned and may only have literal values or other constants.
class ConstToken extends VariableKeywordToken {
  /// Creates a `const` keyword token with optional position metadata.
  const ConstToken({super.line, super.column}) : super('const');
}

/// Token representing the `impl` keyword.
///
/// Marks the implementation of a contract function in the DSL.
class ImplToken extends KeywordToken {
  /// Creates an `impl` keyword token with optional position metadata.
  const ImplToken({super.line, super.column}) : super('impl');
}

/// Token representing the `contract` keyword.
///
/// Declares a new contract interface that plugins must implement.
class ContractToken extends KeywordToken {
  /// Creates a `contract` keyword token with optional position metadata.
  const ContractToken({super.line, super.column}) : super('contract');
}

/// Token representing the `return` keyword.
///
/// Used to return a value from an implementation function.
class ReturnToken extends KeywordToken {
  /// Creates a `return` keyword token with optional position metadata.
  const ReturnToken({super.line, super.column}) : super('return');
}

/// Token representing the `if` keyword.
///
/// Starts a conditional branch in the implementation logic.
class IfToken extends KeywordToken {
  /// Creates an `if` keyword token with optional position metadata.
  const IfToken({super.line, super.column}) : super('if');
}

/// Token representing the `else` keyword.
///
/// Provides the alternate branch for a preceding `if`.
class ElseToken extends KeywordToken {
  /// Creates an `else` keyword token with optional position metadata.
  const ElseToken({super.line, super.column}) : super('else');
}

/// Token representing the `for` keyword.
///
/// Begins a for-loop construct over iterable values.
class ForToken extends KeywordToken {
  /// Creates a `for` keyword token with optional position metadata.
  const ForToken({super.line, super.column}) : super('for');
}

/// Token representing the `while` keyword.
///
/// Begins a while-loop that repeats while a condition holds.
class WhileToken extends KeywordToken {
  /// Creates a `while` keyword token with optional position metadata.
  const WhileToken({super.line, super.column}) : super('while');
}

/// Token representing the `break` keyword.
///
/// Exits the nearest enclosing loop immediately.
class BreakToken extends KeywordToken {
  /// Creates a `break` keyword token with optional position metadata.
  const BreakToken({super.line, super.column}) : super('break');
}

/// Token representing the `continue` keyword.
///
/// Skips to the next iteration of the nearest enclosing loop.
class ContinueToken extends KeywordToken {
  /// Creates a `continue` keyword token with optional position metadata.
  const ContinueToken({super.line, super.column}) : super('continue');
}

/// Token representing the `null` keyword.
///
/// Indicates the absence of a value.
class NullToken extends KeywordToken {
  /// Creates a `null` keyword token with optional position metadata.
  const NullToken({super.line, super.column}) : super('null');
}

/// Token representing the `hook` keyword.
///
/// Declares an optional hook function that the host may invoke on events.
class HookToken extends KeywordToken {
  /// Creates a `hook` keyword token with optional position metadata.
  const HookToken({super.line, super.column}) : super('hook');
}
