// coverage:ignore-file
import 'package:collection/collection.dart';
import 'package:dio/dio.dart' show Response, Headers, RequestOptions;
import 'package:dscript_dart/dscript_dart.dart';
import 'package:equatable/equatable.dart';

/// Base class for all signatures.
sealed class Signature extends Equatable {
  const Signature({
    this.description,
  });

  /// Converts the signature to a map.
  Map<String, dynamic> toMap();

  /// Converts this signature to a JSON map.
  Map<String, dynamic> toJson() => {
        ...toMap(),
        // Not used for type inference
        // ignore: no_type_to_string
        'type': runtimeType.toString(),
        'description': description,
      };

  /// The description of the signature, if any.
  final String? description;

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
    super.description,
  });

  /// Creates a parameter signature from a [Parameter] object.
  // factory ParameterSignature.from(Parameter parameter) {
  //   return ParameterSignature(
  //     name: parameter.name,
  //     type: parameter.type,
  //   );
  // }

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
    super.description,
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
    super.description,
  }) : super(
          returnType: PrimitiveType.VOID,
          positionalParameters: [],
        );
}

/// Signature of an implementation.
class ImplementationSignature extends FunctionSignature {
  /// Signature of an implementation.
  ImplementationSignature({
    required super.name,
    required super.namedParameters,
    required super.returnType,
    super.description,
  }) : super(
          positionalParameters: [],
        );
}

/// Represents a type in the Dscript language.
sealed class $Type extends Signature {
  /// The name of the type.
  final String name;

  /// If true, the type is nullable. (e.g., int?).
  final bool nullable;

  /// Represents a type (e.g., int, string, etc.).
  const $Type({
    required this.name,
    this.nullable = false,
    super.description,
  });

