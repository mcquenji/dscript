# Binding Host Functions (`external::`)

To let Dscript call arbitrary Dart code, you register **RuntimeBinding** instances under the `external` namespace.  In the contract builder, that looks like:

```dart
contract("MyPlugin")
  // … other impls/hooks …
  .bind<int>("getUserCount", () {
    // This Dart function returns an `int`.
    return database.getUserCount();
  })
  .permission("user::read")           // optional: require this permission
  .describe("Fetch the total number of users in DB")
  .end()
  .build();
````

Now in your `.dscript`:

```dscript
permissions external::user::read;

contract MyPlugin {
  impl countUsers() -> int {
    // call Dart’s `getUserCount()`
    return external::getUserCount();
  }
}
```

---

## 1. Steps in Dart

1. **Create the binding**

   ```dart
   final getUserCountBinding = RuntimeBinding<int>(
     name: "getUserCount",
     function: () {
       return Database.instance.userCount(); 
     },
     positionalParams: [],                  // no inputs
     permission: [ScriptPermission.custom("user::read")], // must match your permission string
     description: "Return the total user count from DB",
   );
   ```

2. **Add it into the `ExternalBindings`**
   If you built your contract with `.bind<…>(…)` above, that binding is already included in `contract.bindings.bindings`.
   Otherwise:

   ```dart
   final external = ExternalBindings();
   external.addBinding(getUserCountBinding);
   final myContract = ContractSignature(
     name: "MyPlugin",
     implementations: [ /* … */ ],
     hooks: [ /* … */ ],
     bindings: external,
     structs: [ /* … */ ],
   );
   ```

3. **Pass the contract into your analyzer**

   ```dart
   final script = analyze(code, [myContract]).getOrThrow();
   ```

4. **Register host bindings at runtime**

   ```dart
   final runtimeEnv = RuntimeEngine(script, initialScope: Scope());
   for (final b in script.contract.bindings.bindings) {
     runtimeEnv.register(b);
   }
   ```

5. **Call your `impl`**

   ```dart
   final resultVal = await runtimeEnv.invoke("countUsers", []);
   final int userCount = resultVal.value as int;
   ```

---

## 2. Permissions for Host Bindings

- If you call `.permission("user::read")` in Dart, your Dscript script **must** declare:

  ```dscript
  permissions external::user::read;
  ```

  - Otherwise you’ll get a static `PermissionError` during analysis.

- The host (Dart) can also enforce additional permissions at runtime if desired.

---

## 3. Named & Positional Parameters

- By default, `RuntimeBinding` only has **positional** parameters:

  ```dart
  .bind<double>("scale", (double x, double factor) {
    return x * factor;
  })
  .param(PrimitiveType.DOUBLE)
  .param(PrimitiveType.DOUBLE)
  .end();
  ```

  → In Dscript:

  ```dscript
  impl scaleValue(double x, double factor) -> double {
    return external::scale(x, factor);
  }
  ```

- To add a **named** parameter, use `.namedParam(...)`:

  ```dart
  .bind<void>("logEvent", (String event, {int level}) {
    Logger.info("$event (level=$level)");
  })
  .param(PrimitiveType.STRING)
  .namedParam("level", PrimitiveType.INT)
  .end();
  ```

  → In Dscript:

  ```dscript
  impl fireEvent() -> void {
    external::logEvent("myEvent", level: 3);
  }
  ```

---

## 4. Structs in Host Bindings

If your Dart function expects a custom struct, you can pass/receive it via a generated wrapper:

```dart
// Suppose you defined Struct("User") already:
.final UserBinding = RuntimeBinding<User>(
  name: "getUserData",
  function: (RuntimeValue userVal) {
    // `userVal.value` is a Map<String, dynamic> representing the DSL struct fields
    final map = userVal.value as Map<String, dynamic>;
    return User(map["name"] as String, map["id"] as int);
  },
  positionalParams: [ Struct(name: "User") ],
  returnType: Struct(name: "User"),
);
```

Then Dscript can do:

```dscript
impl getUser() -> User {
  return external::getUserData(@User { name: "Alice", id: 42 });
}
```

