# <img src="https://raw.githubusercontent.com/mcquenji/dscript/refs/heads/main/icon.svg" alt="Dscript" width="28"/> Dscript

[![pub package](https://img.shields.io/pub/v/dscript_dart.svg)](https://pub.dev/packages/dscript_dart)

A lightweight [Domain-Specific Language (DSL)](https://en.wikipedia.org/wiki/Domain-specific_language) for Dart designed to simplify writing and integrating plugins/extensions into Flutter and Dart applications. It offers strong interop between DSL constructs and Dart code, a static permission system, and a contract-based plugin model.

---

## Motivation

For many applications I've built, I wished it was possible for users to extend the app with custom code, such as plugins or scripts. However, during my research I found out that dart does not support dynamic code execution like C# or Java using DLLs or JARs. A different approach would be to have plugins exist as seperate executables and communicate with the main app via grpc, but this would expose the app to severe security risks, as the plugin could do anything it wants once the executable is running.

So I looked at [lua_dardo](https://pub.dev/packages/lua_dardo) and [dart_eval](https://pub.dev/packages/dart_eval) to see if I could use them to run scripts, but they were not suitable for my use case as lua lacked the strong permission system I wanted, and dart_eval seemed to have too much boilerplate for my taste. After long consideration and hesitation, I decided to create my own DSL that would be easy to use, have a strong permission system, and with strong interop with Dart code (it was also a good opportunity to learn about writing parsers and interpreters).

## Getting Started

The documentation can be found [here](https://mcquenji.github.io/dscript).

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for development instructions.

---

## License

This project is licensed under the [MIT License](LICENSE).
