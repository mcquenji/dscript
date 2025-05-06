part of 'stdlib.dart';

/// Bindings for the logging standard library.
class LogBindings extends LibraryBinding {
  /// The script this binding is associated with.
  ///
  /// Used for logging context.
  final Script script;

  /// The logger instance for this script.
  late final Logger logger;

  /// Bindings for the logging standard library.
  LogBindings(this.script) : super(name: 'log') {
    logger = logger = Logger(
      'Dscript.${script.contract.name}.${script.name} v${script.version} by ${script.author}',
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
    function: (String message, {String? error}) => logger.info(message, error),
    positionalParams: [String],
    namedParams: {
      #error: String,
    },
  );

  /// Binding for warning logging.
  late final warningBinding = RuntimeBinding<void>(
    name: 'warning',
    function: (String message, {String? error}) =>
        logger.warning(message, error),
    positionalParams: [String],
    namedParams: {
      #error: String,
    },
  );

  /// Binding for error logging.
  late final errorBinding = RuntimeBinding<void>(
    name: 'error',
    function: (String message, {String? error}) =>
        logger.severe(message, error),
    positionalParams: [String],
    namedParams: {
      #error: String,
    },
  );

  /// Binding for debug logging.
  late final debugBinding = RuntimeBinding<void>(
    name: 'debug',
    function: (String message, {String? error}) => logger.fine(message, error),
    positionalParams: [String],
    namedParams: {
      #error: String,
    },
  );

  /// Binding for verbose logging.
  late final verboseBinding = RuntimeBinding<void>(
    name: 'verbose',
    function: (String message, {String? error}) => logger.finer(message, error),
    positionalParams: [String],
    namedParams: {
      #error: String,
    },
  );

  /// Binding for fatal logging.
  late final fatalBinding = RuntimeBinding<void>(
    name: 'fatal',
    function: (String message, {String? error}) => logger.shout(message, error),
    positionalParams: [String],
    namedParams: {
      #error: String,
    },
  );

  /// Binding for critical logging.
  late final criticalBinding = RuntimeBinding<void>(
    name: 'critical',
    function: (String message, {String? error}) => logger.shout(message, error),
    positionalParams: [String],
    namedParams: {
      #error: String,
    },
  );
}
