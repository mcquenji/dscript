# Middlewares

You can plug middlewares into any `RuntimeBinding` to extend its behavior (e.g. for logging, validation or transforming data). Middlewares run in the order you add them, passing along any changes until finally invoking the bound function and returning to the caller.

```mermaid
flowchart-elk LR
  A[Pre Middlewares] -->|Modified args| B[Bound Function]
  B -->|Result| C[Post Middlewares]
  C -->|Modified result| D[Caller]
```

## Pre Middlewares

Runs *before* the bound function. Use these to tweak or validate inputs. If one throws, the binding stops and the error bubbles up.

```dart
// Example: log reads and block secret files
FsBindings.readFileBinding.addPreMiddleware(({
  required binding,
  required positionalArgs,
  required namedArgs,
}) {
  final path = positionalArgs[0] as String;
  print('Reading file $path');

  if (path == 'secret-file.txt') {
    throw Exception('This file is not allowed to be read!');
  }

  positionalArgs[0] = path.replaceAll('secret', 'public');
});
```

## Post Middlewares

Runs *after* the bound function. Use these to inspect or transform outputs before sending them back.

```dart
// Example: redact secret files in the response
FsBindings.readFileBinding.addPostMiddleware(({
  required binding,
  required positionalArgs,
  required namedArgs,
  required result,
}) {
  final path = positionalArgs[0] as String;
  if (path == 'secret-file.txt') {
    return '[Redacted]';
  }
  return result;
});
```
