part of 'runtime.dart';

/// Represents a runtime value of type [T] used during script execution.
///
/// Encapsulates a value and provides JSON serialization, dynamic casting,
/// and type introspection for the DSL runtime.
sealed class RuntimeValue<T> {
  /// The underlying value wrapped by this runtime object.
  final T value;

  /// Constructs a [RuntimeValue] wrapping the provided [value].
  const RuntimeValue(this.value);

  /// Serializes this runtime value to a JSON-compatible map.
  ///
  /// The output contains:
  /// - `type`: the runtime type name of the value (lowercased).
  /// - `value`: the underlying value.
  Map<String, dynamic> toJson() {
    return {'type': runtimeType.toString(), 'value': value};
  }

  @override
  String toString() {
    return value.toString();
  }

  /// Returns the DSL type name of the wrapped [value], derived from its
  /// Dart runtime type in lowercase form.
  String get type => value.runtimeType.toString().toLowerCase();

  /// List of types to which this value can be implicitly cast.
  ///
  /// Subclasses should override to declare allowed implicit conversions.
  List<String> get implicitCasts;

  /// Attempts to cast this runtime value to the specified DSL [type].
  ///
  /// Returns a new [RuntimeValue] of the target type, or null if not supported.
  /// Subclasses should override to implement actual cast logic.
  RuntimeValue? _castTo(String type) {
    return null;
  }

  /// Returns true if this value is already of the target [type],
  /// or if it supports an implicit cast to [type].
  bool hasImplicitCast(String type) {
    if (type == this.type) return true;
    if (implicitCasts.contains(type)) return true;
    return false;
  }

  /// Performs an implicit cast of this value to the specified DSL [type].
  ///
  /// If the value is already the target type, returns this instance.
  /// Otherwise, invokes [_castTo] to perform the conversion. Throws
  /// an exception if the cast is not supported.
  RuntimeValue implictCast(String type) {
    if (type == this.type) return this;

    final casted = _castTo(type);
    if (casted != null) {
      return casted;
    }

    throw Exception(
      'Cannot cast ${this.type} to $type. Implicit casts: ${implicitCasts.join(', ')}',
    );
  }
}

/// Base class for numeric runtime values (`int` and `double`).
sealed class NumberValue extends RuntimeValue<num> {
  /// Constructs a numeric runtime value.
  const NumberValue(super.value);
}

/// Runtime value for integer numbers.
///
/// Supports implicit casting to `double`.
class IntegerValue extends NumberValue {
  /// Constructs an integer runtime value from [value].
  const IntegerValue(super.value);

  @override
  List<String> get implicitCasts => ['double'];

  @override

  /// Implements casting from `int` to `double` by returning a
  /// [DoubleValue] wrapping the converted value.
  RuntimeValue? _castTo(String type) {
    if (type == 'double') {
      return DoubleValue(value.toDouble());
    }
    return null;
  }
}

/// Runtime value for double-precision floating-point numbers.
///
/// Does not support any implicit casts.
class DoubleValue extends NumberValue {
  /// Constructs a double runtime value from [value].
  const DoubleValue(super.value);

  @override
  List<String> get implicitCasts => [];
}

/// Runtime value for boolean values (`true`/`false`).
///
/// No implicit casts are supported.
class BooleanValue extends RuntimeValue<bool> {
  /// Constructs a boolean runtime value from [value].
  const BooleanValue(super.value);

  @override
  List<String> get implicitCasts => [];
}

/// Runtime value for strings.
///
/// No implicit casts are supported.
class StringValue extends RuntimeValue<String> {
  /// Constructs a string runtime value from [value].
  const StringValue(super.value);

  @override
  List<String> get implicitCasts => [];
}

/// Runtime value representing `null`.
///
/// No implicit casts are supported.
class NullValue extends RuntimeValue<Null> {
  /// Constructs a `null` runtime value.
  const NullValue() : super(null);

  @override
  List<String> get implicitCasts => [];
}
