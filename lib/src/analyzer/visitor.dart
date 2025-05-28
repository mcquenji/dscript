part of 'analyzer.dart';

/// Analyzes a DScript script for errors and validates it against the provided contract signatures.
class Analyzer extends dscriptBaseVisitor<$Type> {
  final _report = AnalysisReport();

  /// The current type scope for the currently visited context.
  TypeScope scope = TypeScope(null);

  /// A list of contract signatures that this analyzer will use to validate
  /// the script against.
  List<ContractSignature> contracts = [];

  /// The contract signature the script is implementing.
  late final ContractSignature contract;

  /// The name of the contract if one was found during analysis.
  String? name;

  /// The author of the contract if one was found during analysis.
  String? author;

  /// The version of the contract if one was found during analysis.
  Version? version;

  /// The description of the contract if one was found during analysis.
  String description = '';

  /// The license of the contract if one was found during analysis.
  String? license;

  /// The repository URL of the contract if one was found during analysis.
  String? repository;

  /// The website URL of the contract if one was found during analysis.
  String? website;

  /// Permissions defined in the script.
  final List<ScriptPermission> permissions = [];

  /// Creates an [Analyzer] with the given [bindings].
  Analyzer(this.contracts);

  /// Matches the [found] type against the [expected] type.
  ///
  /// If the types do not match, an [AssignmentError] is reported.
  void match($Type expected, $Type found, ParserRuleContext ctx,
      [String? variable]) {
    if (!found.canCast(expected)) {
      report(
        AssignmentError(
          variable ?? '',
          expected,
          found,
          ctx: ctx,
        ),
      );
    }
  }

  /// Reports an [AnalyzerMessage] to the report.
  ///
  /// Returns null to allow returning null from visitor methods while also reporting the error.
  $Type report(AnalyzerMessage error) {
    _report.report(error);
    return const InvalidType();
  }

  @override
  $Type? visitScript(ScriptContext ctx) {
    for (final metadata in ctx.metadatas()) {
      metadata.accept(this);
    }

    if (name == null) {
      report(SemanticError('Name is not defined', ctx: ctx));
    }
    if (author == null) {
      report(SemanticError('Author is not defined', ctx: ctx));
    }
    if (version == null) {
      report(SemanticError('Version is not defined', ctx: ctx));
    }
    if (description.isEmpty) {
      report(SemanticError('Description is not defined', ctx: ctx));
    }

    for (final perm in ctx.permissionss()) {
      perm.accept(this);
    }

    ctx.contract()!.accept(this);

    return const InvalidType();
  }

  @override
  $Type? visitPermission(PermissionContext ctx) {
    final nameSpace = ctx.namespace!.text;
    final name = ctx.perm!.text;

    permissions.add(ScriptPermission(nameSpace, name));

    return const InvalidType();
  }

  @override
  $Type? visitContract(ContractContext ctx) {
    final name = ctx.identifier()!.text;

    contract = contracts.firstWhere(
      (c) => c.name == name,
      orElse: () {
        final error = SemanticError('No such contract: "$name"', ctx: ctx);

        report(error);
        throw error;
      },
    );

    for (final func in [...ctx.hooks(), ...ctx.funcs(), ...ctx.impls()]) {
      func.accept(this);
    }

    return const InvalidType();
  }

  // #region Metadata
  @override
  $Type? visitAuthor(AuthorContext ctx) {
    if (author != null) {
      report(SemanticError('Author already defined', ctx: ctx));
    }

    author = ctx.STRING()!.innerText!;

    return const InvalidType();
  }

  @override
  $Type? visitName(NameContext ctx) {
    if (name != null) {
      report(SemanticError('Name already defined', ctx: ctx));
    }

    name = ctx.STRING()!.innerText!;

    return const InvalidType();
  }

  @override
  $Type? visitVersion(VersionContext ctx) {
    if (version != null) {
      report(SemanticError('Version already defined', ctx: ctx));
    }

    version = Version.parse(ctx.SEMVER()!.text!);

    return const InvalidType();
  }

