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

    if (isConstExpr(ctx)) {
      if (ctx.text == 'true') {
        report(SemanticWarning(
            'Condition is always true, this branch will always execute.',
            ctx: ctx));
      } else if (ctx.text == 'false') {
        report(SemanticWarning(
            'Condition is always false, this branch will never execute.',
            ctx: ctx));
      } else {
        report(SemanticWarning(
            'Condition is constant, this branch will always have the same outcome.',
            ctx: ctx));
      }
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

  @override
  $Type? visitTryStmt(TryStmtContext ctx) {
    scope = scope.fork();

    ctx.block()?.accept(BlockVisitor(this));

    final tryReturned = scope.returned != null;
    scope = scope.pop();

    final catchBlock = ctx.catchBlock();

    if (catchBlock == null) {
      return report(
        SemanticError(
          'Catch block is missing.',
          ctx: ctx,
        ),
      );
    }

    scope = scope.fork();

    final ident = catchBlock.identifier()!.text;
    scope.set(
      ident,
      Struct.error,
      false,
    );

    catchBlock.block()?.accept(BlockVisitor(this));

    final catchReturned = scope.returned != null;
    scope = scope.pop();

    if (tryReturned && catchReturned) {
      scope.markReturned(scope.returnType);
    }

    return const InvalidType();
  }

  @override
  $Type? visitForStmt(ForStmtContext ctx) {
    scope = TypeScope(scope);

    if (ctx.IN() != null) {
      // For loop with 'in' keyword
      final iterable = ctx.expr()?.accept(ExprVisitor(this));
      if (iterable == null) {
        return report(InferenceError(ctx: ctx));
      }

      if (iterable is! ListType && iterable != PrimitiveType.STRING) {
        return report(
          SemanticError('Can only iterate over strings and lists', ctx: ctx),
        );
      }

      final varType = ctx.varDecl()!.varType()!;

      final mutable = varType.VAR() != null;

      final ident = ctx.varDecl()!.identifier()!.text;
      scope.set(
        ident,
        iterable is ListType ? iterable.elementType : PrimitiveType.STRING,
        mutable,
      );

      ctx.block()?.accept(BlockVisitor(this));

      scope = scope.pop();
      return const InvalidType();
    }

    // For loop with variable declaration
    final varType = ctx.varDecl()!.varType()!;

    final mutable = varType.VAR() != null;

    final ident = ctx.varDecl()!.identifier()!.text;
    scope.set(
      ident,
      PrimitiveType.INT,
      mutable,
    );
    ensureConditionIsBool(ctx.expr());

    ctx.assignment()?.accept(ExprVisitor(this));

    ctx.block()?.accept(BlockVisitor(this));

    scope = scope.pop();

    return const InvalidType();
  }
}
