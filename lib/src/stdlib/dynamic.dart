part of 'stdlib.dart';

/// Bindings for the dynamic standard library.
class DynamicBindings extends LibraryBinding {
  /// Bindings for the dynamic standard library.
  const DynamicBindings() : super(name: 'dynamic');

  @override
  Set<RuntimeBinding> get bindings => {
        toStringBinding,
        toIntBinding,
        toDoubleBinding,
        toBoolBinding,
        lengthBinding,
        typeBinding,
      };

  /// Binding for converting a dynamic value to a string.
  static final toStringBinding = RuntimeBinding<String>(
    name: 'toString',
    function: (dynamic value) => value.toString(),
    positionalParams: [const DynamicType()],
    description: 'Converts [value] to a string.',
  );

  /// Binding for converting a dynamic value to an int.
  static final toIntBinding = RuntimeBinding<int>(
    name: 'toInt',
    function: (dynamic value) =>
        value is int ? value : int.parse(value.toString()),
    positionalParams: [const DynamicType()],
    description: 'Converts [value] to an int.',
  );

  /// Binding for converting a dynamic value to a double.
  static final toDoubleBinding = RuntimeBinding<double>(
    name: 'toDouble',
    function: (dynamic value) =>
        value is double ? value : double.parse(value.toString()),
    positionalParams: [const DynamicType()],
    description: 'Converts [value] to a double.',
  );

  /// Binding for converting a dynamic value to a bool.
  static final toBoolBinding = RuntimeBinding<bool>(
    name: 'toBool',
    function: (dynamic value) =>
        value is bool ? value : (value.toString().toLowerCase() == 'true'),
    positionalParams: [const DynamicType()],
    description: 'Converts [value] to a bool.',
  );

  /// Returns the length of a dynamic value if it is a collection or string, otherwise returns 1.
  static final lengthBinding = RuntimeBinding<int>(
    name: 'length',
    function: (dynamic value) {
      if (value is String || value is List || value is Map) {
        return value.length;
      }
      return 1; // For non-collection types, return 1
    },
    positionalParams: [const DynamicType()],
    description:
        'Returns the length of [value] if it is a collection or string, otherwise returns 1.',
  );

  /// Returns the type of the dynamic value as a string.
  static final typeBinding = RuntimeBinding<String>(
    name: 'type',
    function: (dynamic value) => $Type.fromValue(value).toString(),
    positionalParams: [const DynamicType()],
    description: 'Returns the type of [value] as a string.',
  );
}