  @override
  $Type? visitDescription(DescriptionContext ctx) {
    final txt = ctx.STRING()!.innerText!;

    description = description.isEmpty ? txt : '$description\n$txt';

    return const InvalidType();
  }

  @override
  $Type? visitLicense(LicenseContext ctx) {
    if (license != null) {
      report(SemanticError('License already defined', ctx: ctx));
    }

    license = ctx.STRING()!.innerText!;

    return const InvalidType();
  }

  @override
  $Type? visitRepo(RepoContext ctx) {
    if (repository != null) {
      report(SemanticError('Repository already defined', ctx: ctx));
    }

    repository = ctx.STRING()!.innerText!;

    return const InvalidType();
  }

  @override
  $Type? visitWebsite(WebsiteContext ctx) {
    if (website != null) {
      report(SemanticError('Website already defined', ctx: ctx));
    }

    website = ctx.STRING()!.innerText!;

    return const InvalidType();
  }

  // #endregion

  // #region Hooks
  @override
  $Type? visitHook(HookContext ctx) {
    final name = ctx.identifier()!.text;

    final hook = contract.hooks.find(name);

    if (hook == null) {
      report(SemanticError('No such hook: "$name"', ctx: ctx));
      return const InvalidType();
    }

    scope = TypeScope(scope, returnType: PrimitiveType.VOID);

    final params = ctx.params()?.params() ?? [];
    final paramTypes = params.map((p) => p.accept(this)!).toList();

    if (paramTypes.length != hook.namedParameters.length) {
      report(
        SemanticError(
          'Hook "$name" expects ${hook.namedParameters.length} parameters, but found ${paramTypes.length}',
          ctx: ctx,
        ),
      );
    } else {
      for (var i = 0; i < paramTypes.length; i++) {
        final expected = hook.namedParameters[i].type;
        final found = paramTypes[i];

        if (found != expected) {
          report(AssignmentError(
            hook.namedParameters[i].name,
            expected,
            found,
            ctx: ctx,
          ));
        }
      }
    }

    ctx.block()!.accept(this);

    scope = scope.pop();

    return const InvalidType();
  }
  // #endregion

  // #region Implementations
  @override
  $Type? visitImpl(ImplContext ctx) {
    final name = ctx.identifier()!.text;

    final impl = contract.implementations.find(name);

    if (impl == null) {
      _report
          .report(SemanticError('No such implementation: "$name"', ctx: ctx));
      return const InvalidType();
    }

    scope = TypeScope(scope, returnType: impl.returnType);

    final params = ctx.params()?.params() ?? [];
    final paramTypes = params.map((p) => p.accept(this)!).toList();

    if (paramTypes.length != impl.namedParameters.length) {
      report(
        SemanticError(
          'Implementation "$name" expects ${impl.namedParameters.length} parameters, but found ${paramTypes.length}',
          ctx: ctx,
        ),
      );
    } else {
      for (var i = 0; i < paramTypes.length; i++) {
        final expected = impl.namedParameters[i].type;
        final found = paramTypes[i];

        if (found != expected) {
          report(AssignmentError(
            impl.namedParameters[i].name,
            expected,
            found,
            ctx: ctx,
          ));
        }
      }
    }

    final returnType = ctx.dataType()?.accept(this)!;
    if (returnType != impl.returnType) {
      report(
        SemanticError(
          'Implementation "$name" expects return type ${impl.returnType}, but found $returnType',
          ctx: ctx,
        ),
      );
    }

    ctx.block()!.accept(this);

    scope = scope.pop();

    return const InvalidType();
  }
  // #endregion

  @override
  $Type? visitParam(ParamContext ctx) {
    final name = ctx.identifier()!.text;
    final type = ctx.dataType()!.accept(this)!;

    scope.set(name, type, false);

    return type;
  }

