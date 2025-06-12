// coverage:ignore-file
import 'dart:async';

import 'package:dscript/src/permissions.dart';
import 'package:dscript/src/stdlib/stdlib.dart';
import 'package:dscript/src/types.dart';

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
  final List<$Type> positionalParams;

  /// Optional description of the binding.
  ///
  /// Used for hover text in the editor in the future.
  final String? description;

  /// The return type of the function as a dsl type.
  $Type get returnType => $Type.from(T.toString());

  /// Creates a new [RuntimeBinding] instance.
  const RuntimeBinding({
    required this.name,
    required this.function,
    this.namedParams = const {},
    this.permissions = const [],
    this.positionalParams = const [],
    required this.description,
  });

  /// Calls the bound function with the provided arguments.
  Future<T> call(List<dynamic> positionalArgs,
      {Map<Symbol, dynamic> namedArgs = const {}}) async {
    positionalArgs = List.from(positionalArgs);
    namedArgs = Map<Symbol, dynamic>.from(namedArgs);

    // Check if all named parameters are provided
    for (final entry in namedParams.entries) {
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
    if (positionalParams.length != positionalArgs.length) {
      throw ArgumentError(
        'Invalid number of positional arguments: expected ${positionalParams.length}, got ${positionalArgs.length}',
      );
    }
    // Check if the types of positional arguments match
    for (int i = 0; i < positionalParams.length; i++) {
      if (i >= positionalArgs.length) {
        throw ArgumentError(
          '${positionalParams.length} positional arguments expected, but only ${positionalArgs.length} provided',
        );
      }

      final type = $Type.fromValue(positionalArgs[i]);

      if (!type.canCast(positionalParams[i])) {
        throw ArgumentError(
          'Invalid argument type for positional argument $i: expected ${positionalParams[i]}, got $type',
        );
      }

      // Cast the argument to the expected type
      positionalArgs[i] = type.cast(positionalParams[i], positionalArgs[i]);
    }

    final result = await Function.apply(
      function,
      positionalArgs,
      namedArgs,
    );

    final resultType = $Type.fromValue(result);

    if (resultType.canCast(returnType)) {
      // Cast the result to the expected return type
      return resultType.cast(returnType, result) as T;
    } else {
      throw ArgumentError(
        'Invalid return type: expected $T, got ${result.runtimeType}',
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
        );

  /// Creates an [ExternalBindings] instance with the provided list of bindings.
  ExternalBindings.from(List<RuntimeBinding> bindings)
      : super(
          name: 'external',
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
