import 'dart:isolate';

import 'package:dscript/dscript.dart';

/// The Dscript runtime environment.
///
/// Before using this runtime, ensure that the necessary
/// permissions are granted to access the
/// required resources and perform the intended operations.
///
/// If any permissions are missing,
/// a [RuntimeException] will be thrown with details about the missing permissions.
class Runtime {
  /// The script being executed in this runtime.
  final CompiledScript script;

  /// The permissions granted to this runtime.
  final List<ScriptPermission> permissions;

  /// The factory function to create a [VM] instance for executing bytecode functions.
  ///
  /// Defaults to [DefaultVM.new] if not provided.
  final VM Function(
    BytecodeFunction, {
    List<dynamic> args,
    Map<String, dynamic> namedArgs,
  }) vmFactory;

  /// A list of permissions that are missing for the script to run.
  List<ScriptPermission> get missingPermissions {
    return script.permissions.where((p) => !permissions.contains(p)).toList();
  }

  /// Constructs a [Runtime] instance with the provided [script] and [permissions].
  ///
  /// You can optionally provide a custom [vmFactory] to use your own VM implementation.
  const Runtime(
    this.script,
    this.permissions, [
    this.vmFactory = DefaultVM.new,
  ]);

  /// Checks if the runtime has the necessary permissions to execute the script.
  /// If any permissions are missing this will throw.
  void checkPermissions() {
    if (missingPermissions.isNotEmpty) {
      throw StateError(
        'Missing permissions: ${missingPermissions.join(', ')}',
      );
    }
  }

  /// Executes the given [implementation] in a new isolate with the provided [args] and [namedArgs].
  Future<dynamic> run(
    String implementation, {
    Map<String, dynamic> namedArgs = const {},
  }) async {
    checkPermissions();

    final sig = script.contract.implementations.find(implementation);

    if (!script.implementations.containsKey(implementation) || sig == null) {
      throw ArgumentError.value(
        implementation,
        'implementation',
        'No such implementation defined in the script.',
      );
    }

    /// verify permissions

    final impl = script.implementations[implementation]!;

    final vm = vmFactory(impl, args: [], namedArgs: namedArgs);

    return Isolate.run(vm.exec);
  }

  /// Executes the given [hook] in a new isolate with the provided [args] and [namedArgs].
  ///
  /// If the [hook] is defined but not implemented in the script, this will be a no-op.
  /// If the [script] does not define the [hook], an [ArgumentError] is thrown.
  Future<void> emit(
    String hook, {
    Map<String, dynamic> namedArgs = const {},
  }) async {
    checkPermissions();

    final sig = script.contract.hooks.find(hook);

    if (sig == null) {
      throw ArgumentError.value(
        hook,
        'hook',
        'No such hook defined in the contract.',
      );
    }

    if (!script.hooks.containsKey(hook)) {
      return;
    }

    final hookImpl = script.hooks[hook]!;

    final vm = vmFactory(hookImpl, args: [], namedArgs: namedArgs);

    await Isolate.run(vm.exec);
  }

  /// Grants the specified [permission] to this runtime.
  void grant(ScriptPermission permission) {
    if (permissions.contains(permission)) {
      return;
    }
    permissions.add(permission);
  }

  /// Grants all missing permissions to this runtime.
  void grantAll() {
    for (final permission in missingPermissions) {
      grant(permission);
    }
  }

  /// Revokes the specified [permission] from this runtime.
  void revoke(ScriptPermission permission) {
    if (!permissions.contains(permission)) {
      return;
    }
    permissions.remove(permission);
  }

  /// Revokes all permissions from this runtime.
  void revokeAll() {
    permissions.clear();
  }
}
