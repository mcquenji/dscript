# Extending the Standard Library

The standard library is defined as a static function in the `LibraryBinding` class:

```dart
  static StdLib standardLibrary = defaultStdLib;

  typedef StdLib = List<LibraryBinding> Function(ScriptMetadata metadata);
```

You can override the default standard library by setting the `standardLibrary` property to a custom function that returns a List of `LibraryBinding`s. This must be done **before** analyzing, compiling, or running any scripts.

```dart
LibraryBinding.standardLibrary = (metadata) {
  return [
    // your custom library bindings here
  ];
};
```

!> This will replace the entire standard library, so you must include all the libraries you want to use in your scripts. If you want to extend the standard library instead of replacing it, add `LibraryBinding.defaultStdLib` to your custom list:

```dart
LibraryBinding.standardLibrary = (metadata) {
  return [
    ...LibraryBinding.defaultStdLib(metadata),
    // your custom library bindings here
  ];
};
```