  @override
  $Type? visitDataType(DataTypeContext ctx) {
    final type = $Type.from(ctx.text);

    if (type is Struct) {
      final struct = type.lookup(contract.objects);

      if (struct == null) {
        report(
          SemanticError('Unknown type: "${ctx.text}"', ctx: ctx),
        );
      }
    }

    return type;
  }

  @override
  $Type? visitIdentifier(IdentifierContext ctx) {
    final type = scope.get(ctx.text);

    if (type == null) {
      report(
        SemanticError(
          'Undefined identifier: "${ctx.text}"',
          ctx: ctx,
        ),
      );
      return const InvalidType();
    }

    return type;
  }

  @override
  $Type? visitBlock(BlockContext ctx) {
    scope = TypeScope(scope);

    for (final line in ctx.lines()) {
      line.accept(this);
    }

    scope = scope.pop();

    return const InvalidType();
  }

  @override
  $Type? visitLine(LineContext ctx) {
    final block = ctx.block();
    final expr = ctx.expr();
    final stmt = ctx.stmt();

    if (block != null) {
      return block.accept(this);
    } else if (expr != null) {
      return expr.accept(this);
    } else if (stmt != null) {
      return stmt.accept(this);
    } else {
      report(SemanticError('Empty line', ctx: ctx));
      return const InvalidType();
    }
  }

  @override
  $Type? visitReturnStmt(ReturnStmtContext ctx) {
    final expr = ctx.expr();

    if (scope.returnType == null) {
      return report(SemanticError('Unexpected return statement', ctx: ctx));
    }

    if (expr != null && scope.returnType == PrimitiveType.VOID) {
      return report(
        SemanticError('Cannot return a value from a void function', ctx: ctx),
      );
    }

    final allowEmptyReturn =
        scope.returnType == PrimitiveType.VOID || scope.returnType!.nullable;

    if (expr == null && !allowEmptyReturn) {
      return report(
        SemanticError('Expected a return value of type ${scope.returnType}',
            ctx: ctx),
      );
    }

    if (expr != null) {
      final returnType = expr.accept(this);

      if (returnType == null) {
        return report(InferenceError(ctx: ctx));
      }

      if (!returnType.canCast(scope.returnType!)) {
        return report(
          ReturnError(
            scope.returnType!,
            returnType,
            ctx: ctx,
          ),
        );
      }
    }

    return const InvalidType();
  }

  @override
  $Type? visitThrowStmt(ThrowStmtContext ctx) {
    return const InvalidType();
  }

  // #region Variable Assignments & Declarations

  @override
  $Type? visitSimpleAssignment(ctx) {
    final name = ctx.identifier()!.text;

    final type = scope.get(name);
    if (type == null) {
      return report(
        SemanticError('Undefined identifier: "$name"', ctx: ctx),
      );
    }

    if (!scope.mutable(name)) {
      return report(
        SemanticError('Cannot assign to immutable variable: "$name"', ctx: ctx),
      );
    }
    final expr = ctx.expr()?.accept(this);
    if (expr == null) {
      return report(InferenceError(ctx: ctx));
    }
    if (!expr.canCast(type)) {
      return report(
        AssignmentError(
          name,
          type,
          expr,
          ctx: ctx,
        ),
      );
    }

    return type;
  }

