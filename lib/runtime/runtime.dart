import 'dart:math';

import 'package:dscript/analyzer/analyzer.dart';
import 'package:dscript/dscript.dart';
import 'package:dscript/runtime/stdlib/stdlib.dart';

part 'values.dart';
part 'interpreter.dart';
part 'bindings.dart';
part 'exceptions.dart';

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
  const ScriptPermission._(this.namespace, this.name);

  /// Creates a custom host-defined permission with the `external` namespace.
  const ScriptPermission.custom(this.name) : namespace = 'external';

  @override

  /// Returns the DSL-style string representation `namespace::method`.
  String toString() => '$namespace::$name';

  /// Permission to read from the filesystem (`fs::read`).
  static const readFiles = ScriptPermission._('fs', 'read');

  /// Permission to write to the filesystem (`fs::write`).
  static const writeFiles = ScriptPermission._('fs', 'write');

  /// Permission to perform network client requests (`ntwk::client`).
  static const networkClient = ScriptPermission._('http', 'client');

  /// Permission to start a network server (`ntwk::server`).
  static const networkServer = ScriptPermission._('http', 'server');

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ScriptPermission) return false;
    return namespace == other.namespace && name == other.name;
  }

  @override
  int get hashCode => Object.hash(namespace, name);
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

  late final Analyzer _analyzer;

  late final ExternalBindings _bindings;

  /// Creates a [Runtime] for the given parsed DSL [_script].
  ///
  /// Populates [_requiredPermissions] from the script's declared permissions.
  Runtime(
    this._script, {
    /// List of contracts defined by the host.
    List<ContractSignature> contracts = const [],
  }) {
    _requiredPermissions.addAll(
      _script.permissions.map((p) => ScriptPermission._(p.namespace, p.method)),
    );

    _analyzer = Analyzer(
      contracts: contracts,
    );

    _analyzer.analyze(_script).throwIfErrors();

    _bindings = _analyzer.getContract(_script).bindings;
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
          p.namespace == permission.namespace && p.name == permission.name);
    }
  }

  /// Invokes a [FunctionDeclaration] (implementation or hook) with the given [args].
  RuntimeValue _invoke(
    FunctionDeclaration function,
    Map<String, dynamic> args,
  ) {
    if (missingPermissions.isNotEmpty) {
      throw RuntimeException(
          'Missing permissions: ${missingPermissions.join(', ')}');
    }

    final interpreter = Interpreter(
      bindings: [...LibraryBinding.stdLib(_script), _bindings],
      permissions: _permissions,
    );

    return interpreter.exec(
      function,
      args,
    );
  }

  /// Runs the implementation named [name] with the provided [args], returning the raw Dart value.
  ///
  /// Throws if the implementation is not found or if permission checks fail.
  dynamic run(String name, Map<String, dynamic> args) {
    if (!_script.contract.implementations.any((i) => i.name == name)) {
      throw RuntimeException('$name is not implemented in the script');
    }

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
