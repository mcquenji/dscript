part of 'analyzer.dart';

/// Same as [Scope] but only stores the types of variables and not their values.
class TypeScope {
  /// The parent scope of this scope.
  final TypeScope? _parent;

  /// The type expected to be returned if this scope is in a function context.
  /// If this scope is not in a function context, this will be null.
  final $Type? returnType;

  /// If this scope has returned a value, this will be set to the type of the returned value.
  $Type? returned;

  /// Same as [Scope] but only stores the types of variables and not their values.
  TypeScope(this._parent, {$Type? returnType})
      : returnType = returnType ?? _parent?.returnType;

  final Map<String, $Type> _types =
      Scope().variables.map((name, v) => MapEntry(name, v.value.type));

  /// List of mutable variables in this scope.
  final List<String> _mutables = [];

  /// Sets the type of a variable in this scope.
  ///
  /// Throws an [AnalyzerMessage] if the variable is already defined in this scope.
  void set(String name, $Type type, bool mutable) {
    if (type == PrimitiveType.VOID) {
      throw ArgumentError.value(
        type,
        'type',
        'Cannot set variable type to VOID',
      );
    }

    if (_types.containsKey(name)) {
      throw StateError('Variable $name already defined');
    }

    _types[name] = type;

    if (mutable) {
      _mutables.add(name);
    }
  }

  /// Marks the scope as having returned a value.
  /// This is used to check if a function has returned a value.
  void markReturned($Type? type) {
    if (returnType == null) {
      return;
    }

    if (returned != null) {
      return;
    }

    returned = type;
    // TODO: figure out how to propagate to the parent scope for branches.
    // When we propagate from within an if statement and mark the parent scope as returned,
    // this does not ensure that the function actually returns a value in all branches.
    _parent?.markReturned(type);
  }

  /// Returns true if a variable is defined directly in this scope.
  /// If the variable is defined in a parent scope, this will return false.
  /// If you want to check if a variable is defined in any scope, use [exists].
  bool has(String name) {
    return _types.containsKey(name);
  }

  /// Checks if a variable is defined in this scope or any parent scope.
  bool exists(String name) {
    if (_types.containsKey(name)) {
      return true;
    } else if (_parent != null) {
      return _parent.exists(name);
    }

    return false;
  }

  /// Checks if a variable is mutable in this scope.
  bool mutable(String name) {
    if (_types.containsKey(name)) {
      return _mutables.contains(name);
    } else if (_parent != null) {
      return _parent.mutable(name);
    }

    throw StateError('Variable $name not defined');
  }

  /// Gets the type of a variable in this scope.
  $Type? get(String name) {
    if (_types.containsKey(name)) {
      return _types[name];
    } else if (_parent != null) {
      return _parent.get(name);
    } else {
      return null;
    }
  }

  /// Returns the parent scope or this scope if there is no parent.
  TypeScope pop() {
    return _parent ?? this;
  }

  /// Returns the root scope of this scope.
  TypeScope get root {
    return _parent?.root ?? this;
  }
}