  @override
  $Type? visitCompoundAssignment(CompoundAssignmentContext ctx) {
    final name = ctx.identifier()!.text;

    final type = scope.get(name);
    if (type == null) {
      return report(
        SemanticError('Undefined identifier: "$name"', ctx: ctx),
      );
    }

    if (scope.mutable(name)) {
      return report(
        SemanticError('Cannot assign to immutable variable: "$name"', ctx: ctx),
      );
    }

    final expr = ctx.expr()?.accept(this);
    if (expr == null) {
      return report(InferenceError(ctx: ctx));
    }

    switch (ctx.op!.type) {
      case dscriptParser.TOKEN_PLUS_ASSIGN:
        if (type == PrimitiveType.STRING) break;
        if (type != PrimitiveType.INT && type != PrimitiveType.DOUBLE) {
          report(
            SemanticError(
              'Invalid operator for variable of type $type: ${ctx.op!.text}',
              ctx: ctx,
            ),
          );
        }
        match(type, expr, ctx, name);
        break;
      case dscriptParser.TOKEN_MINUS_ASSIGN:
        if (type != PrimitiveType.INT && type != PrimitiveType.DOUBLE) {
          report(
            SemanticError(
              'Invalid operator for variable of type $type: ${ctx.op!.text}',
              ctx: ctx,
            ),
          );
        }
        match(type, expr, ctx, name);
        break;
      case dscriptParser.TOKEN_MULTIPLY_ASSIGN:
        if (type != PrimitiveType.INT && type != PrimitiveType.DOUBLE) {
          report(
            SemanticError(
              'Invalid operator for variable of type $type: ${ctx.op!.text}',
              ctx: ctx,
            ),
          );
        }
        match(type, expr, ctx, name);
        break;
      case dscriptParser.TOKEN_DIVIDE_ASSIGN:
        if (type != PrimitiveType.DOUBLE) {
          report(
            AssignmentError(name, type, PrimitiveType.DOUBLE, ctx: ctx),
          );
        }
        match(type, expr, ctx, name);
        break;
      case dscriptParser.TOKEN_MOD_ASSIGN:
        if (type != PrimitiveType.INT && type != PrimitiveType.DOUBLE) {
          report(
            SemanticError(
              'Invalid operator for variable of type $type: ${ctx.op!.text}',
              ctx: ctx,
            ),
          );
        }
        match(type, expr, ctx, name);
        break;
    }

    return type;
  }

  @override
  $Type? visitVarDecl(VarDeclContext ctx) {
    final varType = ctx.varType()!;

    final type = ctx.dataType()?.accept(this);

    final name = ctx.identifier()?.text ??
        ctx.assignment()?.simpleAssignment()?.identifier()?.text;

    final initializer =
        ctx.assignment()?.simpleAssignment()?.expr()?.accept(this);

    final isMutable = varType.VAR() != null;

    if (name == null) {
      return report(
        SemanticError('Variable declaration must have a name', ctx: ctx),
      );
    }

    if (type == null && initializer == null) {
      return report(
        SemanticError('Variable "$name" must have a type or an initializer',
            ctx: ctx),
      );
    }
    final resolvedType = type ?? initializer ?? const InvalidType();

    if (!isMutable && initializer == null) {
      report(
        resolvedType.nullable
            ? SemanticWarning(
                'Immutable variable "$name" should have an initializer',
                ctx: ctx,
              )
            : SemanticError(
                'Immutable non-nullable variable "$name" must have an initializer',
                ctx: ctx,
              ),
      );
    }

    if (scope.has(name)) {
      report(
        SemanticError('Variable "$name" already defined', ctx: ctx),
      );
    } else {
      scope.set(name, resolvedType, isMutable);
    }

    if (type != null && initializer != null) {
      match(type, initializer, ctx, name);
    }

    if (type == PrimitiveType.VOID) {
      report(
        SemanticError('Variable "$name" cannot be of type void', ctx: ctx),
      );
    }

    return resolvedType;
  }
  // #endregion

  // #region Expressions

  @override
  $Type? visitExpr(ExprContext ctx) {
    return ctx.logicalExpr()?.accept(this);
  }

