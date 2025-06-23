part of 'stdlib.dart';

/// Bindings for the map standard library.
class MapBindings extends LibraryBinding {
  /// Bindings for the map standard library.
  const MapBindings()
      : super(
          name: 'map',
          description: 'Library for working with maps.',
        );

  @override
  Set<RuntimeBinding> get bindings => {
        lengthBinding,
        isEmptyBinding,
        isNotEmptyBinding,
        containsKeyBinding,
        containsValueBinding,
        keysBinding,
        valuesBinding,
        addAllBinding,
        clearBinding,
        removeBinding,
        keyOfBinding,
        keysOfBinding,
        entriesBinding,
        copyBinding,
      };

  /// Binding for [Map.length].
  static final lengthBinding = RuntimeBinding<int>(
    name: 'length',
    function: (Map<dynamic, dynamic> map) => map.length,
    positionalParams: {
      'map': MapType(
        keyType: const DynamicType(),
        valueType: const DynamicType(),
      ),
    },
    description: 'Returns the number of key-value pairs in the map.',
  );

  /// Binding for [Map.isEmpty].
  static final isEmptyBinding = RuntimeBinding<bool>(
    name: 'isEmpty',
    function: (Map<dynamic, dynamic> map) => map.isEmpty,
    positionalParams: {
      'map': MapType(
        keyType: const DynamicType(),
        valueType: const DynamicType(),
      ),
    },
    description: 'Returns true if the map is empty.',
  );

  /// Binding for [Map.isNotEmpty].
  static final isNotEmptyBinding = RuntimeBinding<bool>(
    name: 'isNotEmpty',
    function: (Map<dynamic, dynamic> map) => map.isNotEmpty,
    positionalParams: {
      'map': MapType(
        keyType: const DynamicType(),
        valueType: const DynamicType(),
      ),
    },
    description: 'Returns true if the map is not empty.',
  );

  /// Binding for [Map.containsKey].
  static final containsKeyBinding = RuntimeBinding<bool>(
    name: 'containsKey',
    function: (Map<dynamic, dynamic> map, dynamic key) => map.containsKey(key),
    positionalParams: {
      'map': MapType(
        keyType: const DynamicType(),
        valueType: const DynamicType(),
      ),
      'key': const DynamicType(),
    },
    description: 'Returns true if the map contains the specified [key].',
  );

  /// Binding for [Map.containsValue].
  static final containsValueBinding = RuntimeBinding<bool>(
    name: 'containsValue',
    function: (Map<dynamic, dynamic> map, dynamic value) =>
        map.containsValue(value),
    positionalParams: {
      'map': MapType(
        keyType: const DynamicType(),
        valueType: const DynamicType(),
      ),
      'value': const DynamicType(),
    },
    description: 'Returns true if the map contains the specified [value].',
  );

  /// Binding for [Map.keys].
  static final keysBinding = RuntimeBinding<List<dynamic>>(
    name: 'keys',
    function: (Map<dynamic, dynamic> map) => map.keys.toList(),
    positionalParams: {
      'map': MapType(
        keyType: const DynamicType(),
        valueType: const DynamicType(),
      ),
    },
    description: 'Returns a list of all keys in the map.',
  );

  /// Binding for [Map.values].
  static final valuesBinding = RuntimeBinding<List<dynamic>>(
    name: 'values',
    function: (Map<dynamic, dynamic> map) => map.values.toList(),
    positionalParams: {
      'map': MapType(
        keyType: const DynamicType(),
        valueType: const DynamicType(),
      ),
    },
    description: 'Returns a list of all values in the map.',
  );

  /// Binding for [Map.addAll].
  static final addAllBinding = RuntimeBinding<void>(
    name: 'addAll',
    function: (Map<dynamic, dynamic> map, Map<dynamic, dynamic> other) =>
        map.addAll(other),
    positionalParams: {
      'map': MapType(
        keyType: const DynamicType(),
        valueType: const DynamicType(),
      ),
      'other': MapType(
        keyType: const DynamicType(),
        valueType: const DynamicType(),
      ),
    },
    description: 'Adds all key-value pairs from [other] to the map.',
  );

  /// Binding for [Map.clear].
  static final clearBinding = RuntimeBinding<void>(
    name: 'clear',
    function: (Map<dynamic, dynamic> map) => map.clear(),
    positionalParams: {
      'map': MapType(
        keyType: const DynamicType(),
        valueType: const DynamicType(),
      ),
    },
    description: 'Removes all key-value pairs from the map.',
  );

  /// Binding for [Map.remove].
  static final removeBinding = RuntimeBinding<dynamic>(
    name: 'remove',
    function: (Map<dynamic, dynamic> map, dynamic key) => map.remove(key),
    positionalParams: {
      'map': MapType(
        keyType: const DynamicType(),
        valueType: const DynamicType(),
      ),
      'key': const DynamicType(),
    },
    description:
        'Removes the key-value pair for the specified [key] from the map.',
  );

  /// Returns the first key associated with the specified [value].
  static final keyOfBinding = RuntimeBinding<dynamic>(
    name: 'keyOf',
    function: (Map<dynamic, dynamic> map, dynamic value) {
      for (var entry in map.entries) {
        if (entry.value == value) {
          return entry.key;
        }
      }
      return null;
    },
    positionalParams: {
      'map': MapType(
        keyType: const DynamicType(),
        valueType: const DynamicType(),
      ),
      'value': const DynamicType(),
    },
    description: 'Returns the first key associated with the specified [value].',
  );

  /// Returns a list of keys associated with the specified [value].
  static final keysOfBinding = RuntimeBinding<List<dynamic>>(
    name: 'keysOf',
    function: (Map<dynamic, dynamic> map, dynamic value) {
      return map.entries
          .where((entry) => entry.value == value)
          .map((entry) => entry.key)
          .toList();
    },
    positionalParams: {
      'map': MapType(
        keyType: const DynamicType(),
        valueType: const DynamicType(),
      ),
      'value': const DynamicType(),
    },
    description:
        'Returns a list of keys associated with the specified [value].',
  );

  /// [Map.entries] binding.
  static final entriesBinding = RuntimeBinding<List<Map<dynamic, dynamic>>>(
    name: 'entries',
    function: (Map<dynamic, dynamic> map) => map.entries.map((entry) {
      return {
        'key': entry.key,
        'value': entry.value,
        $Type.structKey: Struct.mapEntry.name,
      };
    }).toList(),
    positionalParams: {
      'map': MapType(
        keyType: const DynamicType(),
        valueType: const DynamicType(),
      ),
    },
    description: 'Returns a list of key-value pairs in the map.',
    returnType: ListType(
      elementType: Struct.mapEntry,
    ),
  );

  /// Returns a copy of the [map].
  static final copyBinding = RuntimeBinding<Map<dynamic, dynamic>>(
    name: 'copy',
    function: (Map<dynamic, dynamic> map) => Map.from(map),
    positionalParams: {
      'map': MapType(
        keyType: const DynamicType(),
        valueType: const DynamicType(),
      ),
    },
    description: 'Returns a copy of the [map].',
  );
}
