// coverage:ignore-file
import 'dart:math';

import 'package:dscript_dart/dscript_dart.dart';
import 'package:logging/logging.dart';
import 'package:pub_semver/pub_semver.dart';

part 'math.dart';
part 'string.dart';
part 'log.dart';
part 'fs.dart';

/// A library binding that contains a list of runtime bindings.
/// This class is used to group related bindings together, such as math
/// functions or string manipulations.
abstract class LibraryBinding {
  /// The list of bindings in this library.
  Set<RuntimeBinding> get bindings;

  /// The name of the library.
  final String name;

  /// A library binding that contains a list of runtime bindings.
  /// This class is used to group related bindings together, such as math
  /// functions or string manipulations.
  const LibraryBinding({
    required this.name,
  });

  @override
  String toString() {
    return """
$name {
  ${bindings.map((b) => b.toString()).join(',\n  ')}
}
""";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LibraryBinding &&
        other.name == name &&
        other.bindings == bindings;
  }

  /// Serializes this library binding to JSON.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'bindings': bindings.map((b) => b.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hash(name, bindings);

  /// Standard library bindings.
  static List<LibraryBinding> stdLib([ScriptMetadata? metadata]) => [
        const MathBindings(),
        const StringBindings(),
        LogBindings(
          metadata ??
              ScriptMetadata(
                author: '',
                name: '',
                version: Version(0, 0, 1),
                description: '',
                license: null,
                repository: null,
                website: null,
              ),
        ),
      ];
}
