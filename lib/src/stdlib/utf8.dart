part of 'stdlib.dart';

/// Provides UTF-8 encoding and decoding functions.
class Utf8Bindings extends LibraryBinding {
  /// Provides UTF-8 encoding and decoding functions.
  const Utf8Bindings()
      : super(
          name: 'utf8',
          description: 'Provides UTF-8 encoding and decoding functions.',
        );

  @override
  Set<RuntimeBinding> get bindings => {
        decodeBinding,
        encodeBinding,
      };

  /// Binding for [utf8Decode].
  static final decodeBinding = RuntimeBinding<String>(
    name: 'decode',
    description: '''Decodes the given [bytes] to a UTF-8 string.''',
    function: (List<int> bytes) {
      return utf8.decode(bytes);
    },
    positionalParams: {
      'bytes': ListType(elementType: PrimitiveType.INT),
    },
  );

  /// Binding for [utf8Encode].
  static final encodeBinding = RuntimeBinding<List<int>>(
    name: 'encode',
    description: '''Encodes the given [str] to a list of UTF-8 bytes.''',
    function: (String str) {
      return utf8.encode(str);
    },
    positionalParams: {
      'str': PrimitiveType.STRING,
    },
  );
}
