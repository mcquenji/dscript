part of 'stdlib.dart';

/// Bindings for the math standard library.
class MathBindings extends LibraryBinding {
  /// Bindings for the math standard library.
  const MathBindings()
      : super(
          name: 'math',
        );

  @override
  Set<RuntimeBinding> get bindings => {
        sqrtBinding,
        powBinding,
        logBinding,
        expBinding,
        sinBinding,
        cosBinding,
        tanBinding,
        asinBinding,
        acosBinding,
        atanBinding,
        atan2Binding,
        absBinding,
        floorBinding,
        ceilBinding,
        roundBinding,
        clampBinding,
        minBinding,
        maxBinding,
      };

  /// Binding for the [sqrt] function.
  static final sqrtBinding = RuntimeBinding<double>(
    name: 'sqrt',
    function: (num x) => sqrt(x),
    positionalParams: [
      num,
    ],
  );

  /// Binding for the [pow] function.
  static final powBinding = RuntimeBinding<double>(
    name: 'pow',
    function: (num x, num y) => pow(x, y),
    positionalParams: [
      num,
      num,
    ],
  );

  /// Binding for the [log] function.
  static final logBinding = RuntimeBinding<double>(
    name: 'log',
    function: (num x) => log(x),
    positionalParams: [
      num,
    ],
  );

  /// Binding for the [exp] function.
  static final expBinding = RuntimeBinding<double>(
    name: 'exp',
    function: (num x) => exp(x),
    positionalParams: [
      num,
    ],
  );

  /// Binding for the [sin] function.
  static final sinBinding = RuntimeBinding<double>(
    name: 'sin',
    function: (num x) => sin(x),
    positionalParams: [
      num,
    ],
  );

  /// Binding for the [cos] function.
  static final cosBinding = RuntimeBinding<double>(
    name: 'cos',
    function: (num x) => cos(x),
    positionalParams: [
      num,
    ],
  );

  /// Binding for the [tan] function.
  static final tanBinding = RuntimeBinding<double>(
    name: 'tan',
    function: (num x) => tan(x),
    positionalParams: [
      num,
    ],
  );

  /// Binding for the [asin] function.
  static final asinBinding = RuntimeBinding<double>(
    name: 'asin',
    function: (num x) => asin(x),
    positionalParams: [
      num,
    ],
  );

  /// Binding for the [acos] function.
  static final acosBinding = RuntimeBinding<double>(
    name: 'acos',
    function: (num x) => acos(x),
    positionalParams: [
      num,
    ],
  );

  /// Binding for the [atan] function.
  static final atanBinding = RuntimeBinding<double>(
    name: 'atan',
    function: (num x) => atan(x),
    positionalParams: [
      num,
    ],
  );

  /// Binding for the [atan2] function.
  static final atan2Binding = RuntimeBinding<double>(
    name: 'atan2',
    function: (num y, num x) => atan2(y, x),
    positionalParams: [
      num,
      num,
    ],
  );

  /// Binding for the [abs] function.
  static final absBinding = RuntimeBinding<double>(
    name: 'abs',
    function: (num x) => x.abs(),
    positionalParams: [
      num,
    ],
  );

  /// Binding for the [floor] function.
  static final floorBinding = RuntimeBinding<int>(
    name: 'floor',
    function: (num x) => x.floor(),
    positionalParams: [
      num,
    ],
  );

  /// Binding for the [ceil] function.
  static final ceilBinding = RuntimeBinding<int>(
    name: 'ceil',
    function: (num x) => x.ceil(),
    positionalParams: [
      num,
    ],
  );

  /// Binding for the [round] function.
  static final roundBinding = RuntimeBinding<int>(
    name: 'round',
    function: (num x) => x.round(),
    positionalParams: [
      num,
    ],
  );

  /// Binding for the [clamp] function.
  static final clampBinding = RuntimeBinding<num>(
    name: 'clamp',
    function: (num x, {required num min, required num max}) =>
        x.clamp(min, max),
    namedParams: {
      #min: num,
      #max: num,
    },
    positionalParams: [
      num,
    ],
  );

  /// Binding for the [min] function.
  static final minBinding = RuntimeBinding<num>(
    name: 'min',
    function: (num a, num b) => min(a, b),
    positionalParams: [
      num,
      num,
    ],
  );

  /// Binding for the [max] function.
  static final maxBinding = RuntimeBinding<num>(
    name: 'max',
    function: (num a, num b) => max(a, b),
    positionalParams: [
      num,
      num,
    ],
  );
}
