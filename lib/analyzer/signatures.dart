part of 'analyzer.dart';

/// Base class for all signatures.
sealed class Signature extends Equatable {
  const Signature();

  /// Converts the signature to a map.
  Map<String, dynamic> toMap();

  /// Converts this signature to a JSON map.
  Map<String, dynamic> toJson() => {
        ...toMap(),
        'type': runtimeType.toString(),
      };

  @override
  List<Object?> get props => toMap().values.toList();
}

/// Signature of a function parameter.
class ParameterSignature extends Signature {
  /// The name of the parameter.
  final String name;

  /// The type of the parameter.
  final $Type type;

  /// Signature of a function parameter.
  const ParameterSignature({
    required this.name,
    required this.type,
  });

  /// Creates a parameter signature from a [Parameter] object.
  factory ParameterSignature.from(Parameter parameter) {
    return ParameterSignature(
      name: parameter.name,
      type: parameter.type,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type,
    };
  }

  @override
  String toString() {
    return '$type $name';
  }
}

/// Signature of a function.
class FunctionSignature extends Signature {
  /// The name of the function.
  final String name;

  /// Named parameters of the function.
  final List<ParameterSignature> namedParameters;

  /// Positional parameters of the function.
  final List<ParameterSignature> positionalParameters;

  /// The return type of the function.
  final $Type returnType;

  /// The underlying AST node of the function signature, if available.
  final FunctionDeclaration? node;

  /// Signature of a function.
  const FunctionSignature({
    required this.name,
    required this.namedParameters,
    required this.positionalParameters,
    required this.returnType,
    this.node,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'namedParameters': namedParameters.map((e) => e.toMap()).toList(),
      'positionalParameters':
          positionalParameters.map((e) => e.toMap()).toList(),
      'returnType': returnType,
    };
  }

  @override
  String toString() {
    return '$name(${positionalParameters.map((e) => e.toString()).join(', ')}) -> $returnType';
  }
}

/// Signature of a hook.
class HookSignature extends FunctionSignature {
  /// Signature of a hook.
  HookSignature({
    required super.name,
    required super.namedParameters,
  }) : super(
          returnType: PrimitiveType.VOID,
          positionalParameters: [],
          node: null,
        );

  /// Creates a hook signature from a [Hook] object.
  HookSignature.from(Hook hook)
      : super(
          name: hook.name,
          namedParameters:
              hook.parameters.map((e) => ParameterSignature.from(e)).toList(),
          returnType: PrimitiveType.VOID,
          positionalParameters: [],
          node: hook,
        );
}

/// Signature of an implementation.
class ImplementationSignature extends FunctionSignature {
  /// Signature of an implementation.
  ImplementationSignature({
    required super.name,
    required super.namedParameters,
    required super.returnType,
  }) : super(
          positionalParameters: [],
        );

  /// Creates an implementation signature from an [Implementation] object.
  ImplementationSignature.from(
    Implementation implementation,
  ) : super(
          name: implementation.name,
          namedParameters: implementation.parameters
              .map((e) => ParameterSignature.from(e))
              .toList(),
          returnType: implementation.returnType,
          positionalParameters: [],
          node: implementation,
        );
}

/// Represents a type in the DScript language.
sealed class $Type extends Signature {
  /// The name of the type.
  final String name;

  /// If true, the type is nullable. (e.g., int?).
  final bool nullable;

  /// Represents a type (e.g., int, string, etc.).
  const $Type({required this.name, this.nullable = false});

