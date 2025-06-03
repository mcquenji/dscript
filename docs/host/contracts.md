# Defining Contracts

A contract lists the functions and hooks a script must implement. Use the provided builders to describe these elements in Dart:

```dart
final random = contract('Random')
  .impl('number', returnType: PrimitiveType.DOUBLE)
    .param('seed', PrimitiveType.INT)
  .end()
  .hook('onReady')
    .param('user', PrimitiveType.STRING)
  .end()
  .build();
```

The builder API creates a `ContractSignature` object which is later passed to the analyzer.
