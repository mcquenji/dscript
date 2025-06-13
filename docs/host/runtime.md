# Runtime Support

The runtime executes compiled scripts and enforces the permission model defined
by the host. It exposes a simple API for loading and running `CompiledScript`
instances.

```dart
final runtime = Runtime(bytecode);
final result = await runtime.run('implementationName', args: {'foo':'bar'}); // To execute an implementation
await runtime.emit('hookName', args: {'foo':'bar'}); // To emit an event the script can listen to
```

## Permissions

The runtime enforces permissions declared by the script. When a script is executed, it must declare all permissions required by the host functions it calls. If a permission is missing, the runtime throws an error.

```dart
final runtime = Runtime(compiledScript, permissions: [ScriptPermission.readFileSystem]);
final result = await runtime.run('implementationName', args: {'foo':'bar'});
```

The `Runtime` constructor takes a list of permissions that the script is allowed to use. If the script tries to call an external function that requires a permission not in this list, it will raise an error.

You can also add permissions dynamically at runtime using the `grant` or `grantAll` method:

```dart
runtime.grant(ScriptPermission.writeFileSystem);
runtime.grantAll(); // Grants all permissions required by the script
```

This allows you to control access to resources based on the script's behavior or context.

### Revoking Permissions

You can revoke permissions at any time using the `revoke` or `revokeAll` method:

```dart
runtime.revoke(ScriptPermission.readFileSystem);
runtime.revokeAll(); // Revokes all permissions granted to the script

```

?> For more advanced details on the `Runtime`, see [Choosing a Runtime](/advanced/runtimes.md).
