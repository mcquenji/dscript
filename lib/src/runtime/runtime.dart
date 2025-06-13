import 'dart:isolate';

import 'package:dscript/dscript.dart';
import 'package:dscript/src/stdlib/stdlib.dart';

/// The Dscript runtime environment.
///
/// Before using this runtime, ensure that the necessary
/// permissions are granted to access the
/// required resources and perform the intended operations.
///
/// If any permissions are missing, calling [run] or [emit] will throw a [StateError].
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
    Map<String, BytecodeFunction> functions,
    Map<String, LibraryBinding> libraries,
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

  /// Executes the given [implementation] with the provided [args].
  Future<dynamic> run(
    String implementation, {
    Map<String, dynamic> args = const {},
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

    final libraries = {
      for (final lib in LibraryBinding.stdLib(script.metadata)) lib.name: lib,
      script.contract.bindings.name: script.contract.bindings,
    };

    final vm = vmFactory(
      impl,
      args: [],
      namedArgs: args,
      functions: script.functions,
      libraries: libraries,
    );

    return await vm.exec();
  }

  /// Executes the given [hook] in with the provided [args].
  ///
  /// If the [hook] is defined but not implemented in the script, this will be a no-op.
  /// If the scipt's contract does not define the [hook], an [ArgumentError] is thrown.
  Future<void> emit(
    String hook, {
    Map<String, dynamic> args = const {},
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

    final libraries = {
      for (final lib in LibraryBinding.stdLib(script.metadata)) lib.name: lib,
      script.contract.bindings.name: script.contract.bindings,
    };

    final vm = vmFactory(
      hookImpl,
      args: [],
      namedArgs: args,
      functions: script.functions,
      libraries: libraries,
    );

    await vm.exec();
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

/// Same as [Runtime] but each invocation of [run] or [emit] will be executed in a separate isolate.
class IsolateRuntime extends Runtime {
  /// Same as [Runtime] but each invocation of [run] or [emit] will be executed in a separate isolate.
  IsolateRuntime(super.script, super.permissions, [super.vmFactory]);

  @override
  Future run(String implementation, {Map<String, dynamic> args = const {}}) {
    return Isolate.run(() => super.run(implementation, args: args));
  }

  @override
  Future<void> emit(String hook, {Map<String, dynamic> args = const {}}) {
    return Isolate.run(() => super.emit(hook, args: args));
  }
}
