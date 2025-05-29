import 'package:dscript/dscript.dart';

/// A builder for creating a [ContractSignature].
///
/// Use [impl], [hook], [struct], and [bind] to add implementations,
/// hooks, custom structs, and external bindings respectively, then
/// call [build] to produce an immutable [ContractSignature].
class ContractSignatureBuilder {
  final String _name;
  final List<ImplementationSignature> _impls = [];
  final List<HookSignature> _hooks = [];
  final ExternalBindings _bindings = ExternalBindings();
  final List<Struct> _structs = [];
  String _description = '';

  /// Creates a new builder for a contract with the given [name].
  ContractSignatureBuilder(this._name);

  /// Adds a new implementation signature with the specified [name]
  /// and [returnType], returning an [ImplBuilder] to configure parameters.
  ImplBuilder impl(String name, {required $Type returnType}) {
    return ImplBuilder(this, name, returnType);
  }

  /// Adds a new hook signature with the given [name], returning
  /// a [HookBuilder] to specify hook parameters.
  HookBuilder hook(String name) {
    return HookBuilder(this, name);
  }

  /// Adds a new struct definition with the specified [name], returning
  /// a [StructBuilder] to configure fields and description.
  StructBuilder struct(String name) {
    final builder = StructBuilder(name);
    builder._parent = this;
    _structs.add(builder.build());
    return builder;
  }

  void _addStruct(Struct struct) {
    _structs.add(struct);
  }

  void _addImpl(ImplementationSignature impl) {
    _impls.add(impl);
  }

  void _addHook(HookSignature hook) {
    _hooks.add(hook);
  }

  void _addBinding(RuntimeBinding binding) {
    _bindings.addBinding(binding);
  }

  /// Starts building an external binding with the given [name]
  /// and target [function], returning a [BindingBuilder] to
  /// configure permissions, parameters, and description.
  BindingBuilder<T> bind<T>(String name, Function function) {
    return BindingBuilder<T>(this, name, function);
  }

  /// Finalizes and returns the constructed [ContractSignature].
  ContractSignature build() {
    return ContractSignature(
      name: _name,
      implementations: List.unmodifiable(_impls),
      hooks: List.unmodifiable(_hooks),
      bindings: _bindings,
      structs: List.unmodifiable(_structs),
      description: _description.isNotEmpty ? _description : null,
    );
  }

  /// Appends a description for the contract, typically used for documentation.
  ContractSignatureBuilder describe(String description) {
    if (_description.isNotEmpty) {
      _description += '\n';
    }
    _description += description;
    return this;
  }
}

/// A builder for defining an external runtime binding.
///
/// Call [permission], [param], [namedParam], and [describe] to set up
/// the binding, then [end] to add it back to its parent and continue.
class BindingBuilder<T> {
  final ContractSignatureBuilder? _parent;
  final String _name;
  final List<ScriptPermission> _permissions = [];
  final Function _function;
  final List<$Type> _params = [];
  final Map<Symbol, $Type> _namedParams = {};
  String _description = '';

  /// Internal constructor; typically obtained via [ContractSignatureBuilder.bind].
  BindingBuilder(this._parent, this._name, this._function);

  /// Adds a custom [permission] string required by this binding.
  BindingBuilder<T> permission(String permission) {
    _permissions.add(ScriptPermission.custom(permission));
    return this;
  }

  /// Adds a positional parameter of the given [type].
  BindingBuilder<T> param($Type type) {
    _params.add(type);
    return this;
  }

  /// Adds a named parameter with [name] and [type].
  BindingBuilder<T> namedParam(String name, $Type type) {
    _namedParams[Symbol(name)] = type;
    return this;
  }

  /// Appends a descriptive [description] for hover/documentation.
  BindingBuilder<T> describe(String description) {
    if (_description.isNotEmpty) {
      _description += '\n';
    }
    _description += description;
    return this;
  }

  /// Completes this binding and adds it back to the parent builder,
  /// returning the parent [ContractSignatureBuilder].
  ContractSignatureBuilder end() {
    if (_parent == null) {
      throw StateError(
          'BindingBuilder must be attached to a parent ContractSignatureBuilder to call end()');
    }
    _parent!._addBinding(build());
    return _parent!;
  }

  /// Builds the immutable [RuntimeBinding] instance.
  RuntimeBinding<T> build() {
    return RuntimeBinding<T>(
      name: _name,
      function: _function,
      permissions: _permissions,
      positionalParams: List.unmodifiable(_params),
      namedParams: Map.unmodifiable(_namedParams),
      description: _description.isNotEmpty ? _description : null,
    );
  }
}

