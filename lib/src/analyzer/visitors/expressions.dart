part of 'visitors.dart';

/// Analyzes primary expressions in the script.
class ExprVisitor extends AnalysisVisitor {
  /// Analyzes primary expressions in the script.
  ExprVisitor(super._parent);

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

  @override
  $Type? visitIdentifier(IdentifierContext ctx) {
    if (ctx.indexIdent != null) {
      // this is an indexed identifier, like `array[0]` or `map['key']`
      final type = ctx.indexIdent!.accept(this);

      final index = ctx.index?.accept(this);

      if (index == null) {
        report(InferenceError(ctx: ctx));
        return const InvalidType();
      }

      if (type == null) {
        return report(InferenceError(ctx: ctx));
      }

      if (type.nullable &&
          ctx.indexIdent!.nullAware == null &&
          ctx.indexIdent!.allowNull == null) {
        // if the type is nullable and the index is not null-aware, we return a nullable type
        report(
          NullSafetyError(
            valueName: ctx.indexIdent!.text,
            propertyName: null,
            ctx: ctx,
          ),
        );
      }

      final nullable = ctx.nullAware == null;

      if (type is ListType) {
        if (index != PrimitiveType.INT) {
          report(
            TypeError(
              PrimitiveType.INT,
              index,
              ctx: ctx,
            ),
          );
        }
        return type.elementType.asNullable(nullable);
      }

      if (type is MapType) {
        if (!index.canCast(type.keyType)) {
          report(
            TypeError(
              type.keyType,
              index,
              ctx: ctx,
            ),
          );
        }
        return type.valueType.asNullable(nullable);
      }

      return report(
        SemanticError(
          "Cannot index type '$type'",
          ctx: ctx,
        ),
      );
    }

    if (ctx.objIdent != null) {
      // we're accessing a property of an object, like `obj.prop`

      final rawType = ctx.objIdent!.accept(this);
      final objType = rawType?.lookup(contract.structs);

      if (objType == null) {
        return report(
          SemanticError(
            "Cannot access properties of type '$rawType'",
            ctx: ctx,
          ),
        );
      }

      bool nullable = objType.nullable && ctx.objIdent!.nullAware == null;

      final propName = ctx.property!.ident!.text!;
      var propType = objType.fields[propName];

      if (propType == null) {
        return report(
          SemanticError(
            "Object '${objType.name}' has no property '$propName'",
            ctx: ctx,
          ),
        );
      }

      if (objType.nullable &&
          ctx.objIdent!.nullAware == null &&
          ctx.objIdent!.allowNull == null) {
        // if the object is nullable and the access is not null-aware, we report an error
        report(
          NullSafetyError(
            propertyName: propName,
            valueName: null,
            ctx: ctx,
          ),
        );
      }

      if (ctx.property!.nullAware != null) {
        nullable = false;
      }

      // if the property or the object is nullable, we return a nullable type
      propType = propType.asNullable(nullable);

      // check for unnecessary null-aware access
      if (!propType.nullable &&
          (ctx.property!.nullAware != null ||
              ctx.property!.allowNull != null)) {
        report(
          UnnecessaryNullCheckWarning(
            ctx.property!.nullAware?.text ?? ctx.property!.allowNull!.text!,
            ctx: ctx,
          ),
        );
      }

      return propType;
    }

    final type = scope.get(ctx.ident!.text!);

    if (type == null) {
      report(
        UndefinedError(
          ctx.ident!.text!,
          ctx: ctx,
        ),
      );
      return const InvalidType();
    }

    // check for unnecessary null-aware access
    if (!type.nullable && (ctx.nullAware != null || ctx.allowNull != null)) {
      report(
        UnnecessaryNullCheckWarning(
          ctx.nullAware?.text ?? ctx.allowNull!.text!,
          ctx: ctx,
        ),
      );
    }

    final nonNullable = ctx.nullAware != null || !type.nullable;

    return type.asNullable(!nonNullable);
  }

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
      return report(UndefinedNamespaceError(namespace, ctx: ctx));
    }

    final impl = binding.bindings.firstWhereOrNull(
      (b) => b.name == name,
    );

    if (impl == null) {
      return report(UndefinedExternalFunctionError(name, namespace, ctx: ctx));
    }

    for (final permission in impl.permissions) {
      if (!permissions.contains(permission)) {
        report(
          PermissionError(
            permission,
            '$namespace::$name',
            ctx: ctx,
          ),
        );
      }
    }

    if (impl.positionalParams.length != posArgs.length) {
      return report(
        PositionalArgumentError(
          impl.name,
          posArgs.length,
          impl.positionalParams.length,
          ctx: ctx,
        ),
      );
    }

    for (var i = 0; i < posArgs.length; i++) {
      final expected = impl.positionalParams[i];
      final found = posArgs[i];

      if (!found.canCast(expected)) {
        report(
          ArgumentTypeMismatchError(
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
          UndefinedArgumentError(
            impl.name,
            arg.key.toString(),
            ctx: ctx,
          ),
        );
        continue;
      }

      final found = arg.value;

      if (!found.canCast(expected)) {
        report(
          ArgumentTypeMismatchError(
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
    final type = $Type.from(ctx.identifier()!.text).lookup(contract.structs);

    if (type == null) {
      report(
        SemanticError("Unknown type: '${ctx.identifier()!.text}'", ctx: ctx),
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
            "Object '${type.name}' has no field '$name'",
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
            "Missing required field '${field.key}'",
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
            valueType,
            value,
            ctx: ctx,
          ),
        );
      }
    }

    return MapType(keyType: keyType, valueType: valueType);
  }

  @override
  $Type? visitUnaryExpr(UnaryExprContext ctx) {
    final op = ctx.op;
    final expr = ctx.unaryExpr()?.accept(this);
    final suffix = ctx.suffixExpr()?.accept(this);

    if (op == null) {
      return suffix;
    }

    if (expr == null) {
      return report(InferenceError(ctx: ctx));
    }

    switch (op.type) {
      case dscriptLexer.TOKEN_PLUS:
      case dscriptLexer.TOKEN_MINUS:
        if (expr == PrimitiveType.INT || expr == PrimitiveType.DOUBLE) {
          return expr;
        }
        return report(
          OperationError(op.text!, expr, ctx: ctx),
        );
      case dscriptLexer.TOKEN_NOT:
        if (expr == PrimitiveType.BOOL) {
          return PrimitiveType.BOOL;
        }
        return report(
          OperationError(op.text!, expr, ctx: ctx),
        );
      case dscriptLexer.TOKEN_BIT_NOT:
        if (expr == PrimitiveType.INT) {
          return PrimitiveType.INT;
        }
        return report(
          OperationError(op.text!, expr, ctx: ctx),
        );

      default:
        return report(
          SemanticError('Unknown unary operator: "${op.text}"', ctx: ctx),
        );
    }
  }

  @override
  $Type? visitSuffixExpr(SuffixExprContext ctx) {
    final expr = ctx.primaryExpr()?.accept(this);

    if (expr == null) {
      return report(InferenceError(ctx: ctx));
    }

    if (ctx.op == null) {
      // This is just a primary expression, like `42` or `myVar`
      return expr;
    }

    if (expr == PrimitiveType.INT || expr == PrimitiveType.DOUBLE) {
      return expr;
    }

    return report(OperationError(ctx.op!.text!, expr, ctx: ctx));
  }

  @override
  $Type? visitPrimaryExpr(PrimaryExprContext ctx) {
    if (ctx.CLOSE_PAREN() != null) {
      // This is a parenthesized expression, like `(1 + 2)`
      final inner = ctx.expr()?.accept(this);
      if (inner == null) {
        return report(InferenceError(ctx: ctx));
      }
      return inner;
    }

    if (ctx.literal() != null) {
      // This is a literal, like `42` or `"hello"`
      return ctx.literal()!.accept(this);
    }

    if (ctx.identifier() != null) {
      // This is an identifier, like `myVar`
      return ctx.identifier()!.accept(this);
    }
    if (ctx.externalFunctionCall() != null) {
      // This is an external function call, like `std::randomNumber(42)`
      return ctx.externalFunctionCall()!.accept(this);
    }

    if (ctx.functionCall() != null) {
      // This is a function call, like `myFunc(1, 2)`
      return ctx.functionCall()!.accept(this);
    }

    return report(InferenceError(ctx: ctx));
  }

  @override
  $Type? visitFunctionCall(FunctionCallContext ctx) {
    final name = ctx.method!.text;

    final posArgs =
        ctx.args()?.positionalArgs().map((a) => a.accept(this)!).toList() ?? [];
    final namedArgs = {
      for (var e in ctx.args()?.namedArgs() ?? <NamedArgContext>[])
        e.identifier()!.text: e.expr()!.accept(this)!
    };

    final func = functionSignatures[name];

    if (func == null) {
      return report(UndefinedError(name, ctx: ctx));
    }

    if (func.positionalParameters.length != posArgs.length) {
      return report(
        PositionalArgumentError(
          func.name,
          posArgs.length,
          func.positionalParameters.length,
          ctx: ctx,
        ),
      );
    }

    for (var i = 0; i < posArgs.length; i++) {
      final expected = func.positionalParameters[i];
      final found = posArgs[i];

      if (!found.canCast(expected.type)) {
        report(
          ArgumentTypeMismatchError(
            expected.type,
            found,
            ctx: ctx,
          ),
        );
      }
    }

    for (final arg in namedArgs.entries) {
      final expected = func.namedParameters.firstWhereOrNull(
        (p) => p.name == arg.key.toString(),
      );

      if (expected == null) {
        report(
          UndefinedArgumentError(
            func.name,
            arg.key.toString(),
            ctx: ctx,
          ),
        );
        continue;
      }

      final found = arg.value;

      if (!found.canCast(expected.type)) {
        report(
          ArgumentTypeMismatchError(
            expected.type,
            found,
            ctx: ctx,
          ),
        );
      }
    }

    for (final param in func.namedParameters) {
      if (!namedArgs.containsKey(param.name) && !param.type.nullable) {
        report(
          SemanticError(
            'Missing non-nullable parameter "${param.name}" in "$name"',
            ctx: ctx,
          ),
        );
      }
    }

    return func.returnType;
  }
}