  @override
  $Type? visitExternalFunctionCall(ExternalFunctionCallContext ctx) {
    final namespace = ctx.namespace!.text;

    final func = ctx.functionCall()!;

    final name = func.method!.text;

    final posArgs =
        func.args()?.positionalArgs().map((a) => a.accept(this)!).toList() ??
            [];
    final namedArgs = {
      for (var e in func.args()?.namedArgs() ?? [])
        Symbol(e.identifier()!.text): e.expr()?.accept(this)!
    };

    final binding =
        [...LibraryBinding.stdLib(), contract.bindings].firstWhereOrNull(
      (b) => b.name == namespace,
    );

    if (binding == null) {
      return report(SemanticError('No such namespace: "$namespace"', ctx: ctx));
    }

    final impl = binding.bindings.firstWhereOrNull(
      (b) => b.name == name,
    );

    if (impl == null) {
      return report(
          SemanticError('No such function: "$name" in $namespace', ctx: ctx));
    }

    for (final permission in impl.permissions) {
      if (!permissions.contains(permission)) {
        report(
          SemanticError(
            'Missing permission: "$permission" for function "$namespace::$name"',
            ctx: ctx,
          ),
        );
      }
    }

    if (impl.positionalParams.length != posArgs.length) {
      return report(
        SemanticError(
          'Function "$name" expects ${impl.positionalParams.length} positional parameters, but found ${posArgs.length}',
          ctx: ctx,
        ),
      );
    }

    for (var i = 0; i < posArgs.length; i++) {
      final expected = impl.positionalParams[i];
      final found = posArgs[i];

      if (!found.canCast(expected)) {
        report(
          AssignmentError(
            'the ${i + 1}. positional argument',
            expected,
            found,
            ctx: ctx,
          ),
        );
      }
    }

    for (final arg in namedArgs.entries) {
      final expected = impl.namedParams[arg.key];

      if (expected == null) {
        report(
          SemanticError(
            'No such parameter in "$namespace::$name": "${arg.key}"',
            ctx: ctx,
          ),
        );
        continue;
      }

      final found = arg.value;

      if (!found.canCast(expected)) {
        report(
          AssignmentError(
            arg.key.toString(),
            expected,
            found,
            ctx: ctx,
          ),
        );
      }
    }

    for (final param in impl.namedParams.entries) {
      if (!namedArgs.containsKey(param.key) && !param.value.nullable) {
        report(
          SemanticError(
            'Missing non-nullable parameter "${param.key}" in "$namespace::$name"',
            ctx: ctx,
          ),
        );
      }
    }

    return impl.returnType;
  }

  // #region Binary Expressions

  /// Helper method to resolve binary expressions.
  ///
  /// - If the [left] and [right] expressions are both non-null, [resolve] is called.
  /// - If only the [left] expression is non-null, it's type is returned.
  /// - If both are null, an [InferenceError] is reported and null returned.
  $Type? binop(
      ParserRuleContext ctx,
      ParserRuleContext? left,
      ParserRuleContext? right,
      Token? op,
      $Type? Function($Type, $Type, String) resolve) {
    final leftType = left?.accept(this);
    final rightType = right?.accept(this);

    if (leftType != null && rightType != null) {
      return resolve(leftType, rightType, op?.text ?? '');
    }

    if (leftType != null && rightType == null) {
      return leftType;
    }

    report(InferenceError(ctx: ctx));
    return const InvalidType();
  }

  @override
  $Type? visitLogicalExpr(LogicalExprContext ctx) => binop(
        ctx,
        ctx.left,
        ctx.right,
        ctx.op,
        (left, right, op) {
          if (op == '&&' || op == '||') {
            match(PrimitiveType.BOOL, left, ctx);
            match(PrimitiveType.BOOL, right, ctx);

            return PrimitiveType.BOOL;
          } else {
            return report(
              SemanticError('Unknown logical operator: "$op"', ctx: ctx),
            );
          }
        },
      );

  @override
  $Type? visitBitwiseExpr(BitwiseExprContext ctx) => binop(
        ctx,
        ctx.left,
        ctx.right,
        ctx.op,
        (left, right, op) {
          if (op == '&' || op == '|') {
            match(PrimitiveType.INT, left, ctx);
            match(PrimitiveType.INT, right, ctx);

            return PrimitiveType.INT;
          } else {
            return report(
              SemanticError('Unknown bitwise operator: "$op"', ctx: ctx),
            );
          }
        },
      );

