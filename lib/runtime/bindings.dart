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

  /// The return type of the function as a dsl type.
  $Type get returnType => $Type.from(T.toString());

  /// Mapped named parameters to their dsl types.
  final Map<Symbol, $Type> namedParamsTypes;

  /// Mapped positional parameters to their dsl types.
  final List<$Type> positionalParamsTypes;

  /// A binding from the DSL to a Dart function.
  RuntimeBinding({
    required this.name,
    required this.function,
    this.namedParams = const {},
    this.permissions = const [],
    this.positionalParams = const [],
  })  : positionalParamsTypes = positionalParams
            .map(
              (value) => $Type.from(
                value.toString(),
              ),
            )
            .toList(),
        namedParamsTypes = namedParams.map(
          (key, value) => MapEntry(
            key,
            $Type.from(
              value.toString(),
            ),
          ),
        );

  /// Calls the bound function with the provided arguments.
  T call(List<RuntimeValue> positionalArgs,
      {Map<Symbol, RuntimeValue> namedArgs = const {}}) {
    // Check if all named parameters are provided
    for (final param in namedParams.keys) {
      if (!namedArgs.containsKey(param)) {
        throw RuntimeException('Missing argument: $param');
      }

      // Check if the argument type matches the expected type
      final expectedType = namedParamsTypes[param]!;
      final argValue = namedArgs[param]!.type;

      if (!argValue.canCast(expectedType)) {
        throw RuntimeException(
          'Invalid argument type for $param: expected $expectedType, got $argValue',
        );
      }

      // Cast the argument to the expected type
      namedArgs[param] = namedArgs[param]!.cast(expectedType);
    }

    // Check if the number of positional arguments matches
    if (positionalParams.length != positionalArgs.length) {
      throw RuntimeException(
        'Invalid number of positional arguments: expected ${positionalParams.length}, got ${positionalArgs.length}',
      );
    }
    // Check if the types of positional arguments match
    for (int i = 0; i < positionalParams.length; i++) {
      if (i >= positionalArgs.length) {
        throw RuntimeException(
          '${positionalParams.length} positional arguments expected, but only ${positionalArgs.length} provided',
        );
      }

      if (!positionalArgs[i].type.canCast(positionalParamsTypes[i])) {
        throw RuntimeException(
          'Invalid argument type for positional argument $i: expected ${positionalParamsTypes[i]}, got ${positionalArgs[i].type}',
        );
      }

      // Cast the argument to the expected type
      positionalArgs[i] = positionalArgs[i].cast(positionalParamsTypes[i]);
    }

    print(positionalArgs);
    print(namedArgs);

    final result = Function.apply(
        function,
        positionalArgs.map((arg) => arg.value).toList(),
        namedArgs.map(
          (key, value) => MapEntry(
            key,
            value.value,
          ),
        ));

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
