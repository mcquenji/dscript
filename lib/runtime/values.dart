part of 'runtime.dart';

sealed class RuntimeValue<T> {
  final T value;

  const RuntimeValue(this.value);

  Map<String, dynamic> toJson() {
    return {'type': runtimeType.toString(), 'value': value};
  }

  @override
  String toString() {
    return value.toString();
  }

  String get type => value.runtimeType.toString().toLowerCase();

  List<String> get implicitCasts;

  RuntimeValue? _castTo(String type) {
    return null;
  }

  bool hasImplicitCast(String type) {
    if (type == this.type) return true;

    if (implicitCasts.contains(type)) return true;

    return false;
  }

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

sealed class NumberValue extends RuntimeValue<num> {
  const NumberValue(super.value);
}

class IntegerValue extends NumberValue {
  const IntegerValue(super.value);

  @override
  List<String> get implicitCasts => ['double'];

  @override
  RuntimeValue? _castTo(String type) {
    if (type == 'double') {
      return DoubleValue(value.toDouble());
    }

    return null;
  }
}

class DoubleValue extends NumberValue {
  const DoubleValue(super.value);

  @override
  List<String> get implicitCasts => [];
}

class BooleanValue extends RuntimeValue<bool> {
  const BooleanValue(super.value);

  @override
  List<String> get implicitCasts => [];
}

class StringValue extends RuntimeValue<String> {
  const StringValue(super.value);

  @override
  List<String> get implicitCasts => [];
}

class NullValue extends RuntimeValue<Null> {
  const NullValue() : super(null);

  @override
  List<String> get implicitCasts => [];
}
