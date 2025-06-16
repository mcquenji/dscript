// coverage:ignore-file
part of 'stdlib.dart';

/// Bindings for the logging standard library.
class LogBindings extends LibraryBinding {
  /// The logger instance for this script.
  late final Logger logger;

  /// Bindings for the logging standard library.
  LogBindings(ScriptMetadata metadata)
      : super(
          name: 'log',
          description: 'Logging utilities.',
        ) {
    logger = Logger(
      '[Dscript] ${metadata.author}.${metadata.name}@${metadata.version}',
    );
  }

  @override
  Set<RuntimeBinding> get bindings => {
        infoBinding,
        warningBinding,
        errorBinding,
        debugBinding,
        verboseBinding,
        fatalBinding,
        criticalBinding,
      };

  /// Binding for info logging.
  late final infoBinding = RuntimeBinding<void>(
    name: 'info',
    function: (dynamic message, {dynamic error}) => logger.info(message, error),
    positionalParams: {
      'message': const DynamicType(),
    },
    namedParams: {
      #error: const DynamicType(),
    },
    description: 'Logs an info message.',
  );

  /// Binding for warning logging.
  late final warningBinding = RuntimeBinding<void>(
    name: 'warning',
    function: (dynamic message, {dynamic error}) =>
        logger.warning(message, error),
    positionalParams: {
      'message': const DynamicType(),
    },
    namedParams: {
      #error: const DynamicType(),
    },
    description: 'Logs a warning message.',
  );

  /// Binding for error logging.
  late final errorBinding = RuntimeBinding<void>(
    name: 'error',
    function: (dynamic message, {dynamic error}) {
      logger.severe(message, error);
    },
    positionalParams: {
      'message': const DynamicType(),
    },
    namedParams: {
      #error: const DynamicType(),
    },
    description: 'Logs an error message.',
  );

  /// Binding for debug logging.
  late final debugBinding = RuntimeBinding<void>(
    name: 'debug',
    function: (dynamic message, {dynamic error}) => logger.fine(message, error),
    positionalParams: {
      'message': const DynamicType(),
    },
    namedParams: {
      #error: const DynamicType(),
    },
    description: 'Logs a debug message.',
  );

  /// Binding for verbose logging.
  late final verboseBinding = RuntimeBinding<void>(
    name: 'verbose',
    function: (dynamic message, {dynamic error}) =>
        logger.finer(message, error),
    positionalParams: {
      'message': const DynamicType(),
    },
    namedParams: {
      #error: const DynamicType(),
    },
    description: 'Logs a verbose message.',
  );

  /// Binding for fatal logging.
  late final fatalBinding = RuntimeBinding<void>(
    name: 'fatal',
    function: (dynamic message, {dynamic error}) =>
        logger.shout(message, error),
    positionalParams: {
      'message': const DynamicType(),
    },
    namedParams: {
      #error: const DynamicType(),
    },
    description: 'Logs a fatal message.',
  );

  /// Binding for critical logging.
  late final criticalBinding = RuntimeBinding<void>(
    name: 'critical',
    function: (dynamic message, {dynamic error}) =>
        logger.shout(message, error),
    positionalParams: {
      'message': const DynamicType(),
    },
    namedParams: {
      #error: const DynamicType(),
    },
    description: 'Logs a critical message.',
  );
}
