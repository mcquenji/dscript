// coverage:ignore-file
part of 'analyzer.dart';

/// Represents a span of text in the source code, defined by its start and end
/// lines and columns.
///
/// This is used to provide context for errors and messages
class Span {
  /// The start line of the span.
  final int? startLine;

  /// The end line of the span.
  final int? endLine;

  /// The start column of the span.
  final int? startColumn;

  /// The end column of the span.
  final int? endColumn;

  /// Creates a [Span] with the given [startLine], [endLine], [startColumn], and [endColumn].
  const Span({
    required this.startLine,
    required this.endLine,
    required this.startColumn,
    required this.endColumn,
  });

  /// Creates a [Span] from a [ParserRuleContext].
  Span.fromContext(final ParserRuleContext? ctx)
      : startLine = ctx?.start?.line,
        endLine = ctx?.stop?.line,
        startColumn = ctx?.start?.charPositionInLine,
        endColumn = ctx?.stop?.charPositionInLine;

  /// Creates a [Span] from a [Token].
  Span.fromToken(final Token? token)
      : startLine = token?.line,
        endLine = token?.line,
        startColumn = token?.charPositionInLine,
        endColumn = token?.charPositionInLine;

  @override
  String toString() => '$startLine:$startColumn to $endLine:$endColumn';
}

/// A message reported by the [Analyzer].
abstract class AnalyzerMessage implements Exception {
  /// The error message.
  final String message;

  /// The severity of the error according to LSP specification.
  final int severity;

  /// The context in which the error occurred, if available.
  final Span? span;

  /// Creates an [AnalyzerMessage] with the given [message].
  const AnalyzerMessage(this.message, {this.severity = 0, this.span});

  @override
  String toString() =>
      '${span != null ? ' [$span]' : ''} $runtimeType: $message';
}

/// A report of analysis errors.
class AnalysisReport extends AnalyzerMessage {
  /// The list of errors encountered during analysis.
  final List<AnalyzerMessage> errors = [];

  /// Creates an [AnalysisReport] with the given [errors].
  AnalysisReport()
      : super(
          '',
          span: null,
        );

  @override
  String toString() {
    final errorCount = errors.where((e) => e.severity == 1).length;
    final warningCount = errors.where((e) => e.severity == 2).length;

    return 'AnalysisReport: $errorCount errors found, $warningCount warnings found:\n${errors.map((e) => ' - $e').join('\n')}';
  }

  /// Reports an [AnalyzerMessage].
  void report(AnalyzerMessage error) {
    if (error is AnalysisReport) {
      merge(error);
      return;
    }

    errors.add(error);
  }

  /// Throws this report if it contains any errors.
  void throwIfErrors() {
    if (errors.isNotEmpty) {
      throw this;
    }
  }

  /// Merges another [AnalysisReport] into this one.
  void merge(AnalysisReport other) {
    errors.addAll(other.errors);
  }

  /// Returns true if this report contains any errors.
  bool get hasErrors => errors.isNotEmpty;

  /// Clears all warnings from the report.
  void clearWarnings() {
    errors.removeWhere((e) => e.severity == 2);
  }
}

// #region Semantics

// #region Warnings

/// A warning thrown when a semantic issue is detected during analysis.
///
/// This is a subclass of [AnalyzerMessage] with a severity of 2.
class SemanticWarning extends AnalyzerMessage {
  /// A warning thrown when a semantic issue is detected during analysis.
  SemanticWarning(super.message, {required this.ctx})
      : super(span: Span.fromContext(ctx), severity: 2);

  /// The statement that caused the warning.
  final ParserRuleContext? ctx;
}

/// An unnecessary null check warning.
class UnnecessaryNullCheckWarning extends SemanticWarning {
  /// The operator that was used in the null check, either '?' or '!'.
  final String op;

  /// An unnecessary null check warning.
  UnnecessaryNullCheckWarning(this.op, {required super.ctx})
      : super(
          op == '?'
              ? "The receiver can't be null, so the null-aware operator '?.' is unnecessary. Try removing the operator '?'."
              : "The '!' will have no effect because the receiver can't be null. Try removing the '!' operator.",
        );
}

