// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base64.dart';

// **************************************************************************
// Generator: DscriptNamespace
// **************************************************************************

abstract class _$Base64Bindings extends LibraryBinding {
  const _$Base64Bindings()
      : super(
            name: 'base64',
            description:
                'Provides utility functions for Base64 encoding and decoding.');

  @override
  Set<RuntimeBinding> get bindings => {encodeBinding, decodeBinding};

  static final List<PostBindingMiddleware<String>> _encodePostMiddlewares = [];
  static final List<PreBindingMiddleware<String>> _encodePreMiddlewares = [];

  bool _isencodeBinding(RuntimeBinding binding) {
    return binding.name == 'encode' &&
        binding.description == encodeBinding.description &&
        binding.returnType == encodeBinding.returnType &&
        binding.positionalParams == encodeBinding.positionalParams &&
        binding.namedParams == encodeBinding.namedParams &&
        binding.permissions == encodeBinding.permissions;
  }

  /// Encodes [input] to Base64 format.
  String encode(String input);

  /// Binding for [encode].
  RuntimeBinding<String> get encodeBinding => RuntimeBinding<String>(
        name: 'encode',
        description: 'Encodes [input] to Base64 format.',
        function: encode,
        returnType: PrimitiveType.STRING,
        positionalParams: {'input': PrimitiveType.STRING},
        namedParams: {},
        permissions: const [],
        preMiddlewares: _encodePreMiddlewares,
        postMiddlewares: _encodePostMiddlewares,
      );

  static final List<PostBindingMiddleware<String>> _decodePostMiddlewares = [];
  static final List<PreBindingMiddleware<String>> _decodePreMiddlewares = [];

  bool _isdecodeBinding(RuntimeBinding binding) {
    return binding.name == 'decode' &&
        binding.description == decodeBinding.description &&
        binding.returnType == decodeBinding.returnType &&
        binding.positionalParams == decodeBinding.positionalParams &&
        binding.namedParams == decodeBinding.namedParams &&
        binding.permissions == decodeBinding.permissions;
  }

  /// Decodes [input] from Base64 format.
  String decode(String input);

  /// Binding for [decode].
  RuntimeBinding<String> get decodeBinding => RuntimeBinding<String>(
        name: 'decode',
        description: 'Decodes [input] from Base64 format.',
        function: decode,
        returnType: PrimitiveType.STRING,
        positionalParams: {'input': PrimitiveType.STRING},
        namedParams: {},
        permissions: const [],
        preMiddlewares: _decodePreMiddlewares,
        postMiddlewares: _decodePostMiddlewares,
      );

  /// Registers global middlewares for a [RuntimeBinding].
  ///
  /// These middlewares will always run when a binding is called, regardless of the context.
  ///
  /// For context aware middlewares you can call the [RuntimeBinding.addPreBindingMiddleware] and [RuntimeBinding.addPostBindingMiddleware] methods on the binding directly.
  void registerGlobalMiddlewares<T>(RuntimeBinding<T> binding,
      {List<PreBindingMiddleware<T>> preMiddlewares = const [],
      List<PostBindingMiddleware<T>> postMiddlewares = const []}) {
    if (_isencodeBinding(binding)) {
      _encodePreMiddlewares
          .addAll(preMiddlewares as List<PreBindingMiddleware<String>>);
      _encodePostMiddlewares
          .addAll(postMiddlewares as List<PostBindingMiddleware<String>>);

      return;
    }

    if (_isdecodeBinding(binding)) {
      _decodePreMiddlewares
          .addAll(preMiddlewares as List<PreBindingMiddleware<String>>);
      _decodePostMiddlewares
          .addAll(postMiddlewares as List<PostBindingMiddleware<String>>);

      return;
    }

    // If no binding matched, throw an error.

    throw ArgumentError.value(binding, 'binding',
        'Binding does not match any known bindings in base64: String, String');
  }
}
