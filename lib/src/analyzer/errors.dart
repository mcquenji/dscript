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
      '$runtimeType: $message${span != null ? ' at $span' : ''}';
}

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

/// An error thrown when a semantic error occurs during analysis.
/// This is a subclass of [AnalyzerMessage] with a severity of 1.
class SemanticError extends AnalyzerMessage {
  /// An error thrown when a semantic error occurs during analysis.
  SemanticError(super.message, {required this.ctx})
      : super(span: Span.fromContext(ctx), severity: 1);

  /// The statement that caused the error.
  final ParserRuleContext? ctx;
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
class AssignmentError extends SemanticError {
  /// The variable that was assigned to.
  final String variable;

  /// The type that was expected.
  final $Type expected;

  /// The type that was found.
  final $Type found;

  /// An error thrown when a type mismatch occurs during assignment.
  AssignmentError(this.variable, this.expected, this.found,
      {required super.ctx})
      : super('Cannot assign $found to $variable of type $expected');
}

/// An error thrown when an invalid type is returned from a function.
class ReturnError extends SemanticError {
  /// The type that was expected.
  final $Type expected;

  /// The type that was found.
  final $Type found;

  /// An error thrown when an invalid type is returned from a function.
  ReturnError(this.expected, this.found, {required super.ctx})
      : super('Cannot return $found from function of type $expected');
}

/// An error thrown when a statement's runtime type cannot be inferred.
class InferenceError extends SemanticError {
  /// An error thrown when a statement's runtime type cannot be inferred.
  InferenceError({String? message, required super.ctx})
      : super(
          message ?? 'Cannot infer type for statement: ${ctx?.text}',
        );
}

/// Thrown by [Analyzer.analyze] if any errors are found during analysis.
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
    return 'AnalysisReport: ${errors.length} errors found:\n${errors.map((e) => ' - $e').join('\n')}';
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
}

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
