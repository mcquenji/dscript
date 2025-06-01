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

  /// If this scope is a fork of another scope for branching,
  /// this will be true.
  final bool isFork;

  /// Same as [Scope] but only stores the types of variables and not their values.
  TypeScope(this._parent, {$Type? returnType, this.isFork = false})
      : returnType = returnType ?? _parent?.returnType,
        _types = _parent == null
            ? Scope().variables.map((name, v) => MapEntry(name, v.value.type))
            : <String, $Type>{};

  final Map<String, $Type> _types;

  /// List of mutable variables in this scope.
  final List<String> _mutables = [];

  /// List of constants in this scope.
  final List<String> _constants = [];

  /// Sets the type of a variable in this scope.
  ///
  /// Throws an [AnalyzerMessage] if the variable is already defined in this scope.
  void set(String name, $Type type, bool mutable, {bool constant = false}) {
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

    if (constant) {
      _constants.add(name);
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

    // Only propagate the returned type to the parent scope if this is not a fork.
    // If this is a fork, we don't want to propagate the returned type to the parent
    // because this scope is a possible branch of a function and we thus can't assume
    // that the parent scope has returned a value as well.
    if (!isFork) {
      _parent?.markReturned(type);
    }
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

  /// Checks if a variable is constant in this scope.
  bool constant(String name) {
    if (_types.containsKey(name)) {
      return _constants.contains(name);
    } else if (_parent != null) {
      return _parent.constant(name);
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

  /// Creates a child scope of this scope.
  TypeScope fork() {
    return TypeScope(this, returnType: returnType, isFork: true);
  }
}
