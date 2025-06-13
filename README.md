# <img src="https://raw.githubusercontent.com/mcquenji/dscript/refs/heads/main/icon.svg" alt="Dscript" width="28"/> Dscript

[![pub package](https://img.shields.io/pub/v/dscript.svg)](https://pub.dev/packages/dscript)

A lightweight [Domain-Specific Language (DSL)](https://en.wikipedia.org/wiki/Domain-specific_language) for Dart designed to simplify writing and integrating plugins/extensions into Flutter and Dart applications. It offers strong interop between DSL constructs and Dart code, a static permission system, and a contract-based plugin model.

---

## Getting Started

Define a script:

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

Register the contract in your host app:

```dart
final demo = contract('Demo')
  .impl('greet', returnType: PrimitiveType.VOID)
  .param('who', PrimitiveType.STRING)
  .describe("Greets someone")
  .end()
  .build();
```

For full documentation see the [docs](https://mcquenji.github.io/dscript).

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for development instructions.

---

## License

This project is licensed under the [MIT License](LICENSE).
