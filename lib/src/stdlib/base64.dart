part of 'stdlib.dart';

/// [base64Encode] and [base64Decode] bindings.
class Base64Bindings extends LibraryBinding {
  /// Base64 encoding and decoding functions.
  const Base64Bindings()
      : super(
          name: 'base64',
          description: 'Base64 encoding and decoding functions.',
        );

  /// [base64Encode] binding.
  static final encodeBinding = RuntimeBinding<String>(
    name: 'encode',
    description: '''Encodes the given [str] to a Base64 string.''',
    function: (String str) {
      return base64Encode(utf8.encode(str));
    },
    positionalParams: {'str': PrimitiveType.STRING},
  );

  /// [base64Decode] binding.
  static final decodeBinding = RuntimeBinding<String>(
    name: 'decode',
    description: '''Decodes the given Base64 [str] to a string.''',
    function: (String str) {
      return utf8.decode(base64Decode(str));
    },
    positionalParams: {'str': PrimitiveType.STRING},
  );

  @override
  Set<RuntimeBinding> get bindings => {
        encodeBinding,
        decodeBinding,
      };
}
