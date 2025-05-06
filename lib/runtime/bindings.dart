part of 'runtime.dart';

/// A binding from the DSL to a Dart function.
class RuntimeBinding<T> {
  /// The name of the binding.
  final String name;

  /// The function associated with this binding.
  final Function function;

  /// A map of parameter names to their expected types.
  final Map<Symbol, Type> namedParams;

  /// A list of permissions required by this binding.
  final List<ScriptPermission> permissions;

  /// A list of positional parameters in the order they are expected.
  final List<Type> positionalParams;

  /// A binding from the DSL to a Dart function.
  const RuntimeBinding({
    required this.name,
    required this.function,
    this.namedParams = const {},
    this.permissions = const [],
    this.positionalParams = const [],
  });

  /// Calls the bound function with the provided arguments.
  T call(List<dynamic> positionalArgs,
      {Map<Symbol, dynamic> namedArgs = const {}}) {
    // Check if all named parameters are provided
    for (final param in namedParams.keys) {
      if (!namedArgs.containsKey(param)) {
        throw RuntimeException('Missing argument: $param');
      }

      // Check if the argument type matches the expected type
      final expectedType = namedParams[param];
      final argValue = namedArgs[param];

      if (expectedType != null && argValue.runtimeType != expectedType) {
        throw RuntimeException(
          'Invalid argument type for $param: expected $expectedType, got ${argValue.runtimeType}',
        );
      }
    }

    // Check if the number of positional arguments matches
    if (positionalParams.length != positionalArgs.length) {
      throw RuntimeException(
        'Invalid number of positional arguments: expected ${positionalParams.length}, got ${positionalArgs.length}',
      );
    }
    // Check if the types of positional arguments match
    for (int i = 0; i < positionalParams.length; i++) {
      if (positionalArgs[i].runtimeType != positionalParams[i]) {
        throw RuntimeException(
          'Invalid argument type for positional argument $i: expected ${positionalParams[i]}, got ${positionalArgs[i].runtimeType}',
        );
      }
    }

    final result = Function.apply(function, positionalArgs, namedArgs);

    if (result is T) {
      return result;
    } else {
      throw RuntimeException(
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
