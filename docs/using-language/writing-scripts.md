
# Writing Dscript Files

This page shows the full grammar structure, common patterns, and examples.

---

## 1. File Header & Schema

A `.dscript` file can optionally start with:

```dscript
schema "my_schema_name";
````

Currently, explicit schema declarations are not enforced, but they can be used for future validations.

### Metadata Keywords

```dscript
author      "Your Name";
version     1.2.3;
name        "PluginName";
description "A short description of what this plugin does.";
// You can have multiple `description` lines; they concatenate with `\n`.
license     "MIT";
website     "https://example.com";
repo        "https://github.com/your/repo";
```

**Rules**

- Each metadata line must end with a semicolon (`;`).
- `version` follows SemVer syntax: `MAJOR.MINOR.PATCH` (e.g. `2.0.0`).

---

## 2. Permissions

```dscript
permissions fs::read, fs::write;
permissions http::client;
permissions external::get_user_info;
```

- Multiple `permissions` statements allowed.
- Each permission is `namespace::action`.
- The DSL’s standard library defines:

  - `fs::read`, `fs::write`
  - `http::client`, `http::server`
- Any host-provided functions should live under `external::…`.
- At compile time, missing permissions trigger a static error.

---

## 3. Contract Block

Every script must implement exactly **one** `contract`:

```dscript
contract MyContract {
  // (optional) file-scope constant:
  const PI_APPROX = 3;
  
  impl doSomething(int x, string y) -> bool {
    // Dart-style code, must return a bool
    if (x > 0) {
      return true;
    } else {
      return false;
    }
  }
  
  impl computeValue() -> double {
    return math::sqrt(42.0);
  }
  
  hook onEvent(User u, int count) {
    log::info("User " + u.name + " fired onEvent " + count);
  }
  
  struct User {
    name: string
    id: int
  }
}
```

- **`impl <name>(<params>) -> <type> { … }`**

  - Must match an entry in the Dart-defined `ContractSignature`.
  - If the contract says `impl doSomething(int, string) -> bool`, your script must declare `impl doSomething(int x, string y) -> bool { … }`.
  - Return-type is mandatory (cannot omit `-> <type>`).
  - Use `return <expr>;` inside. If return type is `void`, you may simply write `impl test() -> void { … }`.

- **`hook <name>(<params>) { … }`**

  - Hooks always return `void`.
  - If the contract signature lists a `hook onLogin(string username)`, your script must define `hook onLogin(string username) { … }`.
  - Hooks are optional: if you don’t need a particular hook, simply omit it.

- **`struct <Name> { … }`**

  - Define custom data types usable in signatures.
  - Fields: `fieldName: Type`.
  - Example:

    ```dscript
    struct User {
      name: string
      id: int
    }
    ```

  - Can be passed to both `impl` and `hook`.

---

## 4. Variables & Constants

Inside `impl` or `hook` bodies:

```dscript
const FIVE = 5;         // compile-time constant
final int x = 10;       // non-nullable int
var string? maybeStr;   // nullable string
var int y = 3;          // mutable int (default)
final string s = "hi";  // immutable, non-nullable string
```

- Keywords: `const`, `final`, `var`.
- Nullable types: append `?` (e.g. `string?`).
- No implicit casting: you must match types exactly or use built-ins like `math::floor(…)`.

---

## 5. Control Flow

Same style as Dart:

```dscript
if (x > 0) {
  log::info("Positive");
} else if (x < 0) {
  log::warning("Negative");
} else {
  log::info("Zero");
}

while (i < 10) {
  i = i + 1;
}

for (var int i = 0; i < 5; i = i + 1) {
  log::info("i = " + string::from(i));
}

for (var int v in [1, 2, 3]) {
  log::info("Value = " + string::from(v));
}

try {
  // might throw
  external::dangerousCall();
} catch (e) {
  log::error("Caught: " + e.message);
}

return;           // only in `impl … -> void`
return 42;        // if return type is `int` or `double`
```

---

## 6. Expressions & Built-ins

- **Arithmetic / Logic**: `+`, `-`, `*`, `/`, `%`, `&&`, `||`, `!`, `==`, `!=`, `<`, `>`, `<=`, `>=`.
- **Unary**: `+x`, `-x`, `!x`, `~x`.
- **Indexing**: `[1,2,3][0]` for lists, `{ "k": "v" }["k"]` for maps.
- **Function Calls**:

  - **External** (stdLib or host) must be `namespace::function(...)`.

    - E.g. `math::floor(3.7)`, `log::info("hello")`, `fs::read("file.txt")`.
  - **Internal**: currently, plain `func foo() -> void {}` is supported but not exposed to host.

---

## 7. Examples

### Random Number Script

```dscript
author "McQuenji";
version "0.0.1";
name "TestScript";
description "Simple RNG for testing";
license "MIT";

permissions math::floor;

contract Random {
  impl randomNumber(int seed) -> double {
    // return seed * pi
    return external::double(math::floor(seed * pi));
  }

  impl randomString() -> string {
    // fixed string
    return "Hello from Dscript!";
  }

  hook onLogin(string username) {
    log::info("User logged in: " + username);
  }

  struct User {
    name: string
    id: int
  }
}
```

This satisfies a Dart contract called `Random` that expects:

- `impl randomNumber(int) -> double`
- `impl randomString() -> string`
- `hook onLogin(string) -> void`
- `struct User { name: string, id: int }`

