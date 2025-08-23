# custom_lints

Internal lint rules for Dscript core development to enforce project-specific coding constraints.

Currently includes:

- **`no_type_to_string`** — bans calling `.toString()` on a `Type` (including `runtimeType.toString()`), which breaks in web builds due to Dart’s minified type names.
