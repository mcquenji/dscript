// coverage:ignore-file
part of 'stdlib.dart';

/// Bindings for the math standard library.
class MathBindings extends LibraryBinding {
  /// Bindings for the math standard library.
  const MathBindings()
      : super(
          name: 'math',
          description: 'Library for mathematical functions.',
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
        radBinding,
        degBinding,
      };

  /// Binding for the [sqrt] function.
  static final sqrtBinding = RuntimeBinding<double>(
    name: 'sqrt',
    function: (num x) => sqrt(x),
    positionalParams: {
      'x': PrimitiveType.NUM,
    },
    description:
        'Converts [x] to a [double] and returns the positive square root of the value',
  );

  /// Binding for the [pow] function.
  static final powBinding = RuntimeBinding<double>(
    name: 'pow',
    function: (num x, num y) => pow(x, y),
    positionalParams: {
      'x': PrimitiveType.NUM,
      'y': PrimitiveType.NUM,
    },
    description: '''
Returns [x] to the power of [exponent].

If [x] is an [int] and [exponent] is a non-negative [int], the result is an [int], otherwise both arguments are converted to doubles first, and the result is a [double].

For integers, the power is always equal to the mathematical result of x to the power exponent, only limited by the available memory.

For doubles, pow(x, y) handles edge cases as follows:

if y is zero (0.0 or -0.0), the result is always 1.0.
if x is 1.0, the result is always 1.0.
otherwise, if either x or y is NaN, then the result is NaN.
if x is negative (but not -0.0) and y is a finite non-integer, the result is NaN.
if x is Infinity and y is negative, the result is 0.0.
if x is Infinity and y is positive, the result is Infinity.
if x is 0.0 and y is negative, the result is Infinity.
if x is 0.0 and y is positive, the result is 0.0.
if x is -Infinity or -0.0 and y is an odd integer, then the result is -pow(-x ,y).
if x is -Infinity or -0.0 and y is not an odd integer, then the result is the same as pow(-x , y).
if y is Infinity and the absolute value of x is less than 1, the result is 0.0.
if y is Infinity and x is -1, the result is 1.0.
if y is Infinity and the absolute value of x is greater than 1, the result is Infinity.
if y is -Infinity, the result is 1/pow(x, Infinity).
This corresponds to the pow function defined in the IEEE Standard 754-2008.

Notice that the result may overflow. If integers are represented as 64-bit numbers, an integer result may be truncated, and a double result may overflow to positive or negative [infinity].
''',
  );

  /// Binding for the [log] function.
  static final logBinding = RuntimeBinding<double>(
    name: 'log',
    function: (num x) => log(x),
    positionalParams: {
      'x': PrimitiveType.NUM,
    },
    description:
        'Converts [x] to a [double] and returns the natural logarithm of the value.',
  );

  /// Binding for the [exp] function.
  static final expBinding = RuntimeBinding<double>(
    name: 'exp',
    function: (num x) => exp(x),
    positionalParams: {
      'x': PrimitiveType.NUM,
    },
    description:
        'Converts [x] to a [double] and returns the natural exponent, [e], to the power [x].',
  );

  /// Binding for the [sin] function.
  static final sinBinding = RuntimeBinding<double>(
    name: 'sin',
    function: (num x) => sin(x),
    positionalParams: {
      'x': PrimitiveType.NUM,
    },
    description:
        'Converts [x] to a [double] and returns the sine of the value.',
  );

  /// Binding for the [cos] function.
  static final cosBinding = RuntimeBinding<double>(
      name: 'cos',
      function: (num x) => cos(x),
      positionalParams: {
        'x': PrimitiveType.NUM,
      },
      description:
          'Converts [x] to a [double] and returns the cosine of the value.');

  /// Binding for the [tan] function.
  static final tanBinding = RuntimeBinding<double>(
    name: 'tan',
    function: (num x) => tan(x),
    positionalParams: {
      'x': PrimitiveType.NUM,
    },
    description: '''
Converts [x] to a [double] and returns the tangent of the value.

The tangent function is equivalent to sin(x)/cos(x)
''',
  );

  /// Binding for the [asin] function.
  static final asinBinding = RuntimeBinding<double>(
    name: 'asin',
    function: (num x) => asin(x),
    positionalParams: {
      'x': PrimitiveType.NUM,
    },
    description:
        'Converts [x] to a [double] and returns its arc sine in radians.',
  );

