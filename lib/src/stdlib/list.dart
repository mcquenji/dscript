part of 'stdlib.dart';

/// Bindings for the list standard library.
class ListBindings extends LibraryBinding {
  /// Bindings for the list standard library.
  const ListBindings()
      : super(
          name: 'list',
          description: 'Library for working with lists.',
        );

  @override
  Set<RuntimeBinding> get bindings => {
        lengthBinding,
        isEmptyBinding,
        isNotEmptyBinding,
        addBinding,
        addAllBinding,
        clearBinding,
        removeBinding,
        removeAtBinding,
        removeLastBinding,
        insertBinding,
        insertAllBinding,
        indexOfBinding,
        lastIndexOfBinding,
        containsBinding,
      };

  /// Binding for [List.length].
  static final lengthBinding = RuntimeBinding<int>(
    name: 'length',
    function: (List<dynamic> list) => list.length,
    positionalParams: {
      'list': ListType(elementType: const DynamicType()),
    },
    description: 'Returns the number of elements in the list.',
  );

  /// Binding for [List.isEmpty].
  static final isEmptyBinding = RuntimeBinding<bool>(
    name: 'isEmpty',
    function: (List<dynamic> list) => list.isEmpty,
    positionalParams: {
      'list': ListType(elementType: const DynamicType()),
    },
    description: 'Returns true if the list is empty.',
  );

  /// Binding for [List.isNotEmpty].
  static final isNotEmptyBinding = RuntimeBinding<bool>(
    name: 'isNotEmpty',
    function: (List<dynamic> list) => list.isNotEmpty,
    positionalParams: {
      'list': ListType(elementType: const DynamicType()),
    },
    description: 'Returns true if the list is not empty.',
  );

  /// Binding for [List.add].
  static final addBinding = RuntimeBinding<void>(
    name: 'add',
    function: (List<dynamic> list, dynamic element) => list.add(element),
    positionalParams: {
      'list': ListType(elementType: const DynamicType()),
    },
    description: 'Adds [element] to the end of the [list].',
  );

  /// Binding for [List.addAll].
  static final addAllBinding = RuntimeBinding<void>(
    name: 'addAll',
    function: (List<dynamic> list, List<dynamic> elements) =>
        list.addAll(elements),
    positionalParams: {
      'list': ListType(elementType: const DynamicType()),
      'elements': ListType(elementType: const DynamicType()),
    },
    description: 'Adds all [elements] to the end of the [list].',
  );

  /// Binding for [List.clear].
  static final clearBinding = RuntimeBinding<void>(
    name: 'clear',
    function: (List<dynamic> list) => list.clear(),
    positionalParams: {
      'list': ListType(elementType: const DynamicType()),
    },
    description: 'Removes all elements from the list.',
  );

  /// Binding for [List.remove].
  static final removeBinding = RuntimeBinding<bool>(
    name: 'remove',
    function: (List<dynamic> list, dynamic element) => list.remove(element),
    positionalParams: {
      'list': ListType(elementType: const DynamicType()),
    },
    description: 'Removes the first occurrence of [element] from the list.',
  );

  /// Binding for [List.removeAt].
  static final removeAtBinding = RuntimeBinding<dynamic>(
    name: 'removeAt',
    function: (List<dynamic> list, int index) => list.removeAt(index),
    positionalParams: {
      'list': ListType(elementType: const DynamicType()),
      'index': PrimitiveType.INT,
    },
    description: 'Removes and returns the element at [index] from the list.',
  );

  /// Binding for [List.removeLast].
  static final removeLastBinding = RuntimeBinding<dynamic>(
    name: 'removeLast',
    function: (List<dynamic> list) => list.removeLast(),
    positionalParams: {
      'list': ListType(elementType: const DynamicType()),
    },
    description: 'Removes and returns the last element from the list.',
  );

  /// Binding for [List.insert].
  static final insertBinding = RuntimeBinding<void>(
    name: 'insert',
    function: (List<dynamic> list, int index, dynamic element) =>
        list.insert(index, element),
    positionalParams: {
      'list': ListType(elementType: const DynamicType()),
      'index': PrimitiveType.INT,
      'element': const DynamicType(),
    },
    description: 'Inserts [element] at [index] in the list.',
  );

  /// Binding for [List.insertAll].
  static final insertAllBinding = RuntimeBinding<void>(
    name: 'insertAll',
    function: (List<dynamic> list, int index, List<dynamic> elements) =>
        list.insertAll(index, elements),
    positionalParams: {
      'list': ListType(elementType: const DynamicType()),
      'index': PrimitiveType.INT,
      'elements': ListType(elementType: const DynamicType()),
    },
    description: 'Inserts all [elements] at [index] in the list.',
  );

  /// Binding for [List.indexOf].
  static final indexOfBinding = RuntimeBinding<int>(
    name: 'indexOf',
    function: (List<dynamic> list, dynamic element, {int? start}) =>
        list.indexOf(element, start ?? 0),
    positionalParams: {
      'list': ListType(elementType: const DynamicType()),
      'element': const DynamicType(),
    },
    namedParams: {
      #start: PrimitiveType.INT.asNullable(),
    },
    description:
        'Returns the index of the first occurrence of [element] in the list, starting from [start].',
  );

  /// Binding for [List.lastIndexOf].
  static final lastIndexOfBinding = RuntimeBinding<int>(
    name: 'lastIndexOf',
    function: (List<dynamic> list, dynamic element, {int? start}) =>
        list.lastIndexOf(element, start),
    positionalParams: {
      'list': ListType(elementType: const DynamicType()),
      'element': const DynamicType(),
    },
    namedParams: {
      #start: PrimitiveType.INT.asNullable(),
    },
    description:
        'Returns the index of the last occurrence of [element] in the list, starting from [start].',
  );

  /// Binding for [List.contains].
  static final containsBinding = RuntimeBinding<bool>(
    name: 'contains',
    function: (List<dynamic> list, dynamic element) => list.contains(element),
    positionalParams: {
      'list': ListType(elementType: const DynamicType()),
      'element': const DynamicType(),
    },
    description: 'Returns true if the list contains [element].',
  );
}