  /// Parse a type from a string.
  factory $Type.from(String type) {
    if (type.isEmpty) {
      throw ArgumentError.value(
        type,
        'type',
        'Type string cannot be empty',
      );
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
          return Struct.shallow(type).asNullable(nullable);
        }
    }
  }

  /// The key inside a map that indicates it's a struct type. The value is the name of the struct.
  static const structKey = '__type__';

  /// Extracts the type from a value.
  ///
  /// **NOTE:** If the value is a [Struct] this will return a shallow struct. Use [$Type.lookup] to get the full struct.
  factory $Type.fromValue(dynamic value) {
    if (value == null) {
      return PrimitiveType.NULL;
    }

    if (value is int) {
      return PrimitiveType.INT;
    } else if (value is double) {
      return PrimitiveType.DOUBLE;
    } else if (value is String) {
      return PrimitiveType.STRING;
    } else if (value is bool) {
      return PrimitiveType.BOOL;
    } else if (value is List) {
      if (value.isEmpty) {
        return ListType(elementType: PrimitiveType.NULL);
      }
      return ListType(
        elementType: $Type.fromValue(value.first),
      );
    } else if (value is Map) {
      // If the map has a special key indicating it's a struct type, return the struct type.
      if (value.containsKey(structKey)) {
        final structName = value[structKey];
        if (structName is String) {
          return Struct.shallow(structName);
        }
      }

      if (value.isEmpty) {
        return MapType(
          keyType: PrimitiveType.NULL,
          valueType: PrimitiveType.NULL,
        );
      }
      final key = value.keys.first;
      final val = value.values.first;

      return MapType(
        keyType: $Type.fromValue(key),
        valueType: $Type.fromValue(val),
      );
    } else if (value is Struct) {
      return value.asNullable();
    }

    throw ArgumentError.value(value, 'value', 'Cannot determine type of value');
  }

  /// Looks up a shallow struct by its name in the provided [types] and [Struct.defaults] list.
  ///
  /// Returns the struct if found, otherwise returns null.
  ///
  /// This is used to allow for defining hooks or impls that return or take in a struct
  /// without having to redifne it everywhere.
  ///
  /// ```dart
  /// contract('Random')
  /// .hook('onLogin')
  /// .param(
  /// 'user',
  /// const Struct.shallow('User'), // this will be looked up
  /// )
  /// .struct('User') // this will be found by the lookup having all the fields defined
  /// .field('name', PrimitiveType.STRING)
  /// .field('id', PrimitiveType.INT)
  /// .end()
  /// .build();
  /// ```
  Struct? lookup(List<Struct> types) {
    for (final type in types) {
      if (type.name == name) {
        return type.asNullable(nullable) as Struct;
      }
    }

    for (final type in Struct.defaults) {
      if (type.name == name) {
        return type.asNullable(nullable) as Struct;
      }
    }

    return null;
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

    if (other == const DynamicType()) {
      return true;
    }

    if (this == PrimitiveType.NULL) {
      return other.nullable || other == PrimitiveType.VOID;
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

    if (type == const DynamicType()) {
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
/// This class is used to represent basic data types in the Dscript language.
class PrimitiveType extends $Type {
  /// Represents a primitive type (e.g., int, string, etc.).
  const PrimitiveType._({
    required super.name,
    super.nullable = false,
    super.description,
  });

  /// Integer type.
  // ignore: constant_identifier_names
  static const PrimitiveType INT = PrimitiveType._(name: 'int', description: """
An integer number.

The default implementation of int is 64-bit two's complement integers with operations that wrap to that range on overflow.

Note: When compiling to JavaScript, integers are restricted to values that can be represented exactly by double-precision floating point values. The available integer values include all integers between -2^53 and 2^53, and some integers with larger magnitude. That includes some integers larger than 2^63. The behavior of the operators and methods in the [int] class therefore sometimes differs between the Dart VM and Dart code compiled to JavaScript. For example, the bitwise operators truncate their operands to 32-bit integers when compiled to JavaScript.""");

  /// String type.
  // ignore: constant_identifier_names
  static const PrimitiveType STRING = PrimitiveType._(
      name: 'string', description: '''A sequence of UTF-16 code units.

Strings are mainly used to represent text. A character may be represented by multiple code points, each code point consisting of one or two code units. For example, the Papua New Guinea flag character requires four code units to represent two code points, but should be treated like a single character: "🇵🇬". Platforms that do not support the flag character may show the letters "PG" instead. If the code points are swapped, it instead becomes the Guadeloupe flag "🇬🇵" ("GP").

A string can be either single or multiline. Single line strings are written using matching single or double quotes, and multiline strings are written using triple quotes.''');

  /// Double type.
  // ignore: constant_identifier_names
  static const PrimitiveType DOUBLE = PrimitiveType._(
      name: 'double', description: '''A double-precision floating point number.

Representation of Dart doubles containing double specific constants and operations and specializations of operations inherited from [num]. Dart doubles are 64-bit floating-point numbers as specified in the IEEE 754 standard.

The [double] type is contagious. Operations on [double]s return [double] results.''');

  /// Boolean type.
  // ignore: constant_identifier_names
  static const PrimitiveType BOOL = PrimitiveType._(
    name: 'bool',
    description:
        'The reserved words true and false denote objects that are the only two instances of this class.',
  );

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

/// Represents a Map type (e.g., `Map<String, int>`).
class MapType extends $Type {
  /// The type of the keys in the map.
  final $Type keyType;

  /// The type of the values in the map.
  final $Type valueType;

  /// Represents a Map type (e.g., `Map<String, int>`).
  /// This class is used to represent key-value pairs in the Dscript language.
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
    if (other == const DynamicType()) {
      return true;
    }

    if (other is MapType) {
      return keyType.canCast(other.keyType) &&
          valueType.canCast(other.valueType);
    }

    return false;
  }

  @override
  cast($Type type, dynamic value) {
    if (type == const DynamicType()) {
      return value;
    }

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

/// Represents a List type (e.g., `List<int>`).
class ListType extends $Type {
  /// The type of the elements in the list.
  final $Type elementType;

  /// Represents a List type (e.g., `List<int>`).
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
    if (other == const DynamicType()) {
      return true;
    }

    if (other is ListType) {
      return elementType.canCast(other.elementType);
    }

    return false;
  }

  @override
  cast($Type type, dynamic value) {
    if (type == const DynamicType()) {
      return value;
    }

    if (type is ListType && value is List) {
      return value.map((e) => elementType.cast(type.elementType, e)).toList();
    }

    return super.cast(type, value);
  }
}

/// Represents a custom object type.
class Struct<T> extends $Type {
  /// The fields of the object.
  final Map<String, $Type> fields;

  /// Serializes this DSL struct to a dart object of type [T]
  final T Function(Map<String, dynamic>) _toDart;

  /// Deserializes a dart object of type [T] to this DSL struct.
  final Map<String, dynamic> Function(T) _fromDart;

  /// Serializes this DSL struct to a dart object of type [T]
  ///
  /// Returns a Dart object of type [T]
  T toDart(Map<String, dynamic> dsl) {
    if (!dsl.containsKey($Type.structKey)) {
      throw Exception(
          'The provided data does not contain the struct key: $Type.structKey');
    }

    if (dsl[$Type.structKey] != name) {
      throw Exception(
          'The provided dsl struct is not of type $name; expected $name but got ${dsl[$Type.structKey]}');
    }

    return _toDart(dsl);
  }

  /// Deserializes a dart object of type [T] to this DSL struct.
  ///
  /// Returns a [Map] with all the fields populated and the [$Type.structKey] set to [name].
  Map<String, dynamic> fromDart(T obj) {
    final map = _fromDart(obj);
    map[$Type.structKey] = name; // Add the struct key to the map
    return map;
  }

  static T _shallowToDart<T>(Map<String, dynamic> json) {
    throw UnimplementedError(
        r'Cannot convert shallow struct to Dart object. Use `$Type.lookup` to get the resolved struct and call `toDart` on it.');
  }

  static Map<String, dynamic> _shallowFromDart<T>(T obj) {
    throw UnimplementedError(
        r'Cannot convert Dart object to shallow struct. Use `$Type.lookup` to get the resolved struct and call `fromDart` on it.');
  }

  /// Represents a custom object type.
  const Struct({
    required super.name,
    this.fields = const {},
    super.nullable = false,
    super.description,

    /// Serializes this DSL struct to a dart object of type [T].
    ///
    /// You can safely use assume that the map is well-formed and contains all the necessary fields.
    required T Function(Map<String, dynamic>) toDart,

    /// Deserializes a dart object of type [T] to this DSL struct.
    ///
    /// The [$Type.structKey] field will be set to the name of the struct automatically.
    required Map<String, dynamic> Function(T) fromDart,
  })  : _fromDart = fromDart,
        _toDart = toDart;

  /// Creates a shallow struct with only the name and no fields.
  /// This is useful for defining hooks or implementations that reference a struct without needing to define its fields immediately.
  const Struct.shallow(String name)
      : this(
          name: name,
          fields: const {},
          nullable: false,
          toDart: _shallowToDart,
          fromDart: _shallowFromDart,
        );

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'fields': fields.map((key, value) => MapEntry(key, value.toMap())),
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
      toDart: _toDart,
      fromDart: _fromDart,
    );
  }

  @override
  bool canCast($Type other) {
    if (other.name == name && other is Struct) {
      if (!nullable && !other.nullable) {
        return true;
      }
      if (other.nullable && nullable) {
        return true;
      }

      if (!other.nullable && nullable) {
        return false;
      }

      if (other.nullable && !nullable) {
        return true;
      }
    }

    return other == const DynamicType();
  }

  /// Stdandard error struct used in Dscript.
  static final error = Struct<Exception>(
    name: 'Error',
    fields: {
      'message': PrimitiveType.STRING,
      'stackTrace': PrimitiveType.STRING.asNullable(),
    },
    description: 'Represents an error with a message and stack trace.',
    toDart: (json) => Exception(
      json['message'] as String,
    ),
    fromDart: (obj) => {
      'message': obj.toString(),
      'stackTrace': StackTrace.current.toString(),
    },
  );

  /// Standard HTTP response struct used in Dscript.
  static final httpResponse = Struct<Response>(
    name: 'HttpResponse',
    fields: {
      'statusCode': PrimitiveType.INT,
      'headers': MapType(
        keyType: PrimitiveType.STRING,
        valueType: ListType(elementType: PrimitiveType.STRING),
      ),
      'data': PrimitiveType.STRING.asNullable(),
      'statusMessage': PrimitiveType.STRING.asNullable(),
      'isRedirect': PrimitiveType.BOOL,
    },
    toDart: (json) => Response(
      statusCode: json['statusCode'] as int,
      headers: Headers.fromMap(json['headers'] as Map<String, List<String>>),
      data: json['data'] as String?,
      requestOptions: RequestOptions(),
      statusMessage: json['statusMessage'] as String?,
      isRedirect: json['isRedirect'] as bool? ?? false,
    ),
    fromDart: (obj) => {
      'statusCode': obj.statusCode,
      'data': obj.data.toString(),
      'headers': obj.headers.map,
      'isRedirect': obj.isRedirect,
      'statusMessage': obj.statusMessage,
    },
    description:
        'Represents an HTTP response with status code, headers, and body.',
  );

  /// Return value of [json::decode].
  static final Struct json = Struct<dynamic>(
      name: 'JSON',
      description:
          "Result of [json::decode]. It's either a [Map<String, dynamic>] or a [List<dynamic>].",
      fields: {
        'map': MapType(
                keyType: PrimitiveType.STRING, valueType: const DynamicType())
            .asNullable(),
        'list': ListType(elementType: const DynamicType()).asNullable(),
        'isMap': PrimitiveType.BOOL,
        'isList': PrimitiveType.BOOL,
      },
      toDart: (json) {
        if (json['isMap'] == true) {
          return json['map'] as Map<String, dynamic>;
        } else if (json['isList'] == true) {
          return json['list'] as List<dynamic>;
        }
        throw Exception('Invalid JSON structure');
      },
      fromDart: (json) => {
            'map': json is Map ? json : null,
            'list': json is List ? json : null,
            'isMap': json is Map,
            'isList': json is List,
          });

  /// Represents a key-value pair in a map.
  static final mapEntry = Struct<MapEntry>(
    name: 'MapEntry',
    description: 'Represents a key-value pair in a map.',
    fields: {
      'key': const DynamicType(),
      'value': const DynamicType(),
    },
    toDart: (json) => MapEntry(
      json['key'],
      json['value'],
    ),
    fromDart: (obj) => {
      'key': obj.key,
      'value': obj.value,
    },
  );

  /// Represents [DateTime].
  static final dateTime = Struct<DateTime>(
    name: 'DateTime',
    fields: {
      'year': PrimitiveType.INT,
      'month': PrimitiveType.INT,
      'day': PrimitiveType.INT,
      'hour': PrimitiveType.INT,
      'minute': PrimitiveType.INT,
      'second': PrimitiveType.INT,
      'millisecond': PrimitiveType.INT,
      'microsecond': PrimitiveType.INT,
    },
    description: 'Represents a date and time.',
    toDart: (json) => DateTime(
      json['year'] as int,
      json['month'] as int,
      json['day'] as int,
      json['hour'] as int,
      json['minute'] as int,
      json['second'] as int,
      json['millisecond'] as int? ?? 0,
      json['microsecond'] as int? ?? 0,
    ),
    fromDart: (obj) => {
      'year': obj.year,
      'month': obj.month,
      'day': obj.day,
      'hour': obj.hour,
      'minute': obj.minute,
      'second': obj.second,
      'millisecond': obj.millisecond,
      'microsecond': obj.microsecond,
    },
  );

  /// Represents [Duration].
  static final duration = Struct<Duration>(
    name: 'Duration',
    fields: {
      'days': PrimitiveType.INT,
      'hours': PrimitiveType.INT,
      'minutes': PrimitiveType.INT,
      'seconds': PrimitiveType.INT,
      'milliseconds': PrimitiveType.INT,
      'microseconds': PrimitiveType.INT,
    },
    description: 'Represents a duration of time.',
    toDart: (json) => Duration(
      days: json['days'] as int,
      hours: json['hours'] as int,
      minutes: json['minutes'] as int,
      seconds: json['seconds'] as int,
      milliseconds: json['milliseconds'] as int? ?? 0,
      microseconds: json['microseconds'] as int? ?? 0,
    ),
    fromDart: (obj) => {
      'days': obj.inDays,
      'hours': obj.inHours.remainder(24),
      'minutes': obj.inMinutes.remainder(60),
      'seconds': obj.inSeconds.remainder(60),
      'milliseconds': obj.inMilliseconds.remainder(1000),
      'microseconds': obj.inMicroseconds.remainder(1000),
    },
  );

  /// Default structs defined within the language.
  static final defaults = [error, httpResponse, json, duration, dateTime];
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
  final List<Struct> structs;

  /// Host provided functions the contract can call.
  final ExternalBindings bindings;

  /// Signature of a contract.
  const ContractSignature({
    required this.name,
    required this.implementations,
    required this.hooks,
    this.structs = const [],
    required this.bindings,
    super.description,
  });

  /// Creates a contract signature from a [Contract] object.
  // factory ContractSignature.from(Contract contract,
  //     {required ExternalBindings bindings}) {
  //   return ContractSignature(
  //     name: contract.name,
  //     implementations: contract.implementations
  //         .map((e) => ImplementationSignature.from(e))
  //         .toList(),
  //     hooks: contract.hooks.map((e) => HookSignature.from(e)).toList(),
  //     bindings: bindings,
  //   );
  // }

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'implementations': implementations.map((e) => e.toMap()).toList(),
      'hooks': hooks.map((e) => e.toMap()).toList(),
      'objects': structs.map((e) => e.toMap()).toList(),
    };
  }
}

