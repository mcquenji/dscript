import 'package:dscript/src/types.dart';

/// Represents a runtime value of type [T] used during script execution.
///
/// Encapsulates a value and provides JSON serialization, dynamic casting,
/// and type introspection for the DSL runtime.
class RuntimeValue {
  /// The underlying value wrapped by this runtime object.
  final dynamic value;

  /// Constructs a [RuntimeValue] wrapping the provided [value].
  const RuntimeValue(this.value);

  /// Serializes this runtime value to a JSON-compatible map.
  ///
  /// The output contains:
  /// - `value`: the underlying value.
  Map<String, dynamic> toJson() {
    return {'type': type, 'value': value};
  }

  @override
  String toString() {
    return value.toString();
  }

  /// Returns the DSL type of this runtime value.
  $Type get type => $Type.from(value.runtimeType.toString().toLowerCase());

  /// Returns true if this value is already of the target [type],
  /// or if it supports an implicit cast to [type].
  bool canCast($Type type) {
    if (type == this.type) return true;

    return this.type.canCast(type);
  }

  /// Performs an implicit cast of this value to the specified DSL [type].
  ///
  /// If the value is already the target type, returns this instance.
  RuntimeValue cast($Type type) {
    if (type == this.type) return this;

    if (!this.type.canCast(type)) {
      throw Exception(
        'Cannot cast ${this.type} to $type',
      );
    }

    return RuntimeValue(this.type.cast(type, value));
  }
}

/// Shorthand for `RuntimeValue(null)`.
class NullValue extends RuntimeValue {
  /// Constructs a [NullValue] instance.
  const NullValue() : super(null);

  @override
  String toString() {
    return 'null';
  }

  @override
  $Type get type => $Type.from('null');
}