  /// Binding for the [acos] function.
  static final acosBinding = RuntimeBinding<double>(
    name: 'acos',
    function: (num x) => acos(x),
    positionalParams: {
      'x': PrimitiveType.NUM,
    },
    description:
        'Converts [x] to a [double] and returns its arc cosine in radians.',
  );

  /// Binding for the [atan] function.
  static final atanBinding = RuntimeBinding<double>(
    name: 'atan',
    function: (num x) => atan(x),
    positionalParams: {
      'x': PrimitiveType.NUM,
    },
    description:
        'Converts [x] to a [double] and returns its arc tangent in radians.',
  );

  /// Binding for the [atan2] function.
  static final atan2Binding = RuntimeBinding<double>(
    name: 'atan2',
    function: (num y, num x) => atan2(y, x),
    positionalParams: {
      'x': PrimitiveType.NUM,
      'y': PrimitiveType.NUM,
    },
    description: '''
A variant of [atan].

Converts both arguments to [double]s.

Returns the angle in radians between the positive x-axis and the vector ([b],[a]). The result is in the range -PI..PI.

If [b] is positive, this is the same as atan(a/b).

The result is negative when [a] is negative (including when [a] is the double -0.0).

If [a] is equal to zero, the vector ([b],[a]) is considered parallel to the x-axis, even if [b] is also equal to zero. The sign of [b] determines the direction of the vector along the x-axis.
''',
  );

  /// Binding for the [abs] function.
  static final absBinding = RuntimeBinding<double>(
    name: 'abs',
    function: (num x) => x.abs(),
    positionalParams: {
      'x': PrimitiveType.NUM,
    },
    description: 'Returns the absolute value of [x].',
  );

  /// Binding for the [floor] function.
  static final floorBinding = RuntimeBinding<int>(
    name: 'floor',
    function: (num x) => x.floor(),
    positionalParams: {
      'x': PrimitiveType.NUM,
    },
    description: 'Returns the largest integer less than or equal to [x].',
  );

  /// Binding for the [ceil] function.
  static final ceilBinding = RuntimeBinding<int>(
    name: 'ceil',
    function: (num x) => x.ceil(),
    positionalParams: {
      'x': PrimitiveType.NUM,
    },
    description: 'Returns the smallest integer greater than or equal to [x].',
  );

  /// Binding for the [round] function.
  static final roundBinding = RuntimeBinding<int>(
    name: 'round',
    function: (num x) => x.round(),
    positionalParams: {
      'x': PrimitiveType.NUM,
    },
    description: 'Rounds [x] number to the nearest integer.',
  );

  /// Binding for the [clamp] function.
  static final clampBinding = RuntimeBinding<num>(
    name: 'clamp',
    function: (num x, {required num min, required num max}) =>
        x.clamp(min, max),
    namedParams: {
      #min: PrimitiveType.NUM,
      #max: PrimitiveType.NUM,
    },
    positionalParams: {
      'x': PrimitiveType.NUM,
    },
    description: 'Clamps [x] number between a [min] and [max] value.',
  );

  /// Binding for the [min] function.
  static final minBinding = RuntimeBinding<num>(
    name: 'min',
    function: (num a, num b) => min(a, b),
    positionalParams: {
      'a': PrimitiveType.NUM,
      'b': PrimitiveType.NUM,
    },
    description: 'Returns the minimum of [a] and [b].',
  );

  /// Binding for the [max] function.
  static final maxBinding = RuntimeBinding<num>(
    name: 'max',
    function: (num a, num b) => max(a, b),
    positionalParams: {
      'a': PrimitiveType.NUM,
      'b': PrimitiveType.NUM,
    },
    description: 'Returns the maximum of [a] and [b].',
  );

  /// Converts degrees to radians.
  static final radBinding = RuntimeBinding<double>(
    name: 'rad',
    function: (num degrees) => degrees * (pi / 180),
    positionalParams: {
      'degrees': PrimitiveType.NUM,
    },
    description: 'Converts [degrees] to radians.',
  );

  /// Converts radians to degrees.
  static final degBinding = RuntimeBinding<double>(
    name: 'deg',
    function: (num radians) => radians * (180 / pi),
    positionalParams: {
      'radians': PrimitiveType.NUM,
    },
    description: 'Converts [radians] to degrees.',
  );
}
