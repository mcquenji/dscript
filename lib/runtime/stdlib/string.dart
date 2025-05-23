part of 'stdlib.dart';

/// Bindings for the string standard library.
class StringBindings extends LibraryBinding {
  /// Bindings for the string standard library.
  const StringBindings()
      : super(
          name: 'string',
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
        substringFromBinding,
      };

  /// Binding for [String.length].
  static final lengthBinding = RuntimeBinding<int>(
    name: 'length',
    function: (String str) => str.length,
    namedParams: {
      #str: PrimitiveType.STRING,
    },
  );

  /// Binding for [String.substring].
  static final substringBinding = RuntimeBinding<String>(
    name: 'substring',
    function: (String str, int start, [int? end]) => str.substring(start, end),
    namedParams: {
      #str: PrimitiveType.STRING,
      #start: PrimitiveType.INT,
      #end: PrimitiveType.INT,
    },
  );

  /// Binding for [String.toUpperCase].
  static final toUpperCaseBinding = RuntimeBinding<String>(
    name: 'toUpperCase',
    function: (String str) => str.toUpperCase(),
    namedParams: {
      #str: PrimitiveType.STRING,
    },
  );

  /// Binding for [String.toLowerCase].
  static final toLowerCaseBinding = RuntimeBinding<String>(
    name: 'toLowerCase',
    function: (String str) => str.toLowerCase(),
    namedParams: {
      #str: PrimitiveType.STRING,
    },
  );

  /// Binding for [String.trim].
  static final trimBinding = RuntimeBinding<String>(
    name: 'trim',
    function: (String str) => str.trim(),
    namedParams: {
      #str: PrimitiveType.STRING,
    },
  );

  /// Binding for [String.split].
  static final splitBinding = RuntimeBinding<List<String>>(
    name: 'split',
    function: (String str, String pattern) => str.split(pattern),
    namedParams: {
      #str: PrimitiveType.STRING,
      #pattern: PrimitiveType.STRING,
    },
  );

  /// Binding for [String.replaceAll].
  static final replaceAllBinding = RuntimeBinding<String>(
    name: 'replaceAll',
    function: (String str, String from, String to) => str.replaceAll(from, to),
    namedParams: {
      #str: PrimitiveType.STRING,
      #from: PrimitiveType.STRING,
      #to: PrimitiveType.STRING,
    },
  );

  /// Binding for [String.contains].
  static final containsBinding = RuntimeBinding<bool>(
    name: 'contains',
    function: (String str, String pattern) => str.contains(pattern),
    namedParams: {
      #str: PrimitiveType.STRING,
      #pattern: PrimitiveType.STRING,
    },
  );

  /// Binding for [String.startsWith].
  static final startsWithBinding = RuntimeBinding<bool>(
    name: 'startsWith',
    function: (String str, String pattern) => str.startsWith(pattern),
    namedParams: {
      #str: PrimitiveType.STRING,
      #pattern: PrimitiveType.STRING,
    },
  );

  /// Binding for [String.endsWith].
  static final endsWithBinding = RuntimeBinding<bool>(
    name: 'endsWith',
    function: (String str, String pattern) => str.endsWith(pattern),
    namedParams: {
      #str: PrimitiveType.STRING,
      #pattern: PrimitiveType.STRING,
    },
  );

  /// Binding for [String.indexOf].
  static final indexOfBinding = RuntimeBinding<int>(
    name: 'indexOf',
    function: (String str, String pattern) => str.indexOf(pattern),
    namedParams: {
      #str: PrimitiveType.STRING,
      #pattern: PrimitiveType.STRING,
    },
  );

  /// Binding for [String.lastIndexOf].
  static final lastIndexOfBinding = RuntimeBinding<int>(
    name: 'lastIndexOf',
    function: (String str, String pattern) => str.lastIndexOf(pattern),
    namedParams: {
      #str: PrimitiveType.STRING,
      #pattern: PrimitiveType.STRING,
    },
  );

  /// Binding for [String.replaceFirst].
  static final replaceFirstBinding = RuntimeBinding<String>(
    name: 'replaceFirst',
    function: (String str, String from, String to) =>
        str.replaceFirst(from, to),
    namedParams: {
      #str: PrimitiveType.STRING,
      #from: PrimitiveType.STRING,
      #to: PrimitiveType.STRING,
    },
  );

  /// Binding for [String.substring] with only the start index.
  static final substringFromBinding = RuntimeBinding<String>(
    name: 'substringFrom',
    function: (String str, int start) => str.substring(start),
    namedParams: {
      #str: PrimitiveType.STRING,
      #start: PrimitiveType.INT,
    },
  );
}
