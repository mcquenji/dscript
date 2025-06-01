# Dscript

A lightweight [Domain-Specific Language (DSL)](https://en.wikipedia.org/wiki/Domain-specific_language) for Dart designed to simplify writing and integrating plugins/extensions into Flutter and Dart applications. It offers strong interop between DSL constructs and Dart code, a static permission system, and a contract-based plugin model.

---

# Development

## Prerequisites

- Dart SDK (`fvm use` if using FVM)
- antlr4  [installation instructions](https://github.com/antlr/antlr4/blob/master/doc/getting-started.md)

## Building the ANTLR Grammar

To build the ANTLR grammar, run the following command:

```bash
antlr4 -Dlanguage=Dart dscript.g4 -o lib/src/gen/antlr -Werror -visitor       
```

## Contributing

Contributions welcome! Please open issues or pull requests on the [GitHub repository](https://github.com/mcquenji/dscript).

---

## License

This project is licensed under the [MIT License](LICENSE).
