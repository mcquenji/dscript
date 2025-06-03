# Analyzing Scripts

To verify that a script follows your contract use the `analyze` function:

```dart
final result = analyze(
  InputStream.fromString(code),
  [random],
);
```

`result` is a `ResultDart` object. On success it contains a `Script` describing the parsed file. On failure it holds an `AnalysisReport` with details of any errors.