/// A builder for an implementation signature within a contract.
///
/// Call [param] to add each parameter, then [end] to attach it
/// to its parent and continue building the contract.
class ImplBuilder {
  final ContractSignatureBuilder? _parent;
  final String _name;
  final $Type _returnType;
  final List<ParameterSignature> _params = [];
  String _description = '';

  /// Internal constructor; typically obtained via [ContractSignatureBuilder.impl].
  ImplBuilder(this._parent, this._name, this._returnType);

  /// Appends a description for this implementation, typically used for documentation.
  ImplBuilder describe(String description) {
    if (_description.isNotEmpty) {
      _description += '\n';
    }
    _description += description;
    return this;
  }

  /// Adds a named parameter with [name] and [type].
  ImplBuilder param(String name, $Type type) {
    _params.add(ParameterSignature(name: name, type: type));
    return this;
  }

  /// Completes this implementation and adds the signature to the parent,
  /// returning the parent [ContractSignatureBuilder].
  ContractSignatureBuilder end() {
    if (_parent == null) {
      throw StateError(
          'ImplBuilder must be attached to a parent ContractSignatureBuilder to call end()');
    }
    _parent!._addImpl(build());
    return _parent!;
  }

  /// Builds the immutable [ImplementationSignature].
  ImplementationSignature build() {
    return ImplementationSignature(
      name: _name,
      namedParameters: List.unmodifiable(_params),
      returnType: _returnType,
      description: _description.isNotEmpty ? _description : null,
    );
  }
}

/// A builder for a hook signature within a contract.
///
/// Call [param] to add parameters, then [end] to attach it to the
/// parent and continue building the contract.
class HookBuilder {
  final ContractSignatureBuilder? _parent;
  final String _name;
  final List<ParameterSignature> _params = [];
  String _description = '';

  /// Internal constructor; typically obtained via [ContractSignatureBuilder.hook].
  HookBuilder(this._parent, this._name);

  /// Appends a description for this hook, typically used for documentation.
  HookBuilder describe(String description) {
    if (_description.isNotEmpty) {
      _description += '\n';
    }
    _description += description;
    return this;
  }

  /// Adds a named parameter with [name] and [type].
  HookBuilder param(String name, $Type type) {
    _params.add(ParameterSignature(name: name, type: type));
    return this;
  }

  /// Completes this hook and adds the signature to the parent,
  /// returning the parent [ContractSignatureBuilder].
  ContractSignatureBuilder end() {
    if (_parent == null) {
      throw StateError(
          'HookBuilder must be attached to a parent ContractSignatureBuilder to call end()');
    }
    _parent!._addHook(build());
    return _parent!;
  }

  /// Builds the immutable [HookSignature].
  HookSignature build() {
    return HookSignature(
      name: _name,
      namedParameters: List.unmodifiable(_params),
      description: _description.isNotEmpty ? _description : null,
    );
  }
}

/// A builder for defining a [Struct] type used by a contract.
///
/// Call [field] to add fields, [describe] to add documentation,
/// then [end] to attach it to its parent contract.
class StructBuilder {
  final String _name;
  final Map<String, $Type> _fields = {};
  String _description = '';
  ContractSignatureBuilder? _parent;

  /// Creates a struct builder with the given [name].
  StructBuilder(this._name);

  /// Adds a field named [name] of [type] to the struct.
  StructBuilder field(String name, $Type type) {
    _fields[name] = type;
    return this;
  }

  /// Appends a struct-level description for documentation.
  StructBuilder describe(String description) {
    if (_description.isNotEmpty) {
      _description += '\n';
    }
    _description += description;
    return this;
  }

  /// Completes this struct and adds it to the parent,
  /// returning the parent [ContractSignatureBuilder].
  ContractSignatureBuilder end() {
    if (_parent == null) {
      throw StateError(
          'StructBuilder must be attached to a parent ContractSignatureBuilder to call end()');
    }
    _parent!._addStruct(build());
    return _parent!;
  }

  /// Builds the immutable [Struct] definition.
  Struct build() {
    return Struct(
      name: _name,
      fields: Map.unmodifiable(_fields),
      description: _description.isNotEmpty ? _description : null,
    );
  }
}

/// Shorthand to start a [ContractSignatureBuilder] for [name].
ContractSignatureBuilder contract(String name) =>
    ContractSignatureBuilder(name);

/// Shorthand to start a standalone [StructBuilder].
StructBuilder struct(String name) => StructBuilder(name);

/// Shorthand to start a standalone [HookBuilder].
HookBuilder hook(String name) => HookBuilder(null, name);

/// Shorthand to start a standalone [ImplBuilder].
ImplBuilder impl(String name, {required $Type returnType}) =>
    ImplBuilder(null, name, returnType);

/// Shorthand to start a standalone [BindingBuilder].
BindingBuilder<T> bind<T>(String name, Function function) =>
    BindingBuilder<T>(null, name, function);
