import 'package:dscript_dart/dscript_dart.dart';

/// Bindings for [DateTime] class.
class DateTimeBindings extends LibraryBinding {
  /// Bindings for [DateTime] class.
  DateTimeBindings({required super.name, required super.description});

  @override
  Set<RuntimeBinding> get bindings => {
        nowBinding,
      };

  /// Binding for [DateTime.now].
  static final nowBinding = RuntimeBinding<DateTime>(
    name: 'now',
    description: 'Returns the current date and time.',
    function: () => Struct.dateTime.fromDart(DateTime.now()),
    returnType: Struct.dateTime,
  );

  /// Binding for [DateTime.subtract].
  static final subtractBinding = RuntimeBinding<DateTime>(
    name: 'subtract',
    description:
        'Subtracts the specified duration from the current date and time.',
    function: (DateTime datetime, Duration duration) {
      return Struct.dateTime.fromDart(datetime.subtract(duration));
    },
    positionalParams: {
      'datetime': Struct.dateTime,
      'duration': Struct.duration,
    },
    returnType: Struct.dateTime,
  );
}
