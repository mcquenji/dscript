part of 'stdlib.dart';

/// Provides JSON encoding and decoding functions.
class JsonBindings extends LibraryBinding {
  /// Provides JSON encoding and decoding functions.
  const JsonBindings()
      : super(
          name: 'json',
          description: 'Provides JSON encoding and decoding functions.',
        );

  @override
  Set<RuntimeBinding> get bindings => {
        decodeBinding,
        encodeBinding,
      };

  /// Binding for [jsonDecode].
  static final decodeBinding = RuntimeBinding<Map<String, dynamic>>(
    name: 'decode',
    description: '''Deserializes the given [str] to a [Map<String, dynamic>].
        
        Throws an error if the string is not valid JSON or cannot be parsed.
        ''',
    function: (String str) {
      return jsonDecode(str);
    },
    positionalParams: {'str': PrimitiveType.STRING},
  );

  /// Binding for [jsonEncode].
  static final encodeBinding = RuntimeBinding<String>(
    name: 'encode',
    description: '''Serializes the given [obj] to a JSON string. 
        
        Throws an error if the object cannot be serialized.''',
    function: (dynamic obj) {
      return jsonEncode(obj);
    },
    positionalParams: {
      'obj': const DynamicType(),
    },
  );
}
