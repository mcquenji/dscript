import 'dart:math';

import 'package:dscript/src/runtime/exceptions.dart';
import 'package:dscript/src/runtime/values.dart';
import 'package:meta/meta.dart';

/// Represents a variable in the runtime environment.
///
/// Holds a [value] of type [RuntimeValue], and indicates whether the variable
/// is [mutable] (can be changed) or [nullable] (can hold null values).
class RuntimeVariable {
  /// The runtime value of the variable.
  RuntimeValue value;

  /// Indicates if the variable can be modified.
  final bool mutable;

  /// Indicates if the variable can hold null values.
  final bool nullable;

  /// Represents a variable in the runtime environment.
  ///
  /// Holds a [value] of type [RuntimeValue], and indicates whether the variable
  /// is [mutable] (can be changed) or [nullable] (can hold null values).
  @internal
  RuntimeVariable(this.value, {this.mutable = true, this.nullable = false});
}

/// Represents an execution environment with scoped variables and built-in constants.
///
/// Supports nested scopes for function calls and provides lookups for variables,
/// falling back to parent scopes when a name is not found.
class Scope {
  /// Map storing variable names to their corresponding runtime values.
  @internal
  final Map<String, RuntimeVariable> variables = {
    'pi': RuntimeVariable(const RuntimeValue(pi), mutable: false),
    'e': RuntimeVariable(const RuntimeValue(e), mutable: false),
    'sqrt2': RuntimeVariable(const RuntimeValue(sqrt2), mutable: false),
    'sqrt1_2': RuntimeVariable(const RuntimeValue(sqrt1_2), mutable: false),
    'log2e': RuntimeVariable(const RuntimeValue(log2e), mutable: false),
    'log10e': RuntimeVariable(const RuntimeValue(log10e), mutable: false),
    'ln2': RuntimeVariable(const RuntimeValue(ln2), mutable: false),
    'ln10': RuntimeVariable(const RuntimeValue(ln10), mutable: false),
  };

  /// Optional parent scope for resolving names not found in this scope.
  final Scope? _parent;

  /// Creates a new [Scope], optionally nested under a [_parent] scope.
  Scope([this._parent]);

  /// Defines or updates the variable [name] with the given [value] in this scope.
  void set(String name, RuntimeValue value,
      {bool mutable = true, bool nullable = false}) {
    if (!variables.containsKey(name)) {
      variables[name] =
          RuntimeVariable(value, mutable: mutable, nullable: nullable);
    } else {
      final variable = variables[name]!;

      if (!variable.mutable) {
        throw RuntimeException('Cannot modify immutable variable $name');
      }

      if (!variable.nullable && value is NullValue) {
        throw RuntimeException(
            'Cannot assign null to non-nullable variable $name');
      }

      variable.value = value;
    }
  }

  /// Retrieves the runtime value for [name], searching this scope first,
  /// then delegating to the parent scope if not found.
  ///
  /// Throws an [Exception] if the variable is not defined in any enclosing scope.
  RuntimeValue get(String name) {
    if (variables.containsKey(name)) {
      return variables[name]!.value;
    } else if (_parent != null) {
      return _parent.get(name);
    } else {
      throw RuntimeException('Variable $name not defined');
    }
  }

  /// Returns the root-most ancestor scope in a chain of nested scopes.
  ///
  /// Useful for resetting the environment after a function call.
  Scope get root => _parent?.root ?? this;

  /// Returns the parent scope of this scope, or itself if no parent exists.
  Scope pop() {
    return _parent ?? this;
  }
}
