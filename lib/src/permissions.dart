import 'package:meta/meta.dart';

/// Represents a permission required or granted to execute script operations.
///
/// Permissions are identified by a [namespace] and a [name], matching the DSL's
/// declared `permissions` statements. Custom host permissions use the `external` namespace.
class ScriptPermission {
  /// The namespace associated with this permission (e.g., 'fs', 'ntwk', or 'external').
  final String namespace;

  /// The method or action within the namespace (e.g., 'read', 'write', 'client').
  final String name;

  /// Creates a permission in a specific [namespace] for [name].
  @internal
  const ScriptPermission(this.namespace, this.name);

  /// Creates a custom host-defined permission with the `external` namespace.
  const ScriptPermission.custom(this.name) : namespace = 'external';

  @override

  /// Returns the DSL-style string representation `namespace::method`.
  String toString() => '$namespace::$name';

  /// Permission to read from the filesystem (`fs::read`).
  static const readFiles = ScriptPermission('fs', 'read');

  /// Permission to write to the filesystem (`fs::write`).
  static const writeFiles = ScriptPermission('fs', 'write');

  /// Permission to perform network client requests (`http::client`).
  static const httpClient = ScriptPermission('http', 'client');

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ScriptPermission) return false;
    return namespace == other.namespace && name == other.name;
  }

  @override
  int get hashCode => Object.hash(namespace, name);
}
