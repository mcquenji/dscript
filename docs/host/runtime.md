# Runtime Support

The runtime executes compiled scripts and enforces the permission model defined
by the host. It exposes a simple API for loading and running `CompiledScript`
instances.

```dart
final runtime = Runtime(bytecode);
final result = await runtime.run(compiledScript, args: {'foo':'bar'}); // To execute an implementation
await runtime.emit('hookName', args: {'foo':'bar'}); // To emit an event the script can listen to
```

?> For more advanced details on the `Runtime`, see [Choosing a Runtime](/advanced/runtimes.md).