  /// Parse a type from a string.
  factory $Type.from(String type) {
    if (type.isEmpty) {
      throw const AnalyzerError('Type cannot be empty', statement: null);
    }

    bool nullable = false;

    if (type.endsWith('?')) {
      type = type.substring(0, type.length - 1);
      nullable = true;
    }

    switch (type) {
      case 'null' || 'Null':
        return PrimitiveType.NULL;
      case 'int':
        return PrimitiveType.INT.asNullable(nullable);
      case 'string' || 'String':
        return PrimitiveType.STRING.asNullable(nullable);
      // num is is a superset of int and double and
      // as int to double conversion is implicit
      // and double to int conversion is explicit
      // same would apply to num as it could be int or double the implicit conversion is the same
      // thus we can treat it as a double
      case 'num':
        return PrimitiveType.DOUBLE.asNullable(nullable);
      case 'double':
        return PrimitiveType.DOUBLE.asNullable(nullable);
      case 'bool':
        return PrimitiveType.BOOL.asNullable(nullable);
      case 'void':
        return PrimitiveType.VOID.asNullable(nullable);
      case 'Map':
      case 'List':
      default:
        if (type.startsWith('Map<')) {
          final types = type.substring(4, type.length - 1).split(',');
          return MapType(
            keyType: $Type.from(types[0].trim()),
            valueType: $Type.from(types[1].trim()),
          ).asNullable(nullable);
        } else if (type.startsWith('List<')) {
          final elementType = type.substring(5, type.length - 1);
          return ListType(
            elementType: $Type.from(elementType.trim()),
          ).asNullable(nullable);
        } else {
          return Struct(name: type, fields: []).asNullable(nullable);
        }
    }
  }

  /// Converts the type to a map.
  $Type lookup(List<$Type> types) {
    for (final type in types) {
      if (type.name == name) {
        return type;
      }
    }

    throw AnalyzerError('Undefined type: $name', statement: null);
  }

  /// Returns a nullable version of this type.
  $Type asNullable([bool nullable = true]);

  @override
  String toString() {
    return '$name${nullable ? '?' : ''}';
  }

  /// Returns true if this type can be implicitly cast to the [other] type.
  bool canCast($Type other) {
    if (this == other) {
      return true;
    }

    if (this == PrimitiveType.NULL) {
      return other.nullable;
    }

    if (name == other.name) {
      return other.nullable;
    }

    if (this == PrimitiveType.INT) {
      return other == PrimitiveType.DOUBLE;
    }

    return false;
  }

  /// Casts a [value] of this type to the specified [type].
  dynamic cast($Type type, dynamic value) {
    if (!canCast(type)) {
      throw Exception(
        'Cannot cast $name to ${type.name}',
      );
    }

    if (type == this) {
      return value;
    }

    if (type.nullable && this == PrimitiveType.NULL) {
      return null;
    }

    if (type == PrimitiveType.DOUBLE && this == PrimitiveType.INT) {
      return (value as int).toDouble();
    }

    if (type == PrimitiveType.VOID && this == PrimitiveType.NULL) {
      return null;
    }

    if (name == type.name && type.nullable) {
      return value;
    }

    throw Exception(
      'Cannot cast $name to ${type.name}',
    );
  }

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is $Type && other.name == name && other.nullable == nullable;
  }

  @override
  int get hashCode => Object.hash(name, nullable);
}

/// Represents a primitive type (e.g., int, string, etc.).
/// This class is used to represent basic data types in the DScript language.
class PrimitiveType extends $Type {
  /// Represents a primitive type (e.g., int, string, etc.).
  const PrimitiveType._({required super.name, super.nullable = false});

  /// Integer type.
  // ignore: constant_identifier_names
  static const PrimitiveType INT = PrimitiveType._(name: 'int');

  /// String type.
  // ignore: constant_identifier_names
  static const PrimitiveType STRING = PrimitiveType._(name: 'string');

  /// Double type.
  // ignore: constant_identifier_names
  static const PrimitiveType DOUBLE = PrimitiveType._(name: 'double');

  /// Boolean type.
  // ignore: constant_identifier_names
  static const PrimitiveType BOOL = PrimitiveType._(name: 'bool');

  /// Void type.
  // ignore: constant_identifier_names
  static const PrimitiveType VOID = PrimitiveType._(name: 'void');

  /// Number type (int or double).
  // ignore: constant_identifier_names
  static const PrimitiveType NUM = DOUBLE;

  /// Null type.
  // ignore: constant_identifier_names
  static const PrimitiveType NULL = PrimitiveType._(
    name: 'null',
    nullable: true,
  );

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'nullable': nullable,
    };
  }

  @override
  $Type asNullable([bool nullable = true]) {
    if (!nullable) {
      return this;
    }

    return PrimitiveType._(name: name, nullable: true);
  }

  @override
  String toString() {
    if (this == NULL) {
      return NULL.name;
    }

    return super.toString();
  }
}

