
# Defining Contracts in Dart

A **ContractSignature** tells the Dscript analyzer which `impl` names, parameter types, return types, and hook signatures your script must satisfy.  The host (Dart) side registers that contract ahead of time.  

## 1. Import Necessary Packages

```dart
import 'package:dscript/dscript.dart';
```

## 2. Create a ContractSignatureBuilder

Use the top-level `contract("Name")` helper to start a builder:

```dart
final randomContract = contract("Random")  // must match the `contract Random { ... }` in Dscript
  // 1) impl functions
  .impl("randomNumber", returnType: PrimitiveType.DOUBLE)
    .param("seed", PrimitiveType.INT)
    .describe("Generate a random double from an int seed")
  .end()
  .impl("randomString", returnType: PrimitiveType.STRING)
    .describe("Generate a random string")
  .end()

  // 2) optional hook definitions
  .hook("onLogin")
    .param("user", const Struct(name: "User"))  // see `struct` below
    .describe("Called whenever a user logs in.")
  .end()

  // 3) define any custom struct types used in these signatures
  .struct("User")
    .field("name", PrimitiveType.STRING)
    .field("id", PrimitiveType.INT)
    .describe("User data passed to onLogin")
  .end()

  // 4) (optionally) bind host functions
  .bind<double>("double", (int x) => x * 2)
    .param(PrimitiveType.INT)
    .describe("Double an integer")
  .end()

  .build();
```

- **`impl(...)`**

  - `name` must exactly match your Dscript’s `impl <name>(…) -> <type>`.
  - Call `.param(name, type)` once per parameter (in order).
  - Call `.describe(...)` (optional) to add hover text.
  - Finally, call `.end()` to return to the contract builder.

- **`hook(...)`**

  - Hook functions always return `void`.
  - Use `.param(name, type)` to match Dscript hook’s parameters.

- **`struct(...)`**

  - If Dscript uses a custom struct (e.g. `struct User { … }`), you must mirror it in Dart.
  - Provide exactly the same field names + types.
  - They can be passed between host and script (depending on your runtime implementation).

- **`bind<T>(...)`**

  - Expose a Dart function as `external::<name>` in Dscript.
  - The generic `<T>` is the return type in Dart.
  - Call `.param(type)` or `.namedParam(...)` to set parameter types.
  - Call `.permission("namespace::action")` if it requires extra permission.
  - Finally, `.end()` returns to the contract builder.

## 3. Registering Multiple Contracts

If you have multiple plugin points, build multiple `ContractSignature` objects:

```dart
final randomContract = contract("Random") … .build();
final authContract   = contract("Auth")
  .impl("login", returnType: PrimitiveType.VOID)
    .param("username", PrimitiveType.STRING)
    .param("password", PrimitiveType.STRING)
  .end()
  .hook("onLogout")
    .describe("Fires after a user logs out")
  .end()
  .build();
```

Then pass them as a `List<ContractSignature>` to your analyzer/runtime.

---

## 4. Putting It Together

```dart
import 'package:dscript/dscript.dart';
import 'package:dscript/src/contract_builder.dart';

void main() {
  // 1) Build contract(s)
  final myContract = contract("Random")
    .impl("randomNumber", returnType: PrimitiveType.DOUBLE)
      .param("seed", PrimitiveType.INT)
    .end()
    .impl("randomString", returnType: PrimitiveType.STRING)
    .end()
    .hook("onLogin")
      .param("user", const Struct(name: "User"))
    .end()
    .struct("User")
      .field("name", PrimitiveType.STRING)
      .field("id", PrimitiveType.INT)
    .end()
    .build();

  // 2) (Later) load & run scripts that implement “Random”
  //    see Loading & Executing below.
}
```


