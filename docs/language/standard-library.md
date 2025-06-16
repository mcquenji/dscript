# Standard Library


- [math](#math)
- [string](#string)
- [fs](#fs)
- [list](#list)
- [map](#map)
- [dynamic](#dynamic)
- [log](#log)
---

## Globals

The following globals are available in the dscript runtime. They are not part of any library.
- `pi`: double *(3.141592653589793)*
- `e`: double *(2.718281828459045)*
- `sqrt2`: double *(1.4142135623730951)*
- `sqrt1_2`: double *(0.7071067811865476)*
- `log2e`: double *(1.4426950408889634)*
- `log10e`: double *(0.4342944819032518)*
- `ln2`: double *(0.6931471805599453)*
- `ln10`: double *(2.302585092994046)*


---

## math

Library for mathematical functions.

### sqrt &rarr; `double`

| Name | Type | Kind |
| --- | --- | --- |
| x | `double` | Positional (1) |

<em>Converts <code>x</code> to a <code>double</code> and returns the positive square root of the value</em>


### pow &rarr; `double`

| Name | Type | Kind |
| --- | --- | --- |
| x | `double` | Positional (1) |
| y | `double` | Positional (2) |
<details>
<summary><em>Returns <code>x</code> to the power of <code>exponent</code>.</em></summary>
<em>If <code>x</code> is an <code>int</code> and <code>exponent</code> is a non-negative <code>int</code>, the result is an <code>int</code>, otherwise both arguments are converted to doubles first, and the result is a <code>double</code>.

For integers, the power is always equal to the mathematical result of x to the power exponent, only limited by the available memory.

For doubles, pow(x, y) handles edge cases as follows:

if y is zero (0.0 or -0.0), the result is always 1.0.
if x is 1.0, the result is always 1.0.
otherwise, if either x or y is NaN, then the result is NaN.
if x is negative (but not -0.0) and y is a finite non-integer, the result is NaN.
if x is Infinity and y is negative, the result is 0.0.
if x is Infinity and y is positive, the result is Infinity.
if x is 0.0 and y is negative, the result is Infinity.
if x is 0.0 and y is positive, the result is 0.0.
if x is -Infinity or -0.0 and y is an odd integer, then the result is -pow(-x ,y).
if x is -Infinity or -0.0 and y is not an odd integer, then the result is the same as pow(-x , y).
if y is Infinity and the absolute value of x is less than 1, the result is 0.0.
if y is Infinity and x is -1, the result is 1.0.
if y is Infinity and the absolute value of x is greater than 1, the result is Infinity.
if y is -Infinity, the result is 1/pow(x, Infinity).
This corresponds to the pow function defined in the IEEE Standard 754-2008.

Notice that the result may overflow. If integers are represented as 64-bit numbers, an integer result may be truncated, and a double result may overflow to positive or negative <code>infinity</code>.</em>
</details>
<br>


### log &rarr; `double`

| Name | Type | Kind |
| --- | --- | --- |
| x | `double` | Positional (1) |

<em>Converts <code>x</code> to a <code>double</code> and returns the natural logarithm of the value.</em>


### exp &rarr; `double`

| Name | Type | Kind |
| --- | --- | --- |
| x | `double` | Positional (1) |

<em>Converts <code>x</code> to a <code>double</code> and returns the natural exponent, <code>e</code>, to the power <code>x</code>.</em>


### sin &rarr; `double`

| Name | Type | Kind |
| --- | --- | --- |
| x | `double` | Positional (1) |

<em>Converts <code>x</code> to a <code>double</code> and returns the sine of the value.</em>


### cos &rarr; `double`

| Name | Type | Kind |
| --- | --- | --- |
| x | `double` | Positional (1) |

<em>Converts <code>x</code> to a <code>double</code> and returns the cosine of the value.</em>


### tan &rarr; `double`

| Name | Type | Kind |
| --- | --- | --- |
| x | `double` | Positional (1) |
<details>
<summary><em>Converts <code>x</code> to a <code>double</code> and returns the tangent of the value.</em></summary>
<em>The tangent function is equivalent to sin(x)/cos(x)</em>
</details>
<br>


### asin &rarr; `double`

| Name | Type | Kind |
| --- | --- | --- |
| x | `double` | Positional (1) |

<em>Converts <code>x</code> to a <code>double</code> and returns its arc sine in radians.</em>


### acos &rarr; `double`

| Name | Type | Kind |
| --- | --- | --- |
| x | `double` | Positional (1) |

<em>Converts <code>x</code> to a <code>double</code> and returns its arc cosine in radians.</em>


### atan &rarr; `double`

| Name | Type | Kind |
| --- | --- | --- |
| x | `double` | Positional (1) |

<em>Converts <code>x</code> to a <code>double</code> and returns its arc tangent in radians.</em>


### atan2 &rarr; `double`

| Name | Type | Kind |
| --- | --- | --- |
| x | `double` | Positional (1) |
| y | `double` | Positional (2) |
<details>
<summary><em>A variant of <code>atan</code>.</em></summary>
<em>Converts both arguments to <code>double</code>s.

Returns the angle in radians between the positive x-axis and the vector (<code>b</code>,<code>a</code>). The result is in the range -PI..PI.

If <code>b</code> is positive, this is the same as atan(a/b).

The result is negative when <code>a</code> is negative (including when <code>a</code> is the double -0.0).

If <code>a</code> is equal to zero, the vector (<code>b</code>,<code>a</code>) is considered parallel to the x-axis, even if <code>b</code> is also equal to zero. The sign of <code>b</code> determines the direction of the vector along the x-axis.</em>
</details>
<br>


### abs &rarr; `double`

| Name | Type | Kind |
| --- | --- | --- |
| x | `double` | Positional (1) |

<em>Returns the absolute value of <code>x</code>.</em>


### floor &rarr; `int`

| Name | Type | Kind |
| --- | --- | --- |
| x | `double` | Positional (1) |

<em>Returns the largest integer less than or equal to <code>x</code>.</em>


### ceil &rarr; `int`

| Name | Type | Kind |
| --- | --- | --- |
| x | `double` | Positional (1) |

<em>Returns the smallest integer greater than or equal to <code>x</code>.</em>


### round &rarr; `int`

| Name | Type | Kind |
| --- | --- | --- |
| x | `double` | Positional (1) |

<em>Rounds <code>x</code> number to the nearest integer.</em>


### clamp &rarr; `double`

| Name | Type | Kind |
| --- | --- | --- |
| x | `double` | Positional (1) |
| min | `double` | Named |
| max | `double` | Named |

<em>Clamps <code>x</code> number between a <code>min</code> and <code>max</code> value.</em>


### min &rarr; `double`

| Name | Type | Kind |
| --- | --- | --- |
| a | `double` | Positional (1) |
| b | `double` | Positional (2) |

<em>Returns the minimum of <code>a</code> and <code>b</code>.</em>


### max &rarr; `double`

| Name | Type | Kind |
| --- | --- | --- |
| a | `double` | Positional (1) |
| b | `double` | Positional (2) |

<em>Returns the maximum of <code>a</code> and <code>b</code>.</em>


### rad &rarr; `double`

| Name | Type | Kind |
| --- | --- | --- |
| degrees | `double` | Positional (1) |

<em>Converts <code>degrees</code> to radians.</em>


### deg &rarr; `double`

| Name | Type | Kind |
| --- | --- | --- |
| radians | `double` | Positional (1) |

<em>Converts <code>radians</code> to degrees.</em>




---

## string

Library for working with strings.

### length &rarr; `int`

| Name | Type | Kind |
| --- | --- | --- |
| str | `string` | Positional (1) |

<em>Returns the length of <code>str</code>.</em>


### substring &rarr; `string`

| Name | Type | Kind |
| --- | --- | --- |
| str | `string` | Positional (1) |
| start | `int` | Positional (2) |
| end | `int?` | Named |
<details>
<summary><em>The substring of <code>str</code> from <code>start</code>, inclusive, to <code>end</code>, exclusive. </em></summary>
<em>Both <code>start</code> and <code>end</code> must be non-negative and no greater than the string's length; <code>end</code>, if provided, must be greater than or equal to <code>start</code>.
        If <code>end</code> is omitted, the substring extends to the end of the string.</em>
</details>
<br>


### upper &rarr; `string`

| Name | Type | Kind |
| --- | --- | --- |
| str | `string` | Positional (1) |

<em>Converts <code>str</code> to uppercase.</em>


### lower &rarr; `string`

| Name | Type | Kind |
| --- | --- | --- |
| str | `string` | Positional (1) |

<em>Converts <code>str</code> to lowercase.</em>


### trim &rarr; `string`

| Name | Type | Kind |
| --- | --- | --- |
| str | `string` | Positional (1) |

<em>Removes leading and trailing whitespace from <code>str</code> and returns the resulting string.</em>


### split &rarr; `List<string>`

| Name | Type | Kind |
| --- | --- | --- |
| str | `string` | Positional (1) |
| pattern | `string` | Positional (2) |

<em>Splits <code>str</code> into a list of substrings using <code>pattern</code> as the delimiter.</em>


### replaceAll &rarr; `string`

| Name | Type | Kind |
| --- | --- | --- |
| str | `string` | Positional (1) |
| from | `string` | Positional (2) |
| to | `string` | Positional (3) |

<em>Replaces all occurrences of <code>from</code> with <code>to</code> in <code>str</code>.</em>


### contains &rarr; `bool`

| Name | Type | Kind |
| --- | --- | --- |
| str | `string` | Positional (1) |
| pattern | `string` | Positional (2) |

<em>Returns true if <code>str</code> contains <code>pattern</code>. False otherwise.</em>


### startsWith &rarr; `bool`

| Name | Type | Kind |
| --- | --- | --- |
| str | `string` | Positional (1) |
| pattern | `string` | Positional (2) |

<em>Returns true if <code>str</code> starts with <code>pattern</code>. False otherwise.</em>


### endsWith &rarr; `bool`

| Name | Type | Kind |
| --- | --- | --- |
| str | `string` | Positional (1) |
| pattern | `string` | Positional (2) |

<em>Returns true if <code>str</code> ends with <code>pattern</code>. False otherwise.</em>


### indexOf &rarr; `int`

| Name | Type | Kind |
| --- | --- | --- |
| str | `string` | Positional (1) |
| pattern | `string` | Positional (2) |

<em>Returns the index of the first occurrence of <code>pattern</code> in <code>str</code>.</em>


### lastIndexOf &rarr; `int`

| Name | Type | Kind |
| --- | --- | --- |
| str | `string` | Positional (1) |
| pattern | `string` | Positional (2) |

<em>Returns the index of the last occurrence of <code>pattern</code> in <code>str</code>.</em>


### replaceFirst &rarr; `string`

| Name | Type | Kind |
| --- | --- | --- |
| str | `string` | Positional (1) |
| from | `string` | Positional (2) |
| to | `string` | Positional (3) |

<em>Replaces the first occurrence of <code>from</code> with <code>to</code> in <code>str</code>.</em>


### from &rarr; `string`

| Name | Type | Kind |
| --- | --- | --- |
| obj | `dynamic?` | Positional (1) |

<em>String representation of <code>obj</code>. If <code>obj</code> is a string, it is returned unchanged; otherwise, it is stringfied.</em>


### fromCharCode &rarr; `string`

| Name | Type | Kind |
| --- | --- | --- |
| code | `int` | Positional (1) |

<em>Creates a string from a single character code <code>code</code>.</em>


### from &rarr; `string`

| Name | Type | Kind |
| --- | --- | --- |
| codes | `List<int>` | Positional (1) |

<em>Creates a string from a list of character codes <code>codes</code>.</em>




---

## fs

Library for interacting with the file system.

### read &rarr; `string`

| Name | Type | Kind |
| --- | --- | --- |
| path | `string` | Positional (1) |

<em>Reads the contents of a file at the given path as a string.</em>

#### Permissions

`fs::read`


### write &rarr; `void`

| Name | Type | Kind |
| --- | --- | --- |
| append | `bool?` | Named |
| path | `string` | Named |
| content | `string` | Named |

<em>Writes a string to a file at the given <code>path</code>. If <code>append</code> is true, it appends to the file; otherwise, it overwrites the file. The file is created if it does not exist.</em>

#### Permissions

`fs::write`


### delete &rarr; `void`

| Name | Type | Kind |
| --- | --- | --- |
| path | `string` | Positional (1) |

<em>Deletes a file at the given <code>path</code>.</em>

#### Permissions

`fs::write`


### exists &rarr; `bool`

| Name | Type | Kind |
| --- | --- | --- |
| path | `string` | Positional (1) |

<em>Checks if a file exists at the given <code>path</code>.</em>

#### Permissions

`fs::read`


### ls &rarr; `List<string>`

| Name | Type | Kind |
| --- | --- | --- |
| path | `string` | Positional (1) |

<em>Lists the contents of a directory at the given <code>path</code>. Returns a list of file paths.</em>

#### Permissions

`fs::read`


### mkdir &rarr; `void`

| Name | Type | Kind |
| --- | --- | --- |
| path | `string` | Positional (1) |

<em>Creates a directory at the given <code>path</code>. If the directory already exists, it does nothing.</em>

#### Permissions

`fs::write`


### isDir &rarr; `bool`

| Name | Type | Kind |
| --- | --- | --- |
| path | `string` | Positional (1) |

<em>Checks if the path is a directory.</em>

#### Permissions

`fs::read`


### isFile &rarr; `bool`

| Name | Type | Kind |
| --- | --- | --- |
| path | `string` | Positional (1) |

<em>Checks if the path is a file.</em>

#### Permissions

`fs::read`


### absolute &rarr; `string`

| Name | Type | Kind |
| --- | --- | --- |
| path | `string` | Positional (1) |

<em>Gets the absolute path of a file or directory at the given <code>path</code>.</em>

#### Permissions

`fs::read`


### cwd &rarr; `string`

<em>Returns the current working directory.</em>

#### Permissions

`fs::read`


### move &rarr; `void`

| Name | Type | Kind |
| --- | --- | --- |
| from | `string` | Named |
| to | `string` | Named |

<em>Moves a file or directory from <code>from</code> to <code>to</code>.</em>

#### Permissions

`fs::write`, `fs::read`


### copy &rarr; `void`

| Name | Type | Kind |
| --- | --- | --- |
| from | `string` | Named |
| to | `string` | Named |

<em>Copies a file or directory from <code>from</code> to <code>to</code>.</em>

#### Permissions

`fs::write`, `fs::read`


### size &rarr; `int`

| Name | Type | Kind |
| --- | --- | --- |
| path | `string` | Positional (1) |

<em>Gets the size of a file at the given <code>path</code> in bytes.</em>

#### Permissions

`fs::read`


### extension &rarr; `string`

| Name | Type | Kind |
| --- | --- | --- |
| path | `string` | Positional (1) |

<em>Gets the file extension of the given <code>path</code>. Returns an empty string if no extension is found.</em>


### basename &rarr; `string`

| Name | Type | Kind |
| --- | --- | --- |
| path | `string` | Positional (1) |

<em>Gets the base name of the given <code>path</code>.</em>


### dirname &rarr; `string`

| Name | Type | Kind |
| --- | --- | --- |
| path | `string` | Positional (1) |
<details>
<summary><em>The parent path of a path.</em></summary>
<em>Finds the final path component of a path, using the platform's path separator to split the path, and returns the prefix up to that part.

Will not remove the root component of a Windows path, like "C:\" or "\\server_name\". Includes a trailing path separator in the last part of <code>path</code>, and leaves no trailing path separator.</em>
</details>
<br>




---

## list

Library for working with lists.

### length &rarr; `int`

| Name | Type | Kind |
| --- | --- | --- |
| list | `List<dynamic?>` | Positional (1) |

<em>Returns the number of elements in the list.</em>


### isEmpty &rarr; `bool`

| Name | Type | Kind |
| --- | --- | --- |
| list | `List<dynamic?>` | Positional (1) |

<em>Returns true if the list is empty.</em>


### isNotEmpty &rarr; `bool`

| Name | Type | Kind |
| --- | --- | --- |
| list | `List<dynamic?>` | Positional (1) |

<em>Returns true if the list is not empty.</em>


### add &rarr; `void`

| Name | Type | Kind |
| --- | --- | --- |
| list | `List<dynamic?>` | Positional (1) |

<em>Adds <code>element</code> to the end of the <code>list</code>.</em>


### addAll &rarr; `void`

| Name | Type | Kind |
| --- | --- | --- |
| list | `List<dynamic?>` | Positional (1) |
| elements | `List<dynamic?>` | Positional (2) |

<em>Adds all <code>elements</code> to the end of the <code>list</code>.</em>


### clear &rarr; `void`

| Name | Type | Kind |
| --- | --- | --- |
| list | `List<dynamic?>` | Positional (1) |

<em>Removes all elements from the list.</em>


### remove &rarr; `bool`

| Name | Type | Kind |
| --- | --- | --- |
| list | `List<dynamic?>` | Positional (1) |

<em>Removes the first occurrence of <code>element</code> from the list.</em>


### removeAt &rarr; `dynamic`

| Name | Type | Kind |
| --- | --- | --- |
| list | `List<dynamic?>` | Positional (1) |
| index | `int` | Positional (2) |

<em>Removes and returns the element at <code>index</code> from the list.</em>


### removeLast &rarr; `dynamic`

| Name | Type | Kind |
| --- | --- | --- |
| list | `List<dynamic?>` | Positional (1) |

<em>Removes and returns the last element from the list.</em>


### insert &rarr; `void`

| Name | Type | Kind |
| --- | --- | --- |
| list | `List<dynamic?>` | Positional (1) |
| index | `int` | Positional (2) |
| element | `dynamic?` | Positional (3) |

<em>Inserts <code>element</code> at <code>index</code> in the list.</em>


### insertAll &rarr; `void`

| Name | Type | Kind |
| --- | --- | --- |
| list | `List<dynamic?>` | Positional (1) |
| index | `int` | Positional (2) |
| elements | `List<dynamic?>` | Positional (3) |

<em>Inserts all <code>elements</code> at <code>index</code> in the list.</em>


### indexOf &rarr; `int`

| Name | Type | Kind |
| --- | --- | --- |
| list | `List<dynamic?>` | Positional (1) |
| element | `dynamic?` | Positional (2) |
| start | `int?` | Named |

<em>Returns the index of the first occurrence of <code>element</code> in the list, starting from <code>start</code>.</em>


### lastIndexOf &rarr; `int`

| Name | Type | Kind |
| --- | --- | --- |
| list | `List<dynamic?>` | Positional (1) |
| element | `dynamic?` | Positional (2) |
| start | `int?` | Named |

<em>Returns the index of the last occurrence of <code>element</code> in the list, starting from <code>start</code>.</em>


### contains &rarr; `bool`

| Name | Type | Kind |
| --- | --- | --- |
| list | `List<dynamic?>` | Positional (1) |
| element | `dynamic?` | Positional (2) |

<em>Returns true if the list contains <code>element</code>.</em>




---

## map

Library for working with maps.

### length &rarr; `int`

| Name | Type | Kind |
| --- | --- | --- |
| map | `Map<dynamic?, dynamic?>` | Positional (1) |

<em>Returns the number of key-value pairs in the map.</em>


### isEmpty &rarr; `bool`

| Name | Type | Kind |
| --- | --- | --- |
| map | `Map<dynamic?, dynamic?>` | Positional (1) |

<em>Returns true if the map is empty.</em>


### isNotEmpty &rarr; `bool`

| Name | Type | Kind |
| --- | --- | --- |
| map | `Map<dynamic?, dynamic?>` | Positional (1) |

<em>Returns true if the map is not empty.</em>


### containsKey &rarr; `bool`

| Name | Type | Kind |
| --- | --- | --- |
| map | `Map<dynamic?, dynamic?>` | Positional (1) |
| key | `dynamic?` | Positional (2) |

<em>Returns true if the map contains the specified <code>key</code>.</em>


### containsValue &rarr; `bool`

| Name | Type | Kind |
| --- | --- | --- |
| map | `Map<dynamic?, dynamic?>` | Positional (1) |
| value | `dynamic?` | Positional (2) |

<em>Returns true if the map contains the specified <code>value</code>.</em>


### keys &rarr; `List<dynamic>`

| Name | Type | Kind |
| --- | --- | --- |
| map | `Map<dynamic?, dynamic?>` | Positional (1) |

<em>Returns a list of all keys in the map.</em>


### values &rarr; `List<dynamic>`

| Name | Type | Kind |
| --- | --- | --- |
| map | `Map<dynamic?, dynamic?>` | Positional (1) |

<em>Returns a list of all values in the map.</em>


### addAll &rarr; `void`

| Name | Type | Kind |
| --- | --- | --- |
| map | `Map<dynamic?, dynamic?>` | Positional (1) |
| other | `Map<dynamic?, dynamic?>` | Positional (2) |

<em>Adds all key-value pairs from <code>other</code> to the map.</em>


### clear &rarr; `void`

| Name | Type | Kind |
| --- | --- | --- |
| map | `Map<dynamic?, dynamic?>` | Positional (1) |

<em>Removes all key-value pairs from the map.</em>


### remove &rarr; `dynamic`

| Name | Type | Kind |
| --- | --- | --- |
| map | `Map<dynamic?, dynamic?>` | Positional (1) |
| key | `dynamic?` | Positional (2) |

<em>Removes the key-value pair for the specified <code>key</code> from the map.</em>


### keyOf &rarr; `dynamic`

| Name | Type | Kind |
| --- | --- | --- |
| map | `Map<dynamic?, dynamic?>` | Positional (1) |
| value | `dynamic?` | Positional (2) |

<em>Returns the key associated with the specified <code>value</code>.</em>




---

## dynamic

Various utilities for dynamic values.

### toString &rarr; `string`

| Name | Type | Kind |
| --- | --- | --- |
| value | `dynamic?` | Positional (1) |

<em>Converts <code>value</code> to a string.</em>


### toInt &rarr; `int`

| Name | Type | Kind |
| --- | --- | --- |
| value | `dynamic?` | Positional (1) |

<em>Converts <code>value</code> to an int.</em>


### toDouble &rarr; `double`

| Name | Type | Kind |
| --- | --- | --- |
| value | `dynamic?` | Positional (1) |

<em>Converts <code>value</code> to a double.</em>


### toBool &rarr; `bool`

| Name | Type | Kind |
| --- | --- | --- |
| value | `dynamic?` | Positional (1) |

<em>Converts <code>value</code> to a bool.</em>


### length &rarr; `int`

| Name | Type | Kind |
| --- | --- | --- |
| value | `dynamic?` | Positional (1) |

<em>Returns the length of <code>value</code> if it is a collection or string, otherwise throws.</em>


### type &rarr; `string`

| Name | Type | Kind |
| --- | --- | --- |
| value | `dynamic?` | Positional (1) |

<em>Returns the type of <code>value</code> as a string.</em>




---

## log

Logging utilities.

### info &rarr; `void`

| Name | Type | Kind |
| --- | --- | --- |
| message | `dynamic?` | Positional (1) |
| error | `dynamic?` | Named |

<em>Logs an info message.</em>


### warning &rarr; `void`

| Name | Type | Kind |
| --- | --- | --- |
| message | `dynamic?` | Positional (1) |
| error | `dynamic?` | Named |

<em>Logs a warning message.</em>


### error &rarr; `void`

| Name | Type | Kind |
| --- | --- | --- |
| message | `dynamic?` | Positional (1) |
| error | `dynamic?` | Named |

<em>Logs an error message.</em>


### debug &rarr; `void`

| Name | Type | Kind |
| --- | --- | --- |
| message | `dynamic?` | Positional (1) |
| error | `dynamic?` | Named |

<em>Logs a debug message.</em>


### verbose &rarr; `void`

| Name | Type | Kind |
| --- | --- | --- |
| message | `dynamic?` | Positional (1) |
| error | `dynamic?` | Named |

<em>Logs a verbose message.</em>


### fatal &rarr; `void`

| Name | Type | Kind |
| --- | --- | --- |
| message | `dynamic?` | Positional (1) |
| error | `dynamic?` | Named |

<em>Logs a fatal message.</em>


### critical &rarr; `void`

| Name | Type | Kind |
| --- | --- | --- |
| message | `dynamic?` | Positional (1) |
| error | `dynamic?` | Named |

<em>Logs a critical message.</em>