  @override
  $Type? visitAdditiveExpr(AdditiveExprContext ctx) {
    return binop(
      ctx,
      ctx.left,
      ctx.right,
      ctx.op,
      (left, right, op) {
        if (op == '+' || op == '-') {
          if (left == PrimitiveType.STRING) {
            return PrimitiveType.STRING;
          }

          if (left == PrimitiveType.INT && right == PrimitiveType.INT) {
            return PrimitiveType.INT;
          }

          if (left == PrimitiveType.DOUBLE) {
            match(PrimitiveType.DOUBLE, right, ctx);
            return PrimitiveType.DOUBLE;
          }

          if (right == PrimitiveType.DOUBLE) {
            match(PrimitiveType.DOUBLE, left, ctx);
            return PrimitiveType.DOUBLE;
          }

          return report(InferenceError(ctx: ctx));
        } else {
          report(
            SemanticError('Unknown additive operator: "$op"', ctx: ctx),
          );
          return const InvalidType();
        }
      },
    );
  }

  @override
  $Type? visitMultiplicativeExpr(MultiplicativeExprContext ctx) {
    return binop(
      ctx,
      ctx.left,
      ctx.right,
      ctx.op,
      (left, right, op) {
        switch (op) {
          case '*':
            if (left == PrimitiveType.INT && right == PrimitiveType.INT) {
              return PrimitiveType.INT;
            }
            if (left == PrimitiveType.DOUBLE || right == PrimitiveType.DOUBLE) {
              match(PrimitiveType.DOUBLE, left, ctx);
              match(PrimitiveType.DOUBLE, right, ctx);
              return PrimitiveType.DOUBLE;
            }

            return report(
              InferenceError(ctx: ctx),
            );
          case '/':
            match(PrimitiveType.DOUBLE, left, ctx);
            match(PrimitiveType.DOUBLE, right, ctx);
            return PrimitiveType.DOUBLE;
          case '%':
            match(PrimitiveType.INT, left, ctx);
            match(PrimitiveType.INT, right, ctx);
            return PrimitiveType.INT;
          default:
            return report(
              SemanticError('Unknown multiplicative operator: "$op"', ctx: ctx),
            );
        }
      },
    );
  }

  @override
  $Type? visitRelationalExpr(RelationalExprContext ctx) {
    return binop(
      ctx,
      ctx.left,
      ctx.right,
      ctx.op,
      (left, right, op) {
        switch (op) {
          case '<':
          case '>':
          case '<=':
          case '>=':
            match(PrimitiveType.DOUBLE, left, ctx);
            match(PrimitiveType.DOUBLE, right, ctx);
            return PrimitiveType.BOOL;
          case '==':
          case '!=':
            if (left != right) {
              report(
                SemanticError(
                  'Cannot compare different types: "$left" and "$right"',
                  ctx: ctx,
                ),
              );
            }
            return PrimitiveType.BOOL;
          default:
            return report(
              SemanticError('Unknown relational operator: "$op"', ctx: ctx),
            );
        }
      },
    );
  }

  // #endregion

  // #region Literals
  @override
  $Type? visitLiteral(LiteralContext ctx) {
    if (ctx.BOOL() != null) {
      return PrimitiveType.BOOL;
    }
    if (ctx.INT() != null) {
      return PrimitiveType.INT;
    }
    if (ctx.DOUBLE() != null) {
      return PrimitiveType.DOUBLE;
    }
    if (ctx.STRING() != null) {
      return PrimitiveType.STRING;
    }
    if (ctx.NULL() != null) {
      return PrimitiveType.NULL;
    }

    if (ctx.objectLiteral() != null) {
      return ctx.objectLiteral()!.accept(this);
    }

    if (ctx.arrayLiteral() != null) {
      return ctx.arrayLiteral()!.accept(this);
    }

    if (ctx.mapLiteral() != null) {
      return ctx.mapLiteral()!.accept(this);
    }

    report(SemanticError('Unknown literal type', ctx: ctx));

    return const InvalidType();
  }