// #endregion

// #region Errors

/// An error thrown when a semantic error occurs during analysis.
/// This is a subclass of [AnalyzerMessage] with a severity of 1.
class SemanticError extends AnalyzerMessage {
  /// An error thrown when a semantic error occurs during analysis.
  SemanticError(super.message, {required this.ctx})
      : super(span: Span.fromContext(ctx), severity: 1);

  /// The statement that caused the error.
  final ParserRuleContext? ctx;
}

/// Error thrown when a symbol referenced is not defined in the current scope.
class UndefinedError extends SemanticError {
  /// The name of the symbol that is not defined.
  final String name;

  /// Error thrown when a symbol referenced is not defined in the current scope.
  UndefinedError(this.name, {required super.ctx})
      : super("The name '$name' is not defined in this scope.");
}

/// An error thrown when a variable is not defined in the current scope.
class UndefinedVariableError extends UndefinedError {
  /// An error thrown when a variable is not defined in the current scope.
  UndefinedVariableError(super.name, {required super.ctx});
  @override
  String get message => "The variable '$name' is not defined in this scope.";
}

/// An error thrown when a referenced namespace is not defined.
class UndefinedNamespaceError extends UndefinedError {
  /// An error thrown when a referenced namespace is not defined.
  UndefinedNamespaceError(super.name, {required super.ctx});

  @override
  String get message => "No such namespace: '$name'.";
}

/// Thrown when a called function is not defined in the given [namespace] .
class UndefinedExternalFunctionError extends UndefinedError {
  /// The namespace in which the function is expected to be defined.
  final String namespace;

  /// An error thrown when a function is not defined in the current scope.
  UndefinedExternalFunctionError(super.name, this.namespace,
      {required super.ctx});

  @override
  String get message =>
      "The function '$name' is not defined in the '$namespace' namespace.";
}

/// An error thrown when a value is accessed without null safety checks,
/// but the value is potentially null.
class NullSafetyError extends SemanticError {
  /// The name of the value that is potentially null.
  final String? valueName;

  /// The name of the property that is being accessed.
  final String? propertyName;

  /// An error thrown when a value is accessed without null safety checks,
  /// but the value is potentially null.
  NullSafetyError(
      {required this.propertyName, required this.valueName, required super.ctx})
      : assert(propertyName != null || valueName != null),
        super(
          "${propertyName != null ? 'The property' : 'The value'} '${propertyName ?? valueName!}' can't be unconditionally accessed because the receiver can be 'null'. Try making the access conditional (using '?.') or adding a null check to the target ('!').",
        );
}

/// An error thrown when an external function is called without the required permission.
class PermissionError extends SemanticError {
  /// The name of the function that requires the permission.
  final String functionName;

  /// The name of the permission required by the function.
  final ScriptPermission permission;

  /// An error thrown when a permission is not granted.
  PermissionError(this.permission, this.functionName, {required super.ctx})
      : super(
          "Missing permission '$permission' for external function '$functionName'.",
        );
}

/// An error thrown when a type mismatch occurs during analysis.
class TypeError extends SemanticError {
  /// The type that was expected.
  final $Type expected;

  /// The type that was found.
  final $Type found;

  /// An error thrown when a type mismatch occurs during analysis.
  TypeError(this.expected, this.found, {required super.ctx})
      : super('Expected type $expected but found $found');
}

/// An error thrown when a type mismatch occurs during assignment.
class AssignmentError extends TypeError {
  /// An error thrown when a type mismatch occurs during assignment.
  AssignmentError(super.expected, super.found, {required super.ctx});

  @override
  String get message =>
      "A value of type '$found' can't be assigned a variable of type '$expected'.";
}

/// An error thrown when an invalid type is returned from a function.
class ReturnError extends TypeError {
  /// An error thrown when an invalid type is returned from a function.
  ReturnError(super.expected, super.found, {required super.ctx});

  @override
  String get message =>
      "A value of type '$found' can't be returned from this function because it has a return type of '$expected'.";
}

