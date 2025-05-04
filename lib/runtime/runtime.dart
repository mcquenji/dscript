import 'dart:math';

import 'package:dscript/dscript.dart';

part 'values.dart';
part 'interpreter.dart';

/// Represents a permission required or granted to execute script operations.
///
/// Permissions are identified by a [namespace] and a [method], matching the DSL's
/// declared `permissions` statements. Custom host permissions use the `external` namespace.
class ScriptPermission {
  /// The namespace associated with this permission (e.g., 'fs', 'ntwk', or 'external').
  final String namespace;

  /// The method or action within the namespace (e.g., 'read', 'write', 'client').
  final String method;

  /// Creates a permission in a specific [namespace] for [method].
  const ScriptPermission._(this.namespace, this.method);

  /// Creates a custom host-defined permission with the `external` namespace.
  const ScriptPermission.custom(this.method) : namespace = 'external';

  @override

  /// Returns the DSL-style string representation `namespace::method`.
  String toString() => '$namespace::$method';

  /// Permission to read from the filesystem (`fs::read`).
  static const readFiles = ScriptPermission._('fs', 'read');

  /// Permission to write to the filesystem (`fs::write`).
  static const writeFiles = ScriptPermission._('fs', 'write');

  /// Permission to perform network client requests (`ntwk::client`).
  static const networkClient = ScriptPermission._('ntwk', 'client');

  /// Permission to start a network server (`ntwk::server`).
  static const networkServer = ScriptPermission._('ntwk', 'server');

  @override

  /// Compares two permissions by namespace and method.
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ScriptPermission) return false;
    return namespace == other.namespace && method == other.method;
  }

  @override

  /// Generates a combined hash code for namespace and method.
  int get hashCode => Object.hash(namespace, method);
}

/// Executes a parsed DSL script by evaluating statements and expressions.
///
/// - Tracks declared and granted permissions.
/// - Manages variable scoping for implementations (functions) and hooks.
/// - Supports invocation of contract implementations and event hooks.
class Runtime {
  /// Permissions that have been explicitly allowed for this run.
  final List<ScriptPermission> _permissions = [];

  /// Permissions required by the script, derived from its top-level `permissions` statements.
  final List<ScriptPermission> _requiredPermissions = [];

  /// The AST [Script] to execute.
  final Script _script;

  /// Creates a [Runtime] for the given parsed DSL [_script].
  ///
  /// Populates [_requiredPermissions] from the script's declared permissions.
  Runtime(this._script) {
    _requiredPermissions.addAll(
      _script.permissions.map((p) => ScriptPermission._(p.namespace, p.method)),
    );
  }

  /// The list of granted permissions (unmodifiable).
  List<ScriptPermission> get permissions => List.unmodifiable(_permissions);

  /// Permissions declared but not yet granted.
  List<ScriptPermission> get missingPermissions =>
      _requiredPermissions.where((p) => !_permissions.contains(p)).toList();

  /// Grants or revokes a [permission].
  ///
  /// If [allowed] is true (default), adds it; otherwise removes it.
  void allow(ScriptPermission permission, [bool allowed = true]) {
    if (allowed) {
      _permissions.add(permission);
    } else {
      _permissions.removeWhere((p) =>
          p.namespace == permission.namespace && p.method == permission.method);
    }
  }

  /// Invokes a [FunctionDeclaration] (implementation or hook) with the given [args].
  RuntimeValue _invoke(
    FunctionDeclaration function,
    Map<String, dynamic> args,
  ) {
    if (missingPermissions.isNotEmpty) {
      throw Exception('Missing permissions: ${missingPermissions.join(', ')}');
    }

    final interpreter = Interpreter();

    return interpreter.exec(
      function,
      args,
    );
  }

  /// Runs the implementation named [name] with the provided [args], returning the raw Dart value.
  ///
  /// Throws if the implementation is not found or if permission checks fail.
  dynamic run(String name, Map<String, dynamic> args) {
    final impl =
        _script.contract.implementations.firstWhere((i) => i.name == name);
    return _invoke(impl, args).value;
  }

  /// Emits an [event] with the given [args] to trigger a hook.
  void emit(String event, Map<String, dynamic> args) {
    if (!_script.contract.hooks.any((h) => h.name == event)) return;
    final hook = _script.contract.hooks.firstWhere((h) => h.name == event);
    _invoke(hook, args);
  }
}
