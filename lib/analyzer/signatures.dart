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

  /// Whether the parameter is nullable.
  final bool nullable;

  /// Signature of a function parameter.
  const ParameterSignature({
    required this.name,
    required this.type,
    this.nullable = false,
  });

  /// Creates a parameter signature from a [Parameter] object.
  factory ParameterSignature.from(Parameter parameter) {
    return ParameterSignature(
      name: parameter.name,
      type: $Type.from(parameter.type),
      nullable: parameter.nullable,
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

  /// Signature of a function.
  const FunctionSignature({
    required this.name,
    required this.namedParameters,
    required this.positionalParameters,
    required this.returnType,
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
        );

  /// Creates a hook signature from a [Hook] object.
  factory HookSignature.from(Hook hook) => HookSignature(
        name: hook.name,
        namedParameters:
            hook.parameters.map((e) => ParameterSignature.from(e)).toList(),
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
  factory ImplementationSignature.from(
    Implementation implementation,
  ) {
    return ImplementationSignature(
      name: implementation.name,
      namedParameters: implementation.parameters
          .map((e) => ParameterSignature.from(e))
          .toList(),
      returnType: $Type.from(implementation.returnType),
    );
  }
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
  static $Type from(String type) {
    if (type.isEmpty) {
      throw const AnalyzerError('Type cannot be empty');
    }

    bool nullable = false;

    if (type.endsWith('?')) {
      type = type.substring(0, type.length - 1);
      nullable = true;
    }

    switch (type) {
      case 'null':
        return PrimitiveType.NULL;
      case 'int':
        return PrimitiveType.INT.asNullable(nullable);
      case 'string':
        return PrimitiveType.STRING.asNullable(nullable);
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

    throw AnalyzerError('Undefined type: $name');
  }

  /// Returns a nullable version of this type.
  $Type asNullable([bool nullable = true]);

  @override
  String toString() {
    return '$name${nullable ? '?' : ''}';
  }
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
  }) : super(name: 'Map');

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
}

/// Represents a List type (e.g., List<int>).
class ListType extends $Type {
  /// The type of the elements in the list.
  final $Type elementType;

  /// Represents a List type (e.g., List<int>).
  const ListType({
    required this.elementType,
    super.nullable = false,
  }) : super(name: 'List');

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

  /// Signature of a contract.
  const ContractSignature({
    required this.name,
    required this.implementations,
    required this.hooks,
    this.objects = const [],
  });

  /// Creates a contract signature from a [Contract] object.
  factory ContractSignature.from(Contract contract) {
    return ContractSignature(
      name: contract.name,
      implementations: contract.implementations
          .map((e) => ImplementationSignature.from(e))
          .toList(),
      hooks: contract.hooks.map((e) => HookSignature.from(e)).toList(),
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
