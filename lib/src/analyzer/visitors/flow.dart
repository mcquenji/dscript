part of 'visitors.dart';

/// Analyzes flow control statements in the script.
class FlowVisitor extends AnalysisVisitor {
  /// Analyzes flow control statements in the script.
  FlowVisitor(super._parent);

  /// Ensures that the condition expression is a boolean type.
  ///
  /// Also reports warnings if the condition is always true or false.
  $Type ensureConditionIsBool(ExprContext? ctx) {
    if (ctx == null) {
      return report(SemanticError(
        'Condition expression is missing.',
        ctx: ctx,
      ));
    }

    final condition = ctx.accept(ExprVisitor(this));

    if (condition == null) {
      return report(InferenceError(ctx: ctx));
    }

    if (!condition.canCast(PrimitiveType.BOOL)) {
      return report(TypeError(
        PrimitiveType.BOOL,
        condition,
        ctx: ctx,
      ));
    }

    if (ctx.text == 'true') {
      report(SemanticWarning(
          'Condition is always true, this branch will always execute.',
          ctx: ctx));
    }

    if (ctx.text == 'false') {
      report(SemanticWarning(
          'Condition is always false, this branch will never execute.',
          ctx: ctx));
    }

    return condition;
  }

  @override
  $Type? visitIfStmt(IfStmtContext ctx) {
    ensureConditionIsBool(ctx.expr());

    scope = scope.fork();

    bool thenReturned = false;
    bool elseReturned = false;

    ctx.block()?.accept(BlockVisitor(this));

    thenReturned = scope.returned != null;
    scope = scope.pop();

    if (ctx.elseStmt() != null) {
      scope = scope.fork();
      ctx.elseStmt()!.accept(this);
      elseReturned = scope.returned != null;
      scope = scope.pop();
    }

    if (thenReturned && elseReturned) {
      scope.markReturned(scope.returnType);
    }

    return const InvalidType();
  }

  @override
  $Type? visitElseStmt(ElseStmtContext ctx) {
    if (ctx.ifStmt() != null) {
      ctx.ifStmt()!.accept(this);
    } else if (ctx.block() != null) {
      ctx.block()!.accept(BlockVisitor(this));
    }

    return const InvalidType();
  }

  @override
  $Type? visitWhileStmt(WhileStmtContext ctx) {
    ensureConditionIsBool(ctx.expr());

    for (final child in ctx.children!) {
      if (child is StmtContext) {
        child.accept(this);
      }
    }

    return const InvalidType();
  }
}
