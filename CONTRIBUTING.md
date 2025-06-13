# Contributing to Dscript

Thank you for your interest in contributing!

## Development Setup

### Prerequisites

- Dart SDK (`fvm use` if using FVM)
- [ANTLR4](https://github.com/antlr/antlr4/blob/master/doc/getting-started.md)

### Building the ANTLR Grammar

Run the following command after modifying `dscript.g4`:

```bash
antlr4 -Dlanguage=Dart dscript.g4 -o lib/src/gen/antlr -Werror -visitor
```

### Running Tests

All contributions should include tests. Run the full suite with:

```bash
dart test
```

## Committing Changes

When committing changes, please follow [conventional commit standards](https://www.conventionalcommits.org/en/v1.0.0/).
