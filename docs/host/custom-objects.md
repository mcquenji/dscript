# Custom Objects (Structs)

Scripts can work with host-defined objects called **structs**. A struct declares
named fields and appears as its own type in the language.

## Defining a Struct

Use the contract builder to describe your objects alongside functions and hooks:

```dart
final auth = contract('Auth')
  .struct('User')
    .field('name', PrimitiveType.STRING)
    .field('id', PrimitiveType.INT)
  .end()
  .impl('login', returnType: PrimitiveType.BOOL)
    .param('user', const Struct.shallow('User'))
  .end()
  .build();
```

The builder creates a `Struct` type with two fields. Implementations or hooks can
reference the struct as parameter or return types.

## Using Structs in Scripts

A script instantiates the object with the `@Type {}` syntax or receives it as a
parameter like any other type. The fields are accessible as properties of the
object.

```dscript
contract Auth {
  impl login(User user) -> bool {
    log::info(user.name);
    return true;
  }
}
```

**Creating a Struct Instance:**

```dscript
contract Auth {
  impl foo() -> User {
    return @User {
        name: "Alice",
        id: 42,
    }
  }
}
```

Structs behave like plain objects. Field names must match those declared by the
host.
