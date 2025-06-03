# Dscript Standard Library

Dscript’s built-in functions live under several namespaces.  The host automatically provides:

- **`math::…`**
- **`string::…`**
- **`list::…`**
- **`map::…`**
- **`log::…`**
- **`fs::…`**  (read/write)
- **`http::…`** (client/server)
- plus any additional host bindings under `external::…`

Below is a brief overview of each:

## 1. `math::` namespace

| Function         | Signature                 | Description                                          |
|------------------|---------------------------|------------------------------------------------------|
| `sqrt(num x)`    | `double` → `double`       | Square root                                          |
| `pow(num a, num b)` | `(double, double) -> double` | Exponentiation                                        |
| `log(num x)`     | `double` → `double`       | Natural logarithm                                    |
| `exp(num x)`     | `double` → `double`       | e<sup>x</sup>                                         |
| `sin(num x)`     | `double` → `double`       | Sine (radians)                                       |
| `cos(num x)`     | `double` → `double`       | Cosine (radians)                                     |
| `tan(num x)`     | `double` → `double`       | Tangent (radians)                                    |
| `asin(num x)`    | `double` → `double`       | Arcsine                                              |
| `acos(num x)`    | `double` → `double`       | Arccosine                                            |
| `atan(num x)`    | `double` → `double`       | Arctangent                                           |
| `atan2(num y, num x)` | `(double, double) -> double` | Atan2 (angle of vector)                              |
| `abs(num x)`     | `num` → `num`            | Absolute value                                       |
| `floor(num x)`   | `num` → `int`            | Largest integer ≤ x                                  |
| `ceil(num x)`    | `num` → `int`            | Smallest integer ≥ x                                 |
| `round(num x)`   | `num` → `int`            | Rounds to nearest integer                            |
| `min(num a, num b)` | `(num, num) -> num`     | Minimum of two values                                |
| `max(num a, num b)` | `(num, num) -> num`     | Maximum of two values                                |
| `clamp(num x, num min, num max)` | `(num, num, num) -> num` | Clamps x to the range [min, max]                      |
| `rad(num deg)`   | `num` → `double`        | Degrees → Radians                                     |
| `deg(num rad)`   | `num` → `double`        | Radians → Degrees                                     |

> **Note**: All functions implicitly convert `int` → `double` when necessary.  E.g. `math::floor(3.2)` returns `3` (an `int`), but `math::pow(2, 3.5)` → `11.313708…` (`double`).

## 2. `string::` namespace

| Function               | Signature                | Description                              |
|------------------------|--------------------------|------------------------------------------|
| `from(num x)`          | `num` → `string`         | Converts numeric → string                |
| `concat(string, string)` | `(string, string) -> string` | Concatenate two strings                   |
| `length(string s)`     | `string` → `int`        | Returns string length                    |
| `substring(string s, int start, int end?)` | `(string, int, int?) -> string` | Extract substring (end optional)          |
| `toUpper(string s)`    | `string` → `string`     | Uppercase                                 |
| `toLower(string s)`    | `string` → `string`     | Lowercase                                 |
| `split(string s, string sep)` | `(string, string) -> List<string>` | Split by separator                        |
| `replace(string s, string from, string to)` | `(string, string, string) -> string` | Replace all occurrences                   |

## 3. `list::` namespace

| Function             | Signature                   | Description                               |
|----------------------|-----------------------------|-------------------------------------------|
| `length(List<T> lst)` | `List<*>` → `int`          | Number of elements                        |
| `push(List<T> lst, T x)` | `(List<*>, *) -> void`    | Append to list                            |
| `pop(List<T> lst)`   | `List<*>` → `*`             | Remove & return last element              |
| `get(List<T> lst, int i)` | `(List<*>, int) -> *`      | Indexed access (`list[0]` equivalent)     |
| `slice(List<T> lst, int start, int end?)` | `(List<*>, int, int?) -> List<*>` | Sublist                                       |

## 4. `map::` namespace

| Function            | Signature                     | Description                              |
|---------------------|-------------------------------|------------------------------------------|
| `length(Map<K,V> m)` | `Map<*,*>` → `int`          | Number of entries                        |
| `get(Map<K,V> m, K key)` | `(Map<*,*>, *) -> *`      | Value for key (null if missing)          |
| `put(Map<K,V> m, K key, V value)` | `(Map<*,*>, *, *) -> void` | Insert/update entry                       |
| `remove(Map<K,V> m, K key)` | `(Map<*,*>, *) -> void`   | Remove entry                             |
| `keys(Map<K,V> m)`  | `Map<*,*>` → `List<*>`       | List of keys                             |
| `values(Map<K,V> m)` | `Map<*,*>` → `List<*>`      | List of values                           |

## 5. `log::` namespace

| Function                | Signature                                | Description                                      |
|-------------------------|------------------------------------------|--------------------------------------------------|
| `info(string msg)`      | `string` → `void`                        | Log at INFO level                                |
| `warning(string msg)`   | `string` → `void`                        | Log at WARNING level                             |
| `error(string msg, {error})` | `string, {dynamic error} -> void`      | Log at ERROR level, optional stacktrace/object    |
| `debug(string msg)`     | `string` → `void`                        | Log at DEBUG level                               |
| `verbose(string msg)`   | `string` → `void`                        | Log at VERBOSE level                             |
| `fatal(string msg)`     | `string` → `void`                        | Log at FATAL level                               |
| `critical(string msg)`  | `string` → `void`                        | Log at CRITICAL level                            |

## 6. `fs::` namespace (filesystem)

> **Requires** `permissions fs::read` and/or `fs::write`.

| Function                  | Signature                   | Description                            |
|---------------------------|-----------------------------|----------------------------------------|
| `read(string path)`       | `string` → `string`         | Read entire file contents as string    |
| `write(string path, string data)` | `(string, string) -> void` | Overwrite file                         |
| `append(string path, string data)` | `(string, string) -> void` | Append to file                          |
| `exists(string path)`     | `string` → `bool`           | Whether file exists                     |
| `delete(string path)`     | `string` → `void`           | Delete file                              |

!> This functionality is not yet implemented in the standard library, but is planned for future releases.

## 7. `http::` namespace (network)

> **Requires** `permissions http::client` or `http::server`.

| Function                   | Signature                     | Description                                 |
|----------------------------|-------------------------------|---------------------------------------------|
| `get(string url)`          | `string` → `string`          | Perform HTTP GET, return response body      |
| `post(string url, string body)` | `(string, string) -> string` | HTTP POST, return response body             |
| `listen(int port, (req) -> void)` | `(int, Function) -> void`    | Start HTTP server, callback for each request  |
| `stop()`                   | `() -> void`                 | Stop HTTP server                             |

!> This functionality is not yet implemented in the standard library, but is planned for future releases.

## 8. `external::` namespace

Any host-provided bindings show up here.  For example, if your Dart host defines:

```dart
bindingBuilder
  .bind<int>("getUserCount", () => fetchUserCountFromDb())
  .permission("user::read")
  .end();
````

then you’d call it in Dscript as:

```dscript
permissions external::user::read;

contract MyPlugin {
  impl countUsers() -> int {
    return external::getUserCount();
  }
}
```
