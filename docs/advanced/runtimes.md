# Choosing a Runtime

Dscript ships with two runtime implementations: `Runtime` and `IsolateRuntime`. Both execute compiled scripts but differ in how they isolate script code.

!> As a result of each hook or implementation being executed independently in seperate VMs (regardless of the runtime) and to avoid race conditions, it is not possible to share state between them. If you need to share data, consider passing it explicitly as an argument.

## Runtime

The default `Runtime` runs code in the current isolate. Host functions are invoked directly which yields the best performance but means that the script shares memory with the host application.

## IsolateRuntime

`IsolateRuntime` uses Dart's `Isolate.run` to execute each invocation in a separate isolate. This provides memory isolation between script and host but comes with additional overhead due to message passing. Use `IsolateRuntime` when scripts should not affect the host isolate or when they perform heavy work that may block.

## Custom Virtual Machines

The runtime uses a bytecode virtual machine (VM) to execute compiled functions. A different VM can be provided by passing a `vmFactory` when constructing a runtime:

```dart
final runtime = Runtime(
  compiledScript,
  [ScriptPermission.readFileSystem],
  (fn, {args, namedArgs, functions, libraries}) {
    return MyCustomVM(
      fn,
      args: args,
      namedArgs: namedArgs,
      functions: functions,
      libraries: libraries,
    );
  },
);
```

The factory receives the bytecode function and execution context and must return a `VM` instance implementing the `exec` method. Both `Runtime` and `IsolateRuntime` accept this parameter.
