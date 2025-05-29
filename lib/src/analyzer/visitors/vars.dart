part of 'visitors.dart';

/// Analyzes variable declarations in the script.
class VarsVisitor extends AnalysisVisitor {
  /// Analyzes variable declarations in the script.
  VarsVisitor(super._parent);

  @override
  $Type? visitDataType(DataTypeContext ctx) {
    final type = $Type.from(ctx.text);

    if (type is Struct) {
      final struct = type.lookup(contract.structs);

      if (struct == null) {
        report(
          SemanticError('Unknown type: "${ctx.text}"', ctx: ctx),
        );
      }
    }

    return type;
  }

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
    final expr = ctx.expr()?.accept(ExprVisitor(this));
    if (expr == null) {
      return report(InferenceError(ctx: ctx));
    }
    if (!expr.canCast(type)) {
      return report(
        AssignmentError(
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

    final expr = ctx.expr()?.accept(ExprVisitor(this));
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
            AssignmentError(type, PrimitiveType.DOUBLE, ctx: ctx),
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
        ctx.assignment()?.simpleAssignment()?.expr()?.accept(ExprVisitor(this));

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
                "Immutable variable '$name' should have an initializer",
                ctx: ctx,
              )
            : SemanticError(
                "Immutable non-nullable variable '$name' must have an initializer",
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
}
