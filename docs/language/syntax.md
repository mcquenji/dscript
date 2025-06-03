# Language Syntax

Dscript borrows Dart‑like syntax for expressions and control flow. The following elements are currently supported:

## Metadata
```
author "Name";
version 1.0.0;
name "Plugin";
description "One line";
```

`license`, `website` and `repo` are optional.

## Permissions
```
permissions fs::read, fs::write;
permissions external::custom;
```
The names after `external::` come from the host application. Scripts list them to request access to host features. A host may bind one permission to several external functions or require multiple permissions for a single function. These permissions are stored during analysis and enforced when the runtime executes the script.

External functions live under the same namespace:

```dscript
external::doThing();
```

They are declared on the host and are only callable if the script requested every permission specified by that host function.

## Contract Block
A file contains exactly one contract:
```dscript
contract MyContract {
  impl doStuff(int x) -> int {
    return x * 2;
  }

  hook onEvent(string msg) {
    log::info(msg);
  }
}
```
`impl` functions match host signatures exactly. `hook` functions are optional callbacks.

## Variables
`const`, `final` and `var` declarations are available inside functions. Types can be explicit or inferred from the initializer.

## Control Flow
`if`, `while`, `for` and `try/catch` statements work as they do in Dart. `switch` is not yet implemented.

## Types
Primitive types are `int`, `double`, `bool`, `string` and `List`/`Map` variants. Custom structs are defined on the host and referenced by name in scripts.
