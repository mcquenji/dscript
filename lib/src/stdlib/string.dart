// coverage:ignore-file
part of 'stdlib.dart';

/// Bindings for the string standard library.
class StringBindings extends LibraryBinding {
  /// Bindings for the string standard library.
  const StringBindings()
      : super(
          name: 'string',
          description: 'Library for working with strings.',
        );

  @override
  Set<RuntimeBinding> get bindings => {
        lengthBinding,
        substringBinding,
        toUpperCaseBinding,
        toLowerCaseBinding,
        trimBinding,
        splitBinding,
        replaceAllBinding,
        containsBinding,
        startsWithBinding,
        endsWithBinding,
        indexOfBinding,
        lastIndexOfBinding,
        replaceFirstBinding,
        fromBinding,
        fromCharCodeBinding,
        fromCharCodesBinding
      };

  /// Binding for [String.fromCharCode].
  static final fromCharCodeBinding = RuntimeBinding<String>(
    name: 'fromCharCode',
    function: (int code) => String.fromCharCode(code),
    positionalParams: {
      'code': PrimitiveType.INT,
    },
    description: 'Creates a string from a single character code [code].',
  );

  /// Binding for [String.fromCharCodes].
  static final fromCharCodesBinding = RuntimeBinding<String>(
    name: 'from',
    function: (List<int> codes) => String.fromCharCodes(codes),
    positionalParams: {
      'codes': ListType(elementType: PrimitiveType.INT),
    },
    description: 'Creates a string from a list of character codes [codes].',
  );

  /// Binding for [Object.toString].
  static final fromBinding = RuntimeBinding<String>(
    name: 'from',
    function: (dynamic obj) => obj.toString(),
    positionalParams: {
      'obj': const DynamicType(),
    },
    description:
        'String representation of [obj]. If [obj] is a string, it is returned unchanged; otherwise, it is stringfied.',
  );

  /// Binding for [String.length].
  static final lengthBinding = RuntimeBinding<int>(
    name: 'length',
    function: (String str) => str.length,
    positionalParams: {
      'str': PrimitiveType.STRING,
    },
    description: 'Returns the length of [str].',
  );

  /// Binding for [String.substring].
  static final substringBinding = RuntimeBinding<String>(
    name: 'substring',
    function: (String str, int start, {int? end}) => str.substring(start, end),
    positionalParams: {
      'str': PrimitiveType.STRING,
      'start': PrimitiveType.INT,
    },
    namedParams: {
      #end: PrimitiveType.INT.asNullable(),
    },
    description:
        '''The substring of [str] from [start], inclusive, to [end], exclusive. 
        
        Both [start] and [end] must be non-negative and no greater than the string's length; [end], if provided, must be greater than or equal to [start].
        If [end] is omitted, the substring extends to the end of the string.''',
  );

  /// Binding for [String.toUpperCase].
  static final toUpperCaseBinding = RuntimeBinding<String>(
    name: 'upper',
    function: (String str) => str.toUpperCase(),
    positionalParams: {
      'str': PrimitiveType.STRING,
    },
    description: 'Converts [str] to uppercase.',
  );

  /// Binding for [String.toLowerCase].
  static final toLowerCaseBinding = RuntimeBinding<String>(
    name: 'lower',
    function: (String str) => str.toLowerCase(),
    positionalParams: {
      'str': PrimitiveType.STRING,
    },
    description: 'Converts [str] to lowercase.',
  );

  /// Binding for [String.trim].
  static final trimBinding = RuntimeBinding<String>(
    name: 'trim',
    function: (String str) => str.trim(),
    positionalParams: {
      'str': PrimitiveType.STRING,
    },
    description:
        'Removes leading and trailing whitespace from [str] and returns the resulting string.',
  );

  /// Binding for [String.split].
  static final splitBinding = RuntimeBinding<List<String>>(
    name: 'split',
    function: (String str, String pattern) => str.split(pattern),
    positionalParams: {
      'str': PrimitiveType.STRING,
      'pattern': PrimitiveType.STRING,
    },
    description:
        'Splits [str] into a list of substrings using [pattern] as the delimiter.',
  );

  /// Binding for [String.replaceAll].
  static final replaceAllBinding = RuntimeBinding<String>(
    name: 'replaceAll',
    function: (String str, String from, String to) => str.replaceAll(from, to),
    positionalParams: {
      'str': PrimitiveType.STRING,
      'from': PrimitiveType.STRING,
      'to': PrimitiveType.STRING,
    },
    description: 'Replaces all occurrences of [from] with [to] in [str].',
  );

  /// Binding for [String.contains].
  static final containsBinding = RuntimeBinding<bool>(
    name: 'contains',
    function: (String str, String pattern) => str.contains(pattern),
    positionalParams: {
      'str': PrimitiveType.STRING,
      'pattern': PrimitiveType.STRING,
    },
    description: 'Returns true if [str] contains [pattern]. False otherwise.',
  );

  /// Binding for [String.startsWith].
  static final startsWithBinding = RuntimeBinding<bool>(
    name: 'startsWith',
    function: (String str, String pattern) => str.startsWith(pattern),
    positionalParams: {
      'str': PrimitiveType.STRING,
      'pattern': PrimitiveType.STRING,
    },
    description:
        'Returns true if [str] starts with [pattern]. False otherwise.',
  );

  /// Binding for [String.endsWith].
  static final endsWithBinding = RuntimeBinding<bool>(
    name: 'endsWith',
    function: (String str, String pattern) => str.endsWith(pattern),
    positionalParams: {
      'str': PrimitiveType.STRING,
      'pattern': PrimitiveType.STRING,
    },
    description: 'Returns true if [str] ends with [pattern]. False otherwise.',
  );

  /// Binding for [String.indexOf].
  static final indexOfBinding = RuntimeBinding<int>(
    name: 'indexOf',
    function: (String str, String pattern) => str.indexOf(pattern),
    positionalParams: {
      'str': PrimitiveType.STRING,
      'pattern': PrimitiveType.STRING,
    },
    description:
        'Returns the index of the first occurrence of [pattern] in [str].',
  );

  /// Binding for [String.lastIndexOf].
  static final lastIndexOfBinding = RuntimeBinding<int>(
    name: 'lastIndexOf',
    function: (String str, String pattern) => str.lastIndexOf(pattern),
    positionalParams: {
      'str': PrimitiveType.STRING,
      'pattern': PrimitiveType.STRING,
    },
    description:
        'Returns the index of the last occurrence of [pattern] in [str].',
  );

  /// Binding for [String.replaceFirst].
  static final replaceFirstBinding = RuntimeBinding<String>(
    name: 'replaceFirst',
    function: (String str, String from, String to) =>
        str.replaceFirst(from, to),
    positionalParams: {
      'str': PrimitiveType.STRING,
      'from': PrimitiveType.STRING,
      'to': PrimitiveType.STRING,
    },
    description: 'Replaces the first occurrence of [from] with [to] in [str].',
  );
}
