part of 'visitors.dart';

/// Analyzes the script's contract and its hooks and implementations.
class ContractVisitor extends AnalysisVisitor {
  /// Analyzes the script's contract and its hooks and implementations.
  ContractVisitor(super._parent);

  @override
  $Type? visitContract(ContractContext ctx) {
    final name = ctx.identifier()!.text;

    final contract = contracts.firstWhereOrNull(
      (c) => c.name == name,
    );

    if (contract == null) {
      report(ContractDeclarationError(name, ctx: ctx));
      return const InvalidType();
    }

    this.contract = contract;

    // check variable declarations first
    // to ensure all variables are defined before use
    for (final decl in ctx.varDecls()) {
      decl.accept(VarsVisitor(this));
    }

    // accept the functions first so that they are available
    // when visiting hooks and implementations
    for (final func in [...ctx.funcs(), ...ctx.hooks(), ...ctx.impls()]) {
      func.accept(this);
    }

    if (contract.implementations.any(
      (impl) => !implementations.containsKey(impl.name),
    )) {
      report(
        ContractDeclarationError(
          contract.name,
          foundImplementations: implementations.keys.toList(),
          implementations: contract.implementations.map((e) => e.name).toList(),
          ctx: ctx,
        ),
      );
    }

    return const InvalidType();
  }

  @override
  $Type? visitHook(HookContext ctx) {
    final name = ctx.identifier()!.text;

    if (hooks.containsKey(name)) {
      report(RedefinitionError(name, ctx: ctx));
      return const InvalidType();
    }

    hooks[name] = ctx;

    final hook = contract.hooks.find(name);

    if (hook == null) {
      report(HookDeclarationError(name, ctx: ctx));
      return const InvalidType();
    }

    scope = TypeScope(scope, returnType: PrimitiveType.VOID);

    final params = ctx.params()?.params() ?? [];
    final paramTypes = params.map((p) => p.accept(this)!).toList();

    if (paramTypes.length != hook.namedParameters.length) {
      report(
        HookDeclarationError(
          name,
          ctx: ctx,
          maxArgs: hook.namedParameters.length,
          foundArgs: paramTypes.length,
        ),
      );
    } else {
      for (var i = 0; i < paramTypes.length; i++) {
        final expected = hook.namedParameters[i].type;
        final found = paramTypes[i];

        if (found != expected) {
          report(ArgumentTypeMismatchError(
            expected,
            found,
            ctx: ctx,
          ));
        }
      }
    }

    ctx.block()!.accept(BlockVisitor(this));

    scope = scope.pop();

    return const InvalidType();
  }

  @override
  $Type? visitImpl(ImplContext ctx) {
    final name = ctx.identifier()!.text;

    if (implementations.containsKey(name)) {
      report(RedefinitionError(name, ctx: ctx));
      return const InvalidType();
    }

    implementations[name] = ctx;

    final impl = contract.implementations.find(name);

    if (impl == null) {
      report(ImplentationDeclarationError(name, ctx: ctx));
      return const InvalidType();
    }

    scope = TypeScope(scope, returnType: impl.returnType);

    final params = ctx.params()?.params() ?? [];
    final paramTypes = params.map((p) => p.accept(this)!).toList();

    if (paramTypes.length != impl.namedParameters.length) {
      report(
        ImplentationDeclarationError(
          name,
          ctx: ctx,
          maxArgs: impl.namedParameters.length,
          foundArgs: paramTypes.length,
        ),
      );
    } else {
      for (var i = 0; i < paramTypes.length; i++) {
        final expected = impl.namedParameters[i].type;
        final found = paramTypes[i];

        if (found != expected) {
          report(ArgumentTypeMismatchError(
            expected,
            found,
            ctx: ctx,
          ));
        }
      }
    }

    final returnType = ctx.dataType()?.accept(VarsVisitor(this))!;
    if (returnType != impl.returnType) {
      report(
        ImplentationDeclarationError(
          name,
          actualReturnType: returnType,
          returnType: impl.returnType,
          ctx: ctx,
        ),
      );
    }

    ctx.block()!.accept(BlockVisitor(this));

    if (scope.returned == null && impl.returnType != PrimitiveType.VOID) {
      report(
        SemanticError(
          "Implementation '$name' does not return a value.",
          ctx: ctx,
        ),
      );
    }

    if (scope.returned != null && !scope.returned!.canCast(impl.returnType)) {
      report(
        ImplentationDeclarationError(
          name,
          actualReturnType: scope.returned!,
          returnType: impl.returnType,
          ctx: ctx,
        ),
      );
    }

    scope = scope.pop();

    return const InvalidType();
  }

  @override
  $Type? visitFunc(FuncContext ctx) {
    final name = ctx.identifier()!.text;

    if (functions.containsKey(name)) {
      report(RedefinitionError(name, ctx: ctx));
      return const InvalidType();
    }

    functions[name] = ctx;

    final returnType =
        ctx.dataType()?.accept(VarsVisitor(this)) ?? PrimitiveType.VOID;

    scope = TypeScope(scope, returnType: returnType);

    final positionalParams = {
      for (final param in ctx.pos?.params() ?? [])
        param.identifier()!.text: param.accept(this)!,
    };

    final namedParams = {
      for (final param in ctx.named?.params() ?? [])
        param.identifier()!.text: param.accept(this)!,
    };

    functionSignatures[name] = FunctionSignature(
      name: name,
      returnType: returnType,
      positionalParameters: positionalParams.entries
          .map((e) => ParameterSignature(name: e.key, type: e.value))
          .toList(),
      namedParameters: namedParams.entries
          .map((e) => ParameterSignature(name: e.key, type: e.value))
          .toList(),
    );

    ctx.block()!.accept(BlockVisitor(this));

    if (scope.returned == null && returnType != PrimitiveType.VOID) {
      report(
        SemanticError(
          "Function '$name' does not return a value.",
          ctx: ctx,
        ),
      );
    }

    scope = scope.pop();

    return const InvalidType();
  }

  @override
  $Type? visitParam(ParamContext ctx) {
    final name = ctx.identifier()!.text;
    final type = ctx.dataType()!.accept(VarsVisitor(this))!;

    try {
      scope.set(name, type, false);
    } catch (e) {
      report(RedefinitionError(name, ctx: ctx));
    }

    return type;
  }
}
