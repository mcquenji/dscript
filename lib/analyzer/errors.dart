part of 'analyzer.dart';

/// Represents an error that occurred during the analysis of a script.
class AnalyzerError implements Exception {
  /// The error message.
  final String message;

  /// The statement that caused the error.
  final Statement? statement;

  /// The severity of the error according to LSP specification.
  final int severity;

  /// Creates an [AnalyzerError] with the given [message].
  const AnalyzerError(this.message,
      {required this.statement, this.severity = 0});

  @override
  String toString() =>
      '$runtimeType: $message${statement != null ? ' at ${statement!.lineStart}:${statement!.columnStart} to ${statement!.lineEnd}:${statement!.columnEnd}' : ''}';
}

/// An error thrown when a type mismatch occurs during analysis.
class TypeError extends AnalyzerError {
  /// The type that was expected.
  final $Type expected;

  /// The type that was found.
  final $Type found;

  /// An error thrown when a type mismatch occurs during analysis.
  TypeError(this.expected, this.found, {required super.statement})
      : super('Expected type $expected but found $found');

  @override
  String toString() => 'TypeError: $message';
}

/// An error thrown when a type mismatch occurs during assignment.
class AssignmentError extends AnalyzerError {
  /// The variable that was assigned to.
  final String variable;

  /// The type that was expected.
  final $Type expected;

  /// The type that was found.
  final $Type found;

  /// An error thrown when a type mismatch occurs during assignment.
  AssignmentError(this.variable, this.expected, this.found,
      {required super.statement})
      : super('Cannot assign $found to $variable of type $expected');
}

/// An error thrown when an invalid type is returned from a function.
class ReturnError extends AnalyzerError {
  /// The type that was expected.
  final $Type expected;

  /// The type that was found.
  final $Type found;

  /// An error thrown when an invalid type is returned from a function.
  ReturnError(this.expected, this.found, {required super.statement})
      : super('Cannot return $found from function of type $expected');
}

/// An error thrown when a statement's runtime type cannot be inferred.
class InferenceError extends AnalyzerError {
  /// An error thrown when a statement's runtime type cannot be inferred.
  InferenceError({String? message, required super.statement})
      : super(
          message ??
              'Cannot infer type for statement: ${statement.runtimeType}',
        );
}

/// Thrown by [Analyzer.analyze] if any errors are found during analysis.
class AnalysisReport extends AnalyzerError {
  /// The list of errors encountered during analysis.
  final List<AnalyzerError> errors = [];

  /// Creates an [AnalysisReport] with the given [errors].
  AnalysisReport()
      : super(
          '',
          statement: null,
        );

  @override
  String toString() {
    return 'AnalysisReport: ${errors.length} errors found:\n${errors.map((e) => ' - $e').join('\n')}';
  }

  /// Reports an [AnalyzerError].
  void report(AnalyzerError error) {
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
}
