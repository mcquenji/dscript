# Getting Started

Each script begins with metadata followed by a single `contract` block. A minimal file looks like this:

```dscript
author "You";
version 0.1.0;
name "Example";
description "demo";

contract Demo {
  impl greet(string who) -> void {
    log::info("Hello " + who);
  }
}
```

The analyzer checks that the script implements a contract known to the host. The example above expects the host to provide a contract named `Demo` with an implementation called `greet`.