  @override
  $Type? visitObjectLiteral(ObjectLiteralContext ctx) {
    final type =
        $Type.from(ctx.identifier()!.text).lookup(contract.objects) as Struct?;

    if (type == null) {
      report(
        SemanticError('Unknown type: "${ctx.identifier()!.text}"', ctx: ctx),
      );
      return const InvalidType();
    }

    final Set<String> properties = {};

    for (final field in ctx.objectPropertys()) {
      final name = field.identifier()!.text;
      final found = field.expr()?.accept(this);

      final expected = type.fields[name];

      if (expected == null) {
        report(
          SemanticError(
            'Object "${type.name}" has no field "$name"',
            ctx: field,
          ),
        );
        continue;
      }
      if (found == null) {
        report(
          InferenceError(ctx: field),
        );
        continue;
      }

      if (!found.canCast(expected)) {
        report(
          AssignmentError(
            name,
            expected,
            found,
            ctx: field,
          ),
        );
      }

      properties.add(name);
    }

    for (final field in type.fields.entries) {
      if (!properties.contains(field.key) && !field.value.nullable) {
        report(
          SemanticError(
            'Missing required field "${field.key}"',
            ctx: ctx,
          ),
        );
      }
    }

    return type;
  }

  @override
  $Type? visitArrayLiteral(ArrayLiteralContext ctx) {
    final elements = ctx.exprs();

    if (elements.isEmpty) {
      return ListType(elementType: PrimitiveType.NULL);
    }

    final types = elements.map((e) => e.accept(this)).toList();

    final firstType = types.firstWhereOrNull((type) => type != null);

    if (firstType == null) {
      report(InferenceError(ctx: ctx));
      return const InvalidType();
    }

    for (final type in types.skip(1)) {
      if (type == null) {
        continue;
      }

      if (!type.canCast(firstType)) {
        report(
          AssignmentError(
            'Array element',
            firstType,
            type,
            ctx: ctx,
          ),
        );
      }
    }

    return ListType(elementType: firstType);
  }

  @override
  $Type? visitMapLiteral(MapLiteralContext ctx) {
    final entries = ctx.mapEntrys();

    if (entries.isEmpty) {
      return MapType(
        keyType: PrimitiveType.NULL,
        valueType: PrimitiveType.NULL,
      );
    }

    final keyTypes = <$Type>{};
    final valueTypes = <$Type>{};

    for (final entry in entries) {
      final key = entry.key?.accept(this);
      final value = entry.value?.accept(this);

      if (key == null || value == null) {
        report(InferenceError(ctx: ctx));
        continue;
      }

      keyTypes.add(key);
      valueTypes.add(value);
    }

    final keyType = keyTypes.isNotEmpty ? keyTypes.first : null;

    final valueType = valueTypes.isNotEmpty ? valueTypes.first : null;

    if (keyType == null || valueType == null) {
      report(InferenceError(ctx: ctx));
      return const InvalidType();
    }

    for (final key in keyTypes.skip(1)) {
      if (!key.canCast(keyType)) {
        report(
          AssignmentError(
            'Map key',
            keyType,
            key,
            ctx: ctx,
          ),
        );
      }
    }

    for (final value in valueTypes.skip(1)) {
      if (!value.canCast(valueType)) {
        report(
          AssignmentError(
            'Map value',
            valueType,
            value,
            ctx: ctx,
          ),
        );
      }
    }

    return MapType(keyType: keyType, valueType: valueType);
  }
  // #endregion

  // #endregion

  @override
  $Type? visitErrorNode(ErrorNode node) {
    report(
      SemanticError('Syntax error: ${node.text}',
          ctx: node as ParserRuleContext),
    );

    return const InvalidType();
  }
}
