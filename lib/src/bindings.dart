// coverage:ignore-file
import 'dart:async';

import 'package:dscript_dart/src/permissions.dart';
import 'package:dscript_dart/src/stdlib/stdlib.dart';
import 'package:dscript_dart/src/types.dart';

/// A binding that connects a Dart function to the dscript runtime.
class RuntimeBinding<T> {
  /// The name of the binding.
  final String name;

  /// The function associated with this binding.
  ///
  /// It is expected to return a value of type FutureOr<[T]>.
  /// The accepted parameters must match [namedParams] and [positionalParams].
  final Function function;

  /// A map of parameter names to their expected types.
  final Map<Symbol, $Type> namedParams;

  /// A list of permissions required by this binding.
  final List<ScriptPermission> permissions;

  /// A list of positional parameters in the order they are expected.
  final Map<String, $Type> positionalParams;

  /// Optional description of the binding.
  ///
  /// Used for hover text in the editor in the future.
  final String? description;

  /// The return type of the function as a dsl type.
  $Type get returnType => $Type.from(T.toString());

  /// A list of pre-binding middlewares that are called before the binding's function is executed.
  ///
  /// These middlewares will be called in the order they are added.
  final List<PreBindingMiddleware<T>> _preMiddlewares = [validateArgs<T>];

  /// A list of pre-binding middlewares that are called before the binding's function is executed.
  ///
  /// These middlewares will be called in the order they are added.
  final List<PostBindingMiddleware<T>> _postMiddlewares = [];

  /// Creates a new [RuntimeBinding] instance.
  RuntimeBinding({
    required this.name,
    required this.function,
    this.namedParams = const {},
    this.permissions = const [],
    this.positionalParams = const {},
    required this.description,
  });

  /// Adds a [PreBindingMiddleware] to this binding called in the order it was added.
  ///
  /// Any changes made to the arguments in the middleware will be passed to the next middleware in the chain
  /// and finally to the bound function.
  void addPreMiddleware(PreBindingMiddleware<T> middleware) {
    _preMiddlewares.add(middleware);
  }

  /// Adds a [PostBindingMiddleware] to this binding called in the order it was added.
  ///
  /// The result of the added middleware will be passed to the next middleware in the chain
  /// and finally to the caller.
  void addPostMiddleware(PostBindingMiddleware<T> middleware) {
    _postMiddlewares.add(middleware);
  }

  /// Calls the bound function with the provided arguments.
  Future<T> call(List<dynamic> positionalArgs,
      {Map<Symbol, dynamic> namedArgs = const {}}) async {
    positionalArgs = List.from(positionalArgs);
    namedArgs = Map<Symbol, dynamic>.from(namedArgs);

    // call the pre-middlewares
    for (final middleware in _preMiddlewares) {
      await middleware(
        binding: this,
        positionalArgs: positionalArgs,
        namedArgs: namedArgs,
      );
    }

    var result = await Function.apply(
      function,
      positionalArgs,
      namedArgs,
    );

    final resultType = $Type.fromValue(result);

    if (resultType.canCast(returnType)) {
      // Cast the result to the expected return type
      result = resultType.cast(returnType, result) as T;
    } else {
      throw StateError(
        'Invalid return type: expected $T, got ${result.runtimeType}',
      );
    }

    // call the post-middlewares

    return await _postMiddlewares.fold<Future<T>>(
      Future.value(result),
      (previous, middleware) async {
        final res = await previous;
        return middleware(
          binding: this,
          result: res,
          positionalArgs: positionalArgs,
          namedArgs: namedArgs,
        );
      },
    );
  }