/// An error thrown when a statement's runtime type cannot be inferred.
class InferenceError extends SemanticError {
  /// An error thrown when a statement's runtime type cannot be inferred.
  InferenceError({String? message, required super.ctx})
      : super(
          message ?? 'Cannot infer type for statement: ${ctx?.text}',
        );
}

/// An error thrown when an operation is not supported for a given type.
class OperationError extends SemanticError {
  /// The operation that caused the error.
  final String operation;

  /// The type for which the operation is not supported.
  final $Type type;

  /// An error thrown when an operation is not supported for a given type.
  OperationError(this.operation, this.type, {required super.ctx})
      : super("The operation '$operation' is not supported for type '$type'.");
}

/// Thrown when too many or too little positional arguments are passed to a function.
class PositionalArgumentError extends SemanticError {
  /// The name of the function that was called.
  final String functionName;

  /// The number of positional arguments that were passed.
  final int argumentCount;

  /// The maximum number of positional arguments that the function accepts.
  final int maxArguments;

  /// An error thrown when too many or too little positional arguments are passed to a function.
  PositionalArgumentError(
    this.functionName,
    this.argumentCount,
    this.maxArguments, {
    required super.ctx,
  }) : super(
          maxArguments > argumentCount
              ? "$maxArguments positional argument${maxArguments > 1 ? 's' : ''} expected by '$functionName', but $argumentCount found"
              : "Too many positional arguments: $maxArguments expected by '$functionName', but $argumentCount found.",
        );
}

/// An error thrown when a function or variable are already defined in the current scope.
class RedefinitionError extends SemanticError {
  /// The name of the function or variable that was redefined.
  final String name;

  /// An error thrown when a function or variable are already defined in the current scope.
  RedefinitionError(this.name, {required super.ctx})
      : super("The name '$name' is already defined in this scope.");
}

/// An error thrown when required metadata is not defined in the script.
class RequiredMetadataError extends SemanticError {
  /// The name of the required metadata that is missing.
  final String metadataName;

  /// An error thrown when required metadata is not defined in the script.
  RequiredMetadataError(this.metadataName, {required super.ctx})
      : super("The required metadata '$metadataName' is not defined.");
}

/// An error thrown when an argument's type does not match the expected type.
class ArgumentTypeMismatchError extends TypeError {
  /// An error thrown when an argument's type does not match the expected type.
  ArgumentTypeMismatchError(
    super.expected,
    super.found, {
    required super.ctx,
  });

  @override
  String get message =>
      "The argument type '$found' can't be assigned to the parameter type '$expected'.";
}

/// Thrown when a named argument is passed that is not defined in the function signature.
class UndefinedArgumentError extends SemanticError {
  /// The name of the function that was called.
  final String functionName;

  /// The name of the argument that caused the error.
  final String argumentName;

  /// An error thrown when a named argument is not defined in the function signature.
  UndefinedArgumentError(
    this.functionName,
    this.argumentName, {
    required super.ctx,
  }) : super(
          "The named parameter '$argumentName' isn't defined in the function '$functionName'",
        );
}

/// An error thrown when a hook declaration is invalid. This may be due to
/// the hook not being defined in the contract or having an incorrect number of parameters.
///
/// In case of the latter, [maxArgs] and [foundArgs] are expected to be non-null.
class HookDeclarationError extends SemanticError {
  /// The name of the hook that caused the error.
  final String hookName;

  /// The
  final int? maxArgs;

  /// The number of arguments found in the hook declaration.
  final int? foundArgs;

  /// An error thrown when a hook declaration is invalid. This may be due to
  /// the hook not being defined in the contract or having an incorrect number of parameters.
  ///
  /// In case of the latter, [maxArgs] and [foundArgs] are expected to be non-null.
  HookDeclarationError(this.hookName,
      {this.maxArgs, this.foundArgs, required super.ctx})
      : assert((maxArgs == null && foundArgs == null) ||
            (maxArgs != null && foundArgs != null)),
        super(
          maxArgs != null
              ? "Hook '$hookName' declaration is invalid: expected $maxArgs parameters, but found $foundArgs."
              : "Hook '$hookName' is not defined in the contract.",
        );
}

