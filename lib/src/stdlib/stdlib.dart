// coverage:ignore-file
import 'dart:io';
import 'dart:math';

import 'package:dscript_dart/dscript_dart.dart';
import 'package:logging/logging.dart';
import 'package:pub_semver/pub_semver.dart';

part 'math.dart';
part 'string.dart';
part 'log.dart';
part 'fs.dart';
part 'list.dart';
part 'map.dart';
part 'dynamic.dart';

/// A library binding that contains a list of runtime bindings.
/// This class is used to group related bindings together, such as math
/// functions or string manipulations.
abstract class LibraryBinding {
  /// The list of bindings in this library.
  Set<RuntimeBinding> get bindings;

  /// The name of the library.
  final String name;

  /// The docstring to describe the library.
  final String description;

  /// A library binding that contains a list of runtime bindings.
  /// This class is used to group related bindings together, such as math
  /// functions or string manipulations.
  const LibraryBinding({
    required this.name,
    required this.description,
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
  ///
  /// This calls [standardLibrary] and sets [metadata] to a default value if not provided.
  ///
  /// See [standardLibrary] to override the default standard library bindings.
  static List<LibraryBinding> stdLib([ScriptMetadata? metadata]) {
    return standardLibrary(
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
    );
  }

  /// The standard library bindings used by [stdLib].
  /// Defaults to [defaultStdLib].
  ///
  /// Set this to a custom function to override the default standard library bindings,
  /// which must be done **before** analyzing, compiling, or running any scripts,
  /// in order to take effect.
  static StdLib standardLibrary = defaultStdLib;

  /// The default standard library bindings returned by [standardLibrary] if not overridden.
  static List<LibraryBinding> defaultStdLib(ScriptMetadata metadata) => [
        const MathBindings(),
        const StringBindings(),
        const FsBindings(),
        const ListBindings(),
        const MapBindings(),
        const DynamicBindings(),
        LogBindings(metadata),
      ];
}

/// A function that returns a list of standard library bindings.
typedef StdLib = List<LibraryBinding> Function(ScriptMetadata metadata);
