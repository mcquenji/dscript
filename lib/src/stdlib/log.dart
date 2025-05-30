part of 'stdlib.dart';

/// Bindings for the logging standard library.
class LogBindings extends LibraryBinding {
  /// The script this binding is associated with.
  ///
  /// Used for logging context.
  // final Script script;

  /// The logger instance for this script.
  late final Logger logger;

  /// Bindings for the logging standard library.
  // LogBindings(this.script) : super(name: 'log') {
  //   logger = Logger(
  //     'Dscript.${script.contract.name}.${script.name}@${script.author}',
  //   );

  LogBindings() : super(name: 'log') {
    logger = Logger('Dscript.StdLib.LogBindings');
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
    function: (String message, {String? error}) => logger.info(message, error),
    positionalParams: [
      PrimitiveType.STRING,
    ],
    namedParams: {
      #error: PrimitiveType.STRING.asNullable(),
    },
    description: 'Logs an info message.',
  );

  /// Binding for warning logging.
  late final warningBinding = RuntimeBinding<void>(
    name: 'warning',
    function: (String message, {String? error}) =>
        logger.warning(message, error),
    positionalParams: [
      PrimitiveType.STRING,
    ],
    namedParams: {
      #error: PrimitiveType.STRING.asNullable(),
    },
    description: 'Logs a warning message.',
  );

  /// Binding for error logging.
  late final errorBinding = RuntimeBinding<void>(
    name: 'error',
    function: (String message, {String? error}) {
      logger.severe(message, error);
    },
    positionalParams: [
      PrimitiveType.STRING,
    ],
    namedParams: {
      #error: PrimitiveType.STRING.asNullable(),
    },
    description: 'Logs an error message.',
  );

  /// Binding for debug logging.
  late final debugBinding = RuntimeBinding<void>(
    name: 'debug',
    function: (String message, {String? error}) => logger.fine(message, error),
    positionalParams: [
      PrimitiveType.STRING,
    ],
    namedParams: {
      #error: PrimitiveType.STRING.asNullable(),
    },
    description: 'Logs a debug message.',
  );

  /// Binding for verbose logging.
  late final verboseBinding = RuntimeBinding<void>(
    name: 'verbose',
    function: (String message, {String? error}) => logger.finer(message, error),
    positionalParams: [
      PrimitiveType.STRING,
    ],
    namedParams: {
      #error: PrimitiveType.STRING.asNullable(),
    },
    description: 'Logs a verbose message.',
  );

  /// Binding for fatal logging.
  late final fatalBinding = RuntimeBinding<void>(
    name: 'fatal',
    function: (String message, {String? error}) => logger.shout(message, error),
    positionalParams: [
      PrimitiveType.STRING,
    ],
    namedParams: {
      #error: PrimitiveType.STRING.asNullable(),
    },
    description: 'Logs a fatal message.',
  );

  /// Binding for critical logging.
  late final criticalBinding = RuntimeBinding<void>(
    name: 'critical',
    function: (String message, {String? error}) => logger.shout(message, error),
    positionalParams: [
      PrimitiveType.STRING,
    ],
    namedParams: {
      #error: PrimitiveType.STRING.asNullable(),
    },
    description: 'Logs a critical message.',
  );
}
