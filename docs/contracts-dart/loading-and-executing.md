# Loading & Executing a Dscript in Dart

Once you’ve defined a `ContractSignature`, you can analyze, load, and run any `.dscript` file that implements it.

---

## 1. Add Dependencies

In your `pubspec.yaml`:

```yaml
dependencies:
  dscript:
    path: ../path_to_dscript_package
  antlr4: ^4.9.3
  logging: ^1.0.2
  result_dart: ^1.0.0
````

Then run `flutter pub get` or `dart pub get`.

---

## 2. Initialize the Analyzer

```dart
import 'dart:io';
import 'package:antlr4/antlr4.dart';
import 'package:dscript/dscript.dart';
import 'package:logging/logging.dart';

Future<void> main() async {
  // 1) Build or import your ContractSignature
  final randomContract = buildRandomContract(); // from previous docs

  // 2) Read your .dscript file from disk
  final code = await InputStream.fromPath('dscript/RandomPlugin.dscript');

  // 3) Analyze
  final result = analyze(code, [randomContract]);
  result.when(
    success: (script) {
      print('✅ Analysis passed! Running implementations...');
      runScript(script);
    },
    failure: (errors) {
      print('❌ Analysis failed:\n$errors');
    },
  );
}
```

- **`analyze(...)`** returns a `ResultDart<Script, AnalysisReport>`.

  - If any syntax or semantic errors exist, you’ll receive an `AnalysisReport` of all issues.
  - Otherwise you get a `Script` object containing metadata, AST, `implementations`, and `hooks`.

## 3. Executing an `impl`

!> The runtime VM is still under development and not yet implemented in the Dart package. This section describes the intended API and usage.

After analysis, you can call implementations via the runtime API:

```dart
void runScript(Script script) async {
  // 1) Create a new runtime Scope
  final scope = Scope();

  // 2) (Optionally) populate host variables
  //    e.g. pass in some constants or host objects

  // 3) For each binding in script.contract.bindings, register in runtime
  //    so that external::… calls succeed:
  for (final binding in script.contract.bindings.bindings) {
    // e.g. register binding in your runtime environment
    // runtime.register(binding);
  }

  // 4) Call an impl by name:
  final seedValue = RuntimeValue(42); // wrap any literal into RuntimeValue
  final result = await script
      .invoke("randomNumber", [seedValue])
      .catchError((e) => print("Runtime error: $e"));

  print("randomNumber returned: ${result.value}"); // should be a double
}
```

### Notes on `Script.invoke()`

- `invoke(name, List<RuntimeValue> positionalArgs, {Map<Symbol, RuntimeValue> namedArgs})`

  - `name`: must match an `impl` in your Dscript contract.
  - `positionalArgs`: wrap each literal in `RuntimeValue(...)`.
  - Returns a `Future<RuntimeValue>` that resolves to the DSL value (auto-cast back to Dart type).

---

## 4. Handling Hooks

To trigger a hook from Dart (e.g. `onLogin`), call:

```dart
await script.invokeHook("onLogin", [RuntimeValue("alice")]);
// No return value (void), but any side-effects (console logging, updates) happen inside Dscript.
```

- If you call a hook that isn’t implemented by the script, it’s a no-op (no error).
- If the hook’s signature doesn’t match, an error is thrown during analysis—so runtime calls assume the signature was already validated.

---

## 5. Errors & Debugging

- **Analysis errors**:

  - Shown during `analyze(...)`.  Fix missing/typo in `impl` names, wrong parameter types, missing `return`, etc.
- **Runtime errors**:

  - If you call `invoke(...)` with the wrong number of arguments, or missing host bindings, you’ll get a `RuntimeException`.
  - Use `logging` package to add more debug prints inside your `impl` bodies.

