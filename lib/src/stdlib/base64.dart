import 'dart:convert';

import 'package:dscript_annotations/dscript_annotations.dart';
import 'package:dscript_dart/dscript_dart.dart';

part 'base64.g.dart';

/// Provides utility functions for Base64 encoding and decoding.
@namespace
class Base64Bindings extends _$Base64Bindings {
  /// Provides utility functions for Base64 encoding and decoding.
  const Base64Bindings();

  /// Encodes [input] to Base64 format.
  @override
  String encode(String input) {
    return base64.encode(input.codeUnits);
  }

  /// Decodes [input] from Base64 format.
  @override
  String decode(String input) {
    return utf8.decode(base64.decode(input));
  }
}
