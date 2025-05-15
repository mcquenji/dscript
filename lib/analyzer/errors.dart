part of 'analyzer.dart';

/// Represents an error that occurred during the analysis of a script.
class AnalyzerError implements Exception {
  /// The error message.
  final String message;

  /// Creates an [AnalyzerError] with the given [message].
  const AnalyzerError(this.message);

  @override
  String toString() => '$runtimeType: $message';
}

/// An [AnalyzerError] with additional line and column information.
class DetailedAnalyzerError extends AnalyzerError {
  /// The line number where the error occurred.
  final int line;

  /// The column number where the error occurred.
  final int column;

  /// The original error.
  final AnalyzerError error;

  /// Creates a [DetailedAnalyzerError] with the given [message], [line], and [column].
  DetailedAnalyzerError(this.error, {this.line = -1, this.column = -1})
      : super(error.message);

  @override
  String toString() {
    return 'DetailedAnalyzerError: $message at line $line, column $column';
  }
}

/// An error thrown when a type mismatch occurs during analysis.
class TypeError extends AnalyzerError {
  /// The type that was expected.
  final $Type expected;

  /// The type that was found.
  final $Type found;

  /// An error thrown when a type mismatch occurs during analysis.
  TypeError(this.expected, this.found)
      : super('Expected type $expected but found $found');

  @override
  String toString() => 'TypeError: $message';
}

class InferenceError extends AnalyzerError {
  final Statement statement;

  InferenceError(this.statement, {String? message})
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
  AnalysisReport() : super('');

  @override
  String toString() {
    return 'AnalysisReport: ${errors.length} errors found:\n${errors.map((e) => ' - $e').join('\n')}';
  }

  /// Reports an [AnalyzerError].
  void report(AnalyzerError error, {int line = -1, int column = -1}) {
    if (error is DetailedAnalyzerError || line == -1 || column == -1) {
      // If the error is already detailed or no line/column is provided,
      // just add it to the list.
      errors.add(error);
    } else {
      errors.add(DetailedAnalyzerError(error, line: line, column: column));
    }
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