/// An error thrown when a hook declaration is invalid. This may be due to:
/// 1. The implementation not being defined in the contract.
///    - In this case, [maxArgs], [foundArgs], [returnType] and [actualReturnType] are expected to be null.
/// 2. The implementation having an incorrect number of parameters.
///    - In this case, [maxArgs] and [foundArgs] are expected to be non-null.
/// 3. The implementation having an incorrect return type.
///    - In this case, [returnType] and [actualReturnType] are expected to be non-null.
class ImplentationDeclarationError extends SemanticError {
  /// The expected return type of the implementation.
  final $Type? returnType;

  /// The actual return type of the implementation.
  final $Type? actualReturnType;

  /// The name of the implementation that caused the error.
  final String implName;

  /// The maximum number of arguments expected by the implementation.
  final int? maxArgs;

  /// The number of arguments found in the implementation declaration.
  final int? foundArgs;

  /// An error thrown when an implementation declaration is invalid. This may be due to:
  /// 1. The implementation not being defined in the contract.
  ///    - In this case, [maxArgs], [foundArgs], [returnType] and [actualReturnType] are expected to be null.
  /// 2. The implementation having an incorrect number of parameters.
  ///    - In this case, [maxArgs] and [foundArgs] are expected to be non-null.
  /// 3. The implementation having an incorrect return type.
  ///    - In this case, [returnType] and [actualReturnType] are expected to be non-null.
  ImplentationDeclarationError(
    this.implName, {
    this.maxArgs,
    this.foundArgs,
    this.returnType,
    this.actualReturnType,
    required super.ctx,
  })  : assert((maxArgs == null &&
                foundArgs == null &&
                returnType == null &&
                actualReturnType == null) ||
            (maxArgs == null &&
                foundArgs == null &&
                returnType != null &&
                actualReturnType != null) ||
            (maxArgs != null &&
                foundArgs != null &&
                returnType == null &&
                actualReturnType == null)),
        super(
          maxArgs != null
              ? "Implementation '$implName' declaration is invalid: expected $maxArgs parameters, but found $foundArgs."
              : returnType != null
                  ? "Implementation '$implName' declaration is invalid: expected return type '$returnType', but found '$actualReturnType'."
                  : "Implementation '$implName' is not defined in the contract.",
        );
}

/// An error thrown when a contract declaration is invalid.
/// This may be due to:
/// 1. The contract not being defined in the script.
///    - In this case, [implementations] and [foundImplementations] are expected to be null.
/// 2. The contract missing definitions for implementations.
///    - In this case, [implementations] and [foundImplementations] are expected to be non-null.
class ContractDeclarationError extends SemanticError {
  /// The name of the contract that caused the error.
  final String contractName;

  /// The number of implementations expected by the contract.
  final List<String>? implementations;

  /// The number of implementations found in the contract declaration.
  final List<String>? foundImplementations;

  /// An error thrown when a contract declaration is invalid. This may be due to:
  /// 1. The contract not being defined in the script.
  ///    - In this case, [implementations] and [foundImplementations] are expected to be null.
  /// 2. The contract missing definitions for implementations.
  ///    - In this case, [implementations] and [foundImplementations] are expected to be non-null.
  ContractDeclarationError(
    this.contractName, {
    this.implementations,
    this.foundImplementations,
    required super.ctx,
  })  : assert((implementations == null && foundImplementations == null) ||
            (implementations != null &&
                foundImplementations != null &&
                implementations.isNotEmpty)),
        super(
          implementations != null
              ? "Contract '$contractName' is missing implementations for ${implementations.where((i) => !foundImplementations!.contains(i)).map((e) => "'$e'").join(', ')}."
              : "No such contract '$contractName'.",
        );
}

// #endregion

// #endregion

// #region Syntax

/// An error thrown when a syntax error is encountered during parsing.
///
/// This is a subclass of [AnalyzerMessage] with a severity of 1.
class SyntaxError extends AnalyzerMessage {
  /// Creates a [SyntaxError] with the given [message].
  SyntaxError(super.message, {required this.token})
      : super(severity: 1, span: Span.fromToken(token));

  /// The token that caused the syntax error, if available.
  final Token? token;
}

// #endregion
