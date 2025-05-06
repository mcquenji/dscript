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
    namedParams: {
      #x: num,
    },
  );

  /// Binding for the [pow] function.
  static final powBinding = RuntimeBinding<double>(
    name: 'pow',
    function: (num x, num y) => pow(x, y),
    namedParams: {
      #x: num,
      #y: num,
    },
  );

  /// Binding for the [log] function.
  static final logBinding = RuntimeBinding<double>(
    name: 'log',
    function: (num x) => log(x),
    namedParams: {
      #x: num,
    },
  );

  /// Binding for the [exp] function.
  static final expBinding = RuntimeBinding<double>(
    name: 'exp',
    function: (num x) => exp(x),
    namedParams: {
      #x: num,
    },
  );

  /// Binding for the [sin] function.
  static final sinBinding = RuntimeBinding<double>(
    name: 'sin',
    function: (num x) => sin(x),
    namedParams: {
      #x: num,
    },
  );

  /// Binding for the [cos] function.
  static final cosBinding = RuntimeBinding<double>(
    name: 'cos',
    function: (num x) => cos(x),
    namedParams: {
      #x: num,
    },
  );

  /// Binding for the [tan] function.
  static final tanBinding = RuntimeBinding<double>(
    name: 'tan',
    function: (num x) => tan(x),
    namedParams: {
      #x: num,
    },
  );

  /// Binding for the [asin] function.
  static final asinBinding = RuntimeBinding<double>(
    name: 'asin',
    function: (num x) => asin(x),
    namedParams: {
      #x: num,
    },
  );

  /// Binding for the [acos] function.
  static final acosBinding = RuntimeBinding<double>(
    name: 'acos',
    function: (num x) => acos(x),
    namedParams: {
      #x: num,
    },
  );

  /// Binding for the [atan] function.
  static final atanBinding = RuntimeBinding<double>(
    name: 'atan',
    function: (num x) => atan(x),
    namedParams: {
      #x: num,
    },
  );

  /// Binding for the [atan2] function.
  static final atan2Binding = RuntimeBinding<double>(
    name: 'atan2',
    function: (num y, num x) => atan2(y, x),
    namedParams: {
      #y: num,
      #x: num,
    },
  );

  /// Binding for the [abs] function.
  static final absBinding = RuntimeBinding<double>(
    name: 'abs',
    function: (num x) => x.abs(),
    namedParams: {
      #x: num,
    },
  );

  /// Binding for the [floor] function.
  static final floorBinding = RuntimeBinding<int>(
    name: 'floor',
    function: (num x) => x.floor(),
    namedParams: {
      #x: num,
    },
  );

  /// Binding for the [ceil] function.
  static final ceilBinding = RuntimeBinding<int>(
    name: 'ceil',
    function: (num x) => x.ceil(),
    namedParams: {
      #x: num,
    },
  );

  /// Binding for the [round] function.
  static final roundBinding = RuntimeBinding<int>(
    name: 'round',
    function: (num x) => x.round(),
    namedParams: {
      #x: num,
    },
  );

  /// Binding for the [clamp] function.
  static final clampBinding = RuntimeBinding<num>(
    name: 'clamp',
    function: (num x, num min, num max) => x.clamp(min, max),
    namedParams: {
      #x: num,
      #min: num,
      #max: num,
    },
  );

  /// Binding for the [min] function.
  static final minBinding = RuntimeBinding<num>(
    name: 'min',
    function: (num a, num b) => min(a, b),
    namedParams: {
      #a: num,
      #b: num,
    },
  );

  /// Binding for the [max] function.
  static final maxBinding = RuntimeBinding<num>(
    name: 'max',
    function: (num a, num b) => max(a, b),
    namedParams: {
      #a: num,
      #b: num,
    },
  );
}
