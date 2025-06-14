# Performance Overview

This benchmark measures how long it takes to compile and execute a trivial script.
The test compiles a script that multiplies an input value by two and then runs it
on the default runtime.

```
final script = baseRandomScript('return foo * 2.0;');
final result = analyze(InputStream.fromString(script), [randomContract]);
final compiled = compile(result.getOrThrow());
final runtime = Runtime(compiled)..grantAll();
await runtime.run('randomNumber', args: {'foo': 21});
```

On a GitHub Codespaces Linux VM with Dart 3.7.2 the operation
completes in about **37ms** including compilation and execution.

Scripts that perform heavier work may take longer, but simple extensions should
run well below the 200ms budget enforced by the test suite.

## Heavy Script

The tests also benchmark a more complex script that covers recursion,
conditionals and exception handling:

```dscript
func sum(int n) -> double {
  if (n == 0) {
    return 0.0;
  }
  try {
    return n + sum(n - 1);
  } catch (e) {
    return -1.0;
  }
}
return sum(10);
```

Running this script takes about **70ms** on `Runtime` and **120ms** on
`IsolateRuntime`. The isolate based runtime isolates script code but adds some
overhead due to message passing.
