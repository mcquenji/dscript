// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log.dart';

// **************************************************************************
// Generator: DscriptNamespace
// **************************************************************************

abstract class _$LogBindings extends LibraryBinding {
  const _$LogBindings()
      : super(
            name: 'log',
            description:
                'Provides basic logging utitlities.\n\n!> Log messages will not be visible when using [IsolateRuntime].');

  @override
  Set<RuntimeBinding> get bindings => {
        infoBinding,
        warningBinding,
        severeBinding,
        fineBinding,
        finerBinding,
        finestBinding,
        configBinding,
        shoutBinding
      };

  static final List<PostBindingMiddleware<void>> _infoPostMiddlewares = [];
  static final List<PreBindingMiddleware<void>> _infoPreMiddlewares = [];

  bool _isinfoBinding(RuntimeBinding binding) {
    return binding.name == 'info' &&
        binding.description == infoBinding.description &&
        binding.returnType == infoBinding.returnType &&
        binding.positionalParams == infoBinding.positionalParams &&
        binding.namedParams == infoBinding.namedParams &&
        binding.permissions == infoBinding.permissions;
  }

  /// Logs general informational messages that highlight the progress of the application at a coarse level.
  void info(dynamic message, {dynamic error});

  /// Binding for [info].
  RuntimeBinding<void> get infoBinding => RuntimeBinding<void>(
        name: 'info',
        description:
            'Logs general informational messages that highlight the progress of the application at a coarse level.',
        function: info,
        returnType: $Type.from('void'),
        positionalParams: {'message': const DynamicType()},
        namedParams: {#error: const DynamicType()},
        permissions: const [],
        preMiddlewares: _infoPreMiddlewares,
        postMiddlewares: _infoPostMiddlewares,
      );

  static final List<PostBindingMiddleware<void>> _warningPostMiddlewares = [];
  static final List<PreBindingMiddleware<void>> _warningPreMiddlewares = [];

  bool _iswarningBinding(RuntimeBinding binding) {
    return binding.name == 'warning' &&
        binding.description == warningBinding.description &&
        binding.returnType == warningBinding.returnType &&
        binding.positionalParams == warningBinding.positionalParams &&
        binding.namedParams == warningBinding.namedParams &&
        binding.permissions == warningBinding.permissions;
  }

  /// Logs potential problems that are not yet errors but might require attention or could lead to issues.
  void warning(dynamic message, {dynamic error});

  /// Binding for [warning].
  RuntimeBinding<void> get warningBinding => RuntimeBinding<void>(
        name: 'warning',
        description:
            'Logs potential problems that are not yet errors but might require attention or could lead to issues.',
        function: warning,
        returnType: $Type.from('void'),
        positionalParams: {'message': const DynamicType()},
        namedParams: {#error: const DynamicType()},
        permissions: const [],
        preMiddlewares: _warningPreMiddlewares,
        postMiddlewares: _warningPostMiddlewares,
      );

  static final List<PostBindingMiddleware<void>> _severePostMiddlewares = [];
  static final List<PreBindingMiddleware<void>> _severePreMiddlewares = [];

  bool _issevereBinding(RuntimeBinding binding) {
    return binding.name == 'severe' &&
        binding.description == severeBinding.description &&
        binding.returnType == severeBinding.returnType &&
        binding.positionalParams == severeBinding.positionalParams &&
        binding.namedParams == severeBinding.namedParams &&
        binding.permissions == severeBinding.permissions;
  }

  /// Logs serious failures or errors that will likely prevent normal program execution.
  void severe(dynamic message, {dynamic error});

  /// Binding for [severe].
  RuntimeBinding<void> get severeBinding => RuntimeBinding<void>(
        name: 'severe',
        description:
            'Logs serious failures or errors that will likely prevent normal program execution.',
        function: severe,
        returnType: $Type.from('void'),
        positionalParams: {'message': const DynamicType()},
        namedParams: {#error: const DynamicType()},
        permissions: const [],
        preMiddlewares: _severePreMiddlewares,
        postMiddlewares: _severePostMiddlewares,
      );

  static final List<PostBindingMiddleware<void>> _finePostMiddlewares = [];
  static final List<PreBindingMiddleware<void>> _finePreMiddlewares = [];

  bool _isfineBinding(RuntimeBinding binding) {
    return binding.name == 'fine' &&
        binding.description == fineBinding.description &&
        binding.returnType == fineBinding.returnType &&
        binding.positionalParams == fineBinding.positionalParams &&
        binding.namedParams == fineBinding.namedParams &&
        binding.permissions == fineBinding.permissions;
  }

  /// Logs tracing information for debugging purposes.
  /// Less verbose than [finer] or [finest].
  void fine(dynamic message, {dynamic error});

  /// Binding for [fine].
  RuntimeBinding<void> get fineBinding => RuntimeBinding<void>(
        name: 'fine',
        description:
            'Logs tracing information for debugging purposes.\nLess verbose than [finer] or [finest].',
        function: fine,
        returnType: $Type.from('void'),
        positionalParams: {'message': const DynamicType()},
        namedParams: {#error: const DynamicType()},
        permissions: const [],
        preMiddlewares: _finePreMiddlewares,
        postMiddlewares: _finePostMiddlewares,
      );

  static final List<PostBindingMiddleware<void>> _finerPostMiddlewares = [];
  static final List<PreBindingMiddleware<void>> _finerPreMiddlewares = [];

  bool _isfinerBinding(RuntimeBinding binding) {
    return binding.name == 'finer' &&
        binding.description == finerBinding.description &&
        binding.returnType == finerBinding.returnType &&
        binding.positionalParams == finerBinding.positionalParams &&
        binding.namedParams == finerBinding.namedParams &&
        binding.permissions == finerBinding.permissions;
  }

  /// Logs fairly detailed tracing information.
  /// Useful when debugging complex flows with more granularity than [fine].
  void finer(dynamic message, {dynamic error});

  /// Binding for [finer].
  RuntimeBinding<void> get finerBinding => RuntimeBinding<void>(
        name: 'finer',
        description:
            'Logs fairly detailed tracing information.\nUseful when debugging complex flows with more granularity than [fine].',
        function: finer,
        returnType: $Type.from('void'),
        positionalParams: {'message': const DynamicType()},
        namedParams: {#error: const DynamicType()},
        permissions: const [],
        preMiddlewares: _finerPreMiddlewares,
        postMiddlewares: _finerPostMiddlewares,
      );

  static final List<PostBindingMiddleware<void>> _finestPostMiddlewares = [];
  static final List<PreBindingMiddleware<void>> _finestPreMiddlewares = [];

  bool _isfinestBinding(RuntimeBinding binding) {
    return binding.name == 'finest' &&
        binding.description == finestBinding.description &&
        binding.returnType == finestBinding.returnType &&
        binding.positionalParams == finestBinding.positionalParams &&
        binding.namedParams == finestBinding.namedParams &&
        binding.permissions == finestBinding.permissions;
  }

  /// Logs highly detailed tracing information.
  /// Intended for deep debugging, usually too verbose for normal use.
  void finest(dynamic message, {dynamic error});

  /// Binding for [finest].
  RuntimeBinding<void> get finestBinding => RuntimeBinding<void>(
        name: 'finest',
        description:
            'Logs highly detailed tracing information.\nIntended for deep debugging, usually too verbose for normal use.',
        function: finest,
        returnType: $Type.from('void'),
        positionalParams: {'message': const DynamicType()},
        namedParams: {#error: const DynamicType()},
        permissions: const [],
        preMiddlewares: _finestPreMiddlewares,
        postMiddlewares: _finestPostMiddlewares,
      );

  static final List<PostBindingMiddleware<void>> _configPostMiddlewares = [];
  static final List<PreBindingMiddleware<void>> _configPreMiddlewares = [];

  bool _isconfigBinding(RuntimeBinding binding) {
    return binding.name == 'config' &&
        binding.description == configBinding.description &&
        binding.returnType == configBinding.returnType &&
        binding.positionalParams == configBinding.positionalParams &&
        binding.namedParams == configBinding.namedParams &&
        binding.permissions == configBinding.permissions;
  }

  /// Logs static configuration messages.
  /// Typically used to record startup settings or environment details.
  void config(dynamic message, {dynamic error});

  /// Binding for [config].
  RuntimeBinding<void> get configBinding => RuntimeBinding<void>(
        name: 'config',
        description:
            'Logs static configuration messages.\nTypically used to record startup settings or environment details.',
        function: config,
        returnType: $Type.from('void'),
        positionalParams: {'message': const DynamicType()},
        namedParams: {#error: const DynamicType()},
        permissions: const [],
        preMiddlewares: _configPreMiddlewares,
        postMiddlewares: _configPostMiddlewares,
      );

  static final List<PostBindingMiddleware<void>> _shoutPostMiddlewares = [];
  static final List<PreBindingMiddleware<void>> _shoutPreMiddlewares = [];

  bool _isshoutBinding(RuntimeBinding binding) {
    return binding.name == 'shout' &&
        binding.description == shoutBinding.description &&
        binding.returnType == shoutBinding.returnType &&
        binding.positionalParams == shoutBinding.positionalParams &&
        binding.namedParams == shoutBinding.namedParams &&
        binding.permissions == shoutBinding.permissions;
  }

  /// Logs messages at the shout level.
  /// Louder than [severe]; use sparingly for attention-grabbing events.
  void shout(dynamic message, {dynamic error});

  /// Binding for [shout].
  RuntimeBinding<void> get shoutBinding => RuntimeBinding<void>(
        name: 'shout',
        description:
            'Logs messages at the shout level.\nLouder than [severe]; use sparingly for attention-grabbing events.',
        function: shout,
        returnType: $Type.from('void'),
        positionalParams: {'message': const DynamicType()},
        namedParams: {#error: const DynamicType()},
        permissions: const [],
        preMiddlewares: _shoutPreMiddlewares,
        postMiddlewares: _shoutPostMiddlewares,
      );

  /// Registers global middlewares for a [RuntimeBinding].
  ///
  /// These middlewares will always run when a binding is called, regardless of the context.
  ///
  /// For context aware middlewares you can call the [RuntimeBinding.addPreBindingMiddleware] and [RuntimeBinding.addPostBindingMiddleware] methods on the binding directly.
  void registerGlobalMiddlewares<T>(RuntimeBinding<T> binding,
      {List<PreBindingMiddleware<T>> preMiddlewares = const [],
      List<PostBindingMiddleware<T>> postMiddlewares = const []}) {
    if (_isinfoBinding(binding)) {
      _infoPreMiddlewares
          .addAll(preMiddlewares as List<PreBindingMiddleware<void>>);
      _infoPostMiddlewares
          .addAll(postMiddlewares as List<PostBindingMiddleware<void>>);

      return;
    }

    if (_iswarningBinding(binding)) {
      _warningPreMiddlewares
          .addAll(preMiddlewares as List<PreBindingMiddleware<void>>);
      _warningPostMiddlewares
          .addAll(postMiddlewares as List<PostBindingMiddleware<void>>);

      return;
    }

    if (_issevereBinding(binding)) {
      _severePreMiddlewares
          .addAll(preMiddlewares as List<PreBindingMiddleware<void>>);
      _severePostMiddlewares
          .addAll(postMiddlewares as List<PostBindingMiddleware<void>>);

      return;
    }

    if (_isfineBinding(binding)) {
      _finePreMiddlewares
          .addAll(preMiddlewares as List<PreBindingMiddleware<void>>);
      _finePostMiddlewares
          .addAll(postMiddlewares as List<PostBindingMiddleware<void>>);

      return;
    }

    if (_isfinerBinding(binding)) {
      _finerPreMiddlewares
          .addAll(preMiddlewares as List<PreBindingMiddleware<void>>);
      _finerPostMiddlewares
          .addAll(postMiddlewares as List<PostBindingMiddleware<void>>);

      return;
    }

    if (_isfinestBinding(binding)) {
      _finestPreMiddlewares
          .addAll(preMiddlewares as List<PreBindingMiddleware<void>>);
      _finestPostMiddlewares
          .addAll(postMiddlewares as List<PostBindingMiddleware<void>>);

      return;
    }

    if (_isconfigBinding(binding)) {
      _configPreMiddlewares
          .addAll(preMiddlewares as List<PreBindingMiddleware<void>>);
      _configPostMiddlewares
          .addAll(postMiddlewares as List<PostBindingMiddleware<void>>);

      return;
    }

    if (_isshoutBinding(binding)) {
      _shoutPreMiddlewares
          .addAll(preMiddlewares as List<PreBindingMiddleware<void>>);
      _shoutPostMiddlewares
          .addAll(postMiddlewares as List<PostBindingMiddleware<void>>);

      return;
    }

    // If no binding matched, throw an error.

    throw ArgumentError.value(binding, 'binding',
        'Binding does not match any known bindings in log: void, void, void, void, void, void, void, void');
  }
}