  /// Validates the provided arguments against the binding's parameters.
  static void validateArgs<T>({
    required RuntimeBinding<T> binding,
    required List<dynamic> positionalArgs,
    required Map<Symbol, dynamic> namedArgs,
  }) {
// Check if all named parameters are provided
    for (final entry in binding.namedParams.entries) {
      final param = entry.key;
      final expectedType = entry.value;

      if (!namedArgs.containsKey(param) && !expectedType.nullable) {
        throw ArgumentError('Missing non-nullable argument: $param');
      }

      if (!namedArgs.containsKey(param)) {
        namedArgs[param] = null;
      }

      // Check if the argument type matches the expected type
      final arg = namedArgs[param];

      final type = $Type.fromValue(arg);

      if (!type.canCast(expectedType)) {
        throw ArgumentError(
          'Invalid argument type for $param: expected $expectedType, got $type',
        );
      }

      // Cast the argument to the expected type
      namedArgs[param] = type.cast(expectedType, arg);
    }

    // Check if the number of positional arguments matches
    if (binding.positionalParams.length != positionalArgs.length) {
      throw ArgumentError(
        'Invalid number of positional arguments: expected ${binding.positionalParams.length}, got ${positionalArgs.length}',
      );
    }
    // Check if the types of positional arguments match
    for (int i = 0; i < binding.positionalParams.length; i++) {
      if (i >= positionalArgs.length) {
        throw ArgumentError(
          '${binding.positionalParams.length} positional arguments expected, but only ${positionalArgs.length} provided',
        );
      }

      final type = $Type.fromValue(positionalArgs[i]);

      if (!type.canCast(binding.positionalParams.values.elementAt(i))) {
        throw ArgumentError(
          'Invalid argument type for positional argument $i: expected ${binding.positionalParams.values.elementAt(i)}, got $type',
        );
      }

      // Cast the argument to the expected type
      positionalArgs[i] = type.cast(
        binding.positionalParams.values.elementAt(i),
        positionalArgs[i],
      );
    }
  }

  @override
  String toString() {
    return '$T $name(${namedParams.entries.map((e) => '${e.key}: ${e.value}').join(', ')})';
  }

  /// Serializes this binding to JSON.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'params': namedParams,
      'permissions':
          permissions.map((p) => '${p.namespace}::${p.name}').toList(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RuntimeBinding<T> &&
        other.name == name &&
        other.function == function &&
        other.namedParams == namedParams &&
        other.permissions == permissions;
  }

  @override
  int get hashCode => Object.hash(name, function, namedParams, permissions);
}

/// A library binding that contains external bindings defined by the host at runtime.
class ExternalBindings extends LibraryBinding {
  final Set<RuntimeBinding> _bindings = {};

  /// A library binding that contains external bindings defined by the host at runtime.
  ExternalBindings()
      : super(
          name: 'external',
          description:
              'Library for external bindings defined by the host at runtime.',
        );

  /// Creates an [ExternalBindings] instance with the provided list of bindings.
  ExternalBindings.from(List<RuntimeBinding> bindings)
      : super(
          name: 'external',
          description:
              'Library for external bindings defined by the host at runtime.',
        ) {
    _bindings.addAll(bindings);
  }

  /// Adds a new binding to the list of external bindings.
  void addBinding(RuntimeBinding binding) {
    _bindings.add(binding);
  }

  /// Removes a binding from the list of external bindings.
  void removeBinding(RuntimeBinding binding) {
    _bindings.remove(binding);
  }

  @override
  Set<RuntimeBinding> get bindings => _bindings;
}

/// A callback that is called before a binding's function is called.
///
/// It can be used to modify the binding or the arguments before the function is called.
///
/// This will block the execution of the binding's function until it completes, so no heavy operations should be done here,
/// as it will slow down the Dscript runtime.
///
/// If this function throws an error, the binding will rethrow the error, canceling its execution.
typedef PreBindingMiddleware<T> = FutureOr<void> Function({
  required RuntimeBinding<T> binding,
  required List<dynamic> positionalArgs,
  required Map<Symbol, dynamic> namedArgs,
});

/// A callback that is called after a binding's function is called.
///
/// It can be used to modify the result of the binding or perform additional actions after the function is called.
///
/// This will block the execution of the binding's function until it completes, so no heavy operations should be done here,
/// as it will slow down the Dscript runtime.
///
/// If this function throws an error, the binding will rethrow the error, canceling its execution.
typedef PostBindingMiddleware<T> = FutureOr<T> Function({
  required RuntimeBinding<T> binding,
  required T result,
  required List<dynamic> positionalArgs,
  required Map<Symbol, dynamic> namedArgs,
});
