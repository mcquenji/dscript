# External Functions and Permissions

Hosts may expose their own functions to scripts. These are called **external functions** and live under the `external::` namespace. A host chooses any name for the permission required to call a function and may reuse the same permission for multiple functions. Conversely a single function can demand several permissions.

## Declaring Permissions

Scripts request access using the `permissions` declaration:

```dscript
permissions external::storage, external::network;
```

The names after `external::` are defined by the host, not by the language. At analysis time the declarations are recorded but only enforced once a runtime exists.

## Binding Functions

When registering an external function the host maps a permission to one or more Dart callbacks. The permission name does not need to match the function name:

```dart
final contract = contract('foo')
  .bind<void>('uploadFile', (String path) async {// do something} )
  .param(PrimitiveType.STRING)
  .describe(
    "Uploads a file to the user's cloud storage",
  )
  .permission('storage')
  .permission('network')
  .end();
```

Here the `uploadFile` function requires both `storage` and `network` permissions. Another function could reuse either permission or introduce new ones.

Scripts call the function like any other:

```dscript
external::uploadFile(path);
```

During execution the runtime checks that the script declared all required permissions before the host function runs.
