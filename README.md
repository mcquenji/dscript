# Dscript

A lightweight [Domain-Specific Language (DSL)](https://en.wikipedia.org/wiki/Domain-specific_language) for Dart designed to simplify writing and integrating plugins/extensions into Flutter and Dart applications. It offers strong interop between DSL constructs and Dart code, a static permission system, and a contract-based plugin model.

---

## Table of Contents

- [Dscript](#dscript)
  - [Table of Contents](#table-of-contents)
  - [Features](#features)
  - [Getting Started](#getting-started)
    - [Installation](#installation)
    - [Quick Example](#quick-example)
  - [DSL Overview](#dsl-overview)
    - [Metadata](#metadata)
    - [Permissions](#permissions)
    - [Contracts](#contracts)
      - [Implementations](#implementations)
      - [Hooks](#hooks)
  - [Host Integration](#host-integration)
  - [Runtime API](#runtime-api)
  - [Error Handling](#error-handling)
  - [Contributing](#contributing)
  - [License](#license)

---

## Features

- **Contract-based plugins**: Define clear interfaces (`contract`) that plugins must implement (`impl`).
- **Lifecycle hooks**: Declare optional hooks (`hook`) for events (e.g., `onLogin`).
- **Static permission checks**: Specify required permissions (`fs::read`, `http::client`, etc.) and enforce them at runtime.
- **Seamless Dart interop**: Call Dart code directly from DSL via standard libs (`math::sqrt`) or host-provided bindings.
- **Typed values & implicit casts**: Built-in types (`int`, `double`, `string`, `bool`) with implicit conversions.
- **Lightweight runtime**: Minimal footprint, easy to embed in Flutter or Dart backends.

---

## Getting Started

### Installation

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  dscript:
    git:
      url: https://github.com/mcquenji/dscript
      ref: main
```

Then import in your Dart code:

```dart
import 'package:dscript/dscript.dart';
```

### Quick Example

```dscript
author "McQuenji";
version "0.0.1";
name "TestScript";
description "Random number generator";
license "MIT";
website "https://example.com";
repo "https://github.com/mcquenji/dscript";

permissions fs::read, fs::write;
permissions http::client, http::server;

contract Random {
  impl randomNumber(int foo) -> double {
    return foo * pi;
  }

  impl randomString() -> string {
    return 'Hello, "World"!';
  }

  impl test() -> void {
    // Test implementation
  }

  hook onLogin(string username) {
    // Hook implementation
  }
}
```

Load, parse, grant permissions, and run:

```dart
// 1. Parse the DSL source
final script = Parser().parse(SourceCode(yourDslString));

// 2. Create a runtime and define required implementations and hooks
final runtime = Runtime(
  script,
  implementations: [
    Implementation.static('randomNumber', ['int foo'], 'double'),
    Implementation.static('randomString', [], 'string'),
    Implementation.static('test', [], 'void'),
  ],
  hooks: [
    Hook.static('onLogin', ['string username']),
  ],
);
runtime.allowAll(script.permissions);

// 3. Invoke implementations
final result = runtime.run('randomNumber', {'foo': 42});
print(result); // 131.946896…

// 4. Emit hooks
runtime.emit('onLogin', {'username': 'alice'});
```

---

## DSL Overview

### Metadata

Use top-level statements to declare script metadata:

| Keyword       | Purpose                            |
| ------------- | ---------------------------------- |
| `author`      | Author of the script               |
| `version`     | Semantic version (e.g., `"1.2.3"`) |
| `name`        | Script name                        |
| `description` | Optional description               |
| `license`     | License identifier (e.g., `MIT`)   |
| `website`     | Project website URL                |
| `repo`        | Repository URL                     |

Each metadata statement ends with a semicolon (`;`).

> **Note:** Multiple `description` statements are interpreted as newlines, allowing you to write multi-line descriptions by declaring `description` multiple times.

### Permissions

Declare required capabilities before the `contract`:

```dsl
permissions fs::read, fs::write;
permissions http::client;
```

At runtime, these must be granted via `runtime.allow()` or `runtime.allowAll()` before invoking implementations or hooks.

### Contracts

A `contract` defines the interface for plugins. It contains:

- **`impl` functions**: Required methods that must return a specified type.
- **`hook` functions**: Optional event handlers (always `void`).

#### Implementations

Use `impl` to define required functions:

```dsl
impl doWork(int times) -> bool {
  return times > 0;
}
```

- Parameters: `(type name, ...)`
- Return type after `->`. Defaults to `void` if omitted.

#### Hooks

Use `hook` to declare optional callbacks:

```dsl
hook onSave(string path) {
  // called when host emits `onSave`
}
```

Hooks always return `void` and are invoked via `runtime.emit(eventName, args)`.

---

## Host Integration

The host application can:

- **Bind custom Dart functions** into the `external` namespace:

  ```dart
  runtime.bind(
    name: 'getUserInfo',
    function: () => fetchCurrentUser(),
    permissions: [ScriptPermission.custom('get_user_info')]
  );
  ```

- **Grant permissions** at runtime:

  ```dart
  runtime.allow(ScriptPermission.readFiles);
  ```

- **Invoke implementations**:

  ```dart
  final value = runtime.run('myFunction', {'arg1': 123});
  ```

- **Emit hooks**:

  ```dart
  runtime.emit('onLogin', {'username': 'bob'});
  ```

This enables strong typed interop and security checks before execution.

---

## Runtime API

- `Parser().parse(SourceCode)` → `Script`
- `Runtime(Script, {List<Implementation> implementations = const [], List<Hook> hooks = const []})` – define static implementations via `Implementation.static(...)` and hooks via `Hook.static(...)` for pre-load static analysis.
- `runtime.allow(permission)` / `runtime.allowAll(..)`
- `runtime.run(name, args)` → `dynamic`
- `runtime.emit(event, args)` → `void`
- `runtime.missingPermissions` → List of ungranted permissions

---

## Error Handling

- **Syntax & parse errors** throw `ParseException` with message and position.
- **Runtime errors** throw `RuntimeException` (e.g., missing permissions, type mismatches).

---

## Contributing

Contributions welcome! Please open issues or pull requests on the [GitHub repository](https://github.com/mcquenji/dscript).

---

## License

This project is licensed under the [MIT License](LICENSE).
