
# Introduction to Dscript

Dscript is a lightweight DSL grammar that lets you write “plugin” scripts for a Dart host.  A single Dscript file describes:

- **Metadata** (author, version, description, license, etc.)
- **Permissions** (e.g. file system or HTTP access)
- **One `contract`** with zero or more:
  - `impl` functions (must be implemented by your script)
  - `hook` callbacks (optional event handlers)
  - optional `func` (private helper functions)
  - `struct` types (custom data types)

Each Dscript implementation is validated **statically** (before runtime) against a `ContractSignature` defined in Dart.  That contract enforces which `impl` names and hooks you must implement and their signatures (parameters + return types).  Hooks always return `void`.

## Key Features

1. **Metadata section** at the top:

   ```dscript
   author "McQuenji";
   version "0.0.1";
   name "TestScript";
   description "Random number generator";
   license "MIT";
   website "https://example.com";
   repo "https://github.com/mcquenji/dscript";

   ```

2. **Permissions** (static check):

   ```dscript
   permissions fs::read, fs::write;
   permissions http::client, http::server;
   permissions external::math;
   ```

- Each permission is a `namespace::action`.
- Host can add more under the `external` namespace (e.g. `external::get_user_info`).

3. **Contract block**:

   ```dscript
   contract Random {
     impl randomNumber(int seed) -> double {
       // Must return a double
     }
     impl randomString() -> string {
       // ...
     }
     hook onLogin(string username) {
       // Purely side-effect; returns void
     }
     struct User {
       name: string
       id: int
     }
   }
   ```

   - Every `impl` must match the contract’s signature exactly (same name, parameter types, return type).
   - Hooks (optional) must match signature (always return void).
   - `struct` types can be used as parameter or return types for both `impl` and `hook`.

4. **Standard library (stdLib)**:

   - Built-ins under `math::`, `string::`, `list::`, `map::`, `log::`, etc.
   - Each call must be prefixed with its namespace (e.g. `math::floor(3.7)` or `fs::read("file.txt")`).

5. **Control flow & Syntax**:
   Very similar to Dart syntax for `if/else`, `while`, `for … in`, `try/catch`, `return`, etc.

### Directory Layout for a Dscript Project

```
my_dscript_project/
├── dscript/              ← (optional) place to keep multiple .dscript files
│   ├── RandomPlugin.dscript
│   └── AnotherPlugin.dscript
├── lib/
│   ├── contract.dart      ← Defines the `Random` contract signature in Dart
│   ├── host.dart          ← Loads & runs `.dscript` using the runtime
│   └── ...
└── pubspec.yaml
```
