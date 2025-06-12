# Compiling Scripts

Once a script is analyzed, it can be compiled to a binary format using the `compile` function:

```dart
final result = analyze(InputStream.fromString(code), [myContract]);
final compiled = compile(result.getOrThrow());
```

The `compile` function takes the analyzed script and produces a `CompiledScript` object which then later can be executed by the runtime (see [Runtime Support](host/runtime.md)).

?> For more details on the compilation process, refer to the [Compiler Overview](/advanced/compiler.md).