/// Represents a Map type (e.g., Map<String, int>).
class MapType extends $Type {
  /// The type of the keys in the map.
  final $Type keyType;

  /// The type of the values in the map.
  final $Type valueType;

  /// Represents a Map type (e.g., Map<String, int>).
  /// This class is used to represent key-value pairs in the DScript language.
  const MapType({
    required this.keyType,
    required this.valueType,
    super.nullable = false,
  }) : super(name: 'Map<$keyType, $valueType>');

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'keyType': keyType.toMap(),
      'valueType': valueType.toMap(),
    };
  }

  @override
  $Type asNullable([bool nullable = true]) {
    if (!nullable) {
      return this;
    }

    return MapType(
      keyType: keyType,
      valueType: valueType,
      nullable: nullable,
    );
  }

  @override
  bool canCast($Type other) {
    if (other is MapType) {
      return keyType.canCast(other.keyType) &&
          valueType.canCast(other.valueType);
    }

    return false;
  }

  @override
  cast($Type type, dynamic value) {
    if (type is MapType && value is Map) {
      final Map newMap = {};

      for (final entry in value.entries) {
        final key = keyType.cast(type.keyType, entry.key);
        final val = valueType.cast(type.valueType, entry.value);

        newMap[key] = val;
      }

      return newMap;
    }

    super.cast(type, value);
  }
}

/// Represents a List type (e.g., List<int>).
class ListType extends $Type {
  /// The type of the elements in the list.
  final $Type elementType;

  /// Represents a List type (e.g., List<int>).
  const ListType({
    required this.elementType,
    super.nullable = false,
  }) : super(name: 'List<$elementType>');

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'elementType': elementType.toMap(),
    };
  }

  @override
  $Type asNullable([bool nullable = true]) {
    if (!nullable) {
      return this;
    }

    return ListType(
      elementType: elementType,
      nullable: nullable,
    );
  }

  @override
  bool canCast($Type other) {
    if (other is ListType) {
      return elementType.canCast(other.elementType);
    }

    return false;
  }

  @override
  cast($Type type, dynamic value) {
    if (type is ListType && value is List) {
      return value.map((e) => elementType.cast(type.elementType, e)).toList();
    }

    return super.cast(type, value);
  }
}

/// Represents a custom object type.
class Struct extends $Type {
  /// The fields of the object.
  final List<ParameterSignature> fields;

  /// Represents a custom object type.
  const Struct({
    required super.name,
    required this.fields,
    super.nullable = false,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'fields': fields.map((e) => e.toMap()).toList(),
    };
  }

  @override
  $Type asNullable([bool nullable = true]) {
    if (!nullable) {
      return this;
    }

    return Struct(
      name: name,
      fields: fields,
      nullable: nullable,
    );
  }

  @override
  bool canCast($Type other) => false;
}

/// Signature of a contract.
class ContractSignature extends Signature {
  /// The name of the contract.
  final String name;

  /// The implementation signatures of the contract.
  final List<ImplementationSignature> implementations;

  /// The hook signatures of the contract.
  final List<HookSignature> hooks;

  /// Signatures of objects passed to the contract or returned from it.
  final List<Struct> objects;

  /// Host provided functions the contract can call.
  final ExternalBindings bindings;

  /// Signature of a contract.
  const ContractSignature({
    required this.name,
    required this.implementations,
    required this.hooks,
    this.objects = const [],
    required this.bindings,
  });

  /// Creates a contract signature from a [Contract] object.
  factory ContractSignature.from(Contract contract,
      {required ExternalBindings bindings}) {
    return ContractSignature(
      name: contract.name,
      implementations: contract.implementations
          .map((e) => ImplementationSignature.from(e))
          .toList(),
      hooks: contract.hooks.map((e) => HookSignature.from(e)).toList(),
      bindings: bindings,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'implementations': implementations.map((e) => e.toMap()).toList(),
      'hooks': hooks.map((e) => e.toMap()).toList(),
      'objects': objects.map((e) => e.toMap()).toList(),
    };
  }
}