/// Extension methods for [List<HookSignature>].
extension HookX on List<HookSignature> {
  /// Finds a hook by its name.
  HookSignature? find(String name) {
    return firstWhereOrNull(
      (hook) => hook.name == name,
    );
  }
}

/// Extension methods for [List<ImplementationSignature>].
extension ImplementationX on List<ImplementationSignature> {
  /// Finds an implementation by its name.
  ImplementationSignature? find(String name) {
    return firstWhereOrNull(
      (impl) => impl.name == name,
    );
  }
}

/// Invalid Type meaning the type is not defined or not recognized.
///
/// Used to represent types that cannot be resolved or are not valid in the context.
class InvalidType extends $Type {
  /// Creates an invalid type.
  const InvalidType() : super(name: 'InvalidType', nullable: false);

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  @override
  $Type asNullable([bool nullable = true]) => this;

  @override
  bool canCast($Type other) => false;

  @override
  cast($Type type, dynamic value) {
    throw Exception('Cannot cast InvalidType to ${type.name}');
  }
}

/// Dynamic Type meaning the type is not known at compile time.
///
/// This type cannot be used inside the dscript language it is only used for [RuntimeBinding]s to accept any type of value.
class DynamicType extends $Type {
  /// Dynamic Type meaning the type is not known at compile time.
  ///
  /// This type cannot be used inside the dscript language it is only used for [RuntimeBinding]s to accept any type of value.
  const DynamicType() : super(name: 'dynamic', nullable: true);

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  @override
  $Type asNullable([bool nullable = true]) => this;

  @override
  bool canCast($Type other) => true;

  @override
  cast($Type type, dynamic value) => value;
}
