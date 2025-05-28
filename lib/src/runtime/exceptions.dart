/// Base class for all exceptions thrown during runtime execution.
class RuntimeException implements Exception {
  /// The error message.
  final String message;

  /// Base class for all exceptions thrown during runtime execution.
  const RuntimeException(this.message);

  @override
  String toString() {
    return 'RuntimeException: $message';
  }
}
