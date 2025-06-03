# Introduction

This page details the full grammar for writing `.dscript` files, including metadata, permissions, the contract block, and language constructs. We focus on the core language features; the runtime VM is not yet implemented.

## File Header & Metadata

Every `.dscript` file must begin with these metadata statements. Each statement ends with a semicolon (`;`):

```dscript
author      "Your Name";
version     1.0.0;           // SemVer without quotes
name        "PluginName";
description "A short description.";
description "Additional line.";
```

* **author** (string): The script author’s name. **Required**.
* **version** (SemVer without quotes): Format `MAJOR.MINOR.PATCH`, e.g., `2.1.3`. **Required**.
* **name** (string): Plugin name. **Required**.
* **description** (string): Human-readable description. Can be declared multiple times; each appends a newline. **Required**.
* **license**, **website**, **repo** (strings): Optional;

!> Each metadata field (except for `description`) must be declared exactly once. If you declare a field multiple times, it is an error.

Missing a required field or an invalid `version` triggers a `MetadataError`.

## Permissions

Declare any permissions before calling functions that require them:

```dscript
permissions fs::read;
permissions fs::write;
permissions http::client;
permissions http::server;
```

* You may have multiple `permissions` statements.
* Each permission is a qualified name `namespace::action` (e.g., `fs::read`).
* Only I/O (`fs::read`, `fs::write`) and networking (`http::client`, `http::server`) methods require permissions now.

### External Permissions

Permissions under `external::` map to host-defined functions. The permission name can differ from the function name:

```dscript
// Host binds getUser() to permission external::user_info
permissions external::user_info;
// Host binds sendAlert() to permission external::notification
permissions external::notification;
```

After declaring, you call the associated function:

```dscript
contract UserActions {
  impl fetchUserInfo(int userId) -> User {
    return external::getUser(userId);
  }

  impl alertUser(string message) -> void {
    external::sendAlert(message);
  }
}
```

Omitting a required permission for any function—standard library or host—triggers a `PermissionError`.

## Contract Block

Each script must have exactly one `contract` block:

* **Constants** (optional)
* One or more **impl** functions (required)
* Zero or more **hook** callbacks (optional)
* **Structs**: Defined only by the host; scripts cannot declare new types.

```dscript
contract MyContract {
  const PI_APPROX = 3.14;

  impl doSomething(int x, string y) -> bool {
    return (x > 0 && y.length > 0);
  }

  impl computeValue() -> double {
    return math::sqrt(42.0);
  }

  hook onEvent(User u, int count) {
    log::info("User " + u.name + " event " + string::from(count));
  }
}
```

### `impl <name>(<params>) -> <type> { … }`

* Matches a host-defined signature exactly.
* Parameters: `<name>: <type>`, types are `int`, `double`, `string`, `bool`, or a host-provided `struct`.
* Return type: one of the above types or `void`.
* Body uses Dart-style syntax; `return <expr>;` is required for non-void.

### `hook <name>(<params>) { … }`

* Mirrors an optional host callback.
* Always returns `void`; no `->` clause.

## Constants & Variables

Inside `impl` or `hook`:

```dscript
const MAX_RETRIES = 5;
final int x = 10;
var string? maybeStr;
var int y = 3;
final string s = "hello";
```

* `const`: Compile-time constant, literal-only initialization.
* `final`: Runtime constant, initialized once.
* `var`: Mutable variable, can be reassigned.

?> Variable types can be inferred by the compiler when they have an initializer.

!> Aside from `int -> double`, there is no implicit type conversion. You must use explicit conversion functions like `math::floor()`, `string::from()`, etc.

## Control Flow

Dart-style:

```dscript
if (x > 0) {
  log::info("Positive");
} else {
  log::info("Non-positive");
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
  external::dangerousCall();
} catch (e) {
  log::error("Caught: " + e.message);
}
```

* Supports `if/else`, `while`, `for (...)`, `for ... in`, and `try/catch`.
* Use `return <value>;` inside `impl`, optional `return;` for `void`.

## Expressions & Built-ins

### Operators

* Arithmetic: `+`, `-`, `*`, `/`, `%`
* Comparison: `==`, `!=`, `<`, `>`, `<=`, `>=`
* Logical: `&&`, `||`, `!`
* Unary: `-x`, `!x`

```dscript
var int sum = a + b;
var bool ok = (count > 0) && (!error);
var double result = -x * 2.5;
```

### Indexing Literals

* Lists: `[1, 2, 3][0]` → `1`
* Maps: `{"k": "v"}["k"]` → `"v"`

### Namespaces

* **`math::`** (returns `int`/`double`):

  * `math::sqrt(9.0)` → `3.0`
  * `math::floor(3.7)` → `3`
  * `math::pow(2.0, 3.0)` → `8.0`
  * `math::abs(-5)` → `5`

* **`string::`** (returns `string`/`int`):

  * `string::from(123)` → `"123"`
  * `string::concat("a", "b")` → `"ab"`
  * `string::length("abc")` → `3`
  * `string::substring("hello", 1, 4)` → `"ell"`
  * `string::toUpper("dscript")` → `"DSCRIPT"`

* **`log::`** (returns `void`):

  * `log::info("OK");`
  * `log::warning("Warn");`
  * `log::error("Error");`
  * `log::debug("Debug");`

## Calling Dart Functions

Functions defined in Dart are called `bindings`. They can be called from Dscript using the `namespace::function` syntax:

```dscript
external::myFunction(int x, double y) -> string;
```

?> The `external::` namespace is used for host-defined functions. Any other namespace (like `math::`, `string::`, etc.) is reserved for built-in functions.

## Example: Simple Random Plugin

```dscript
author "McQuenji";
version 0.0.1;
name "RandomPlugin";
description "Simple random helpers";

contract Random {
  impl randomNumber(int seed) -> double {
    var double val = seed * 0.61803398875;
    return math::floor(val + math::abs(seed % 10));
  }

  impl randomString() -> string {
    return "Hello from Dscript!";
  }

  hook onLogin(string username) {
    log::info("User logged in: " + username);
  }
}
```

* **Metadata**: Declares required fields.
* **Contract**: Implements `Random` with two `impl` functions and one `hook`.
