// coverage:ignore-file
part of 'visitors.dart';

/// Analyzes statements in the script.
class StmtVisitor extends AnalysisVisitor {
  /// Analyzes statements in the script.
  StmtVisitor(super._parent);

  @override
  $Type? visitStmt(StmtContext ctx) {
    if (ctx.children == null) {
      return report(SemanticError('Empty statement', ctx: ctx));
    }

    for (final child in ctx.children!) {
      if (child is VarDeclContext) {
        return child.accept(VarsVisitor(this));
      }

      if (child is AssignmentContext) {
        return child.accept(VarsVisitor(this));
      }

      return child.accept(this);
    }

    return report(SemanticError('Unknown statement', ctx: ctx));
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
      final returnType = expr.accept(ExprVisitor(this));

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

    scope.markReturned(expr?.accept(ExprVisitor(this)));

    return const InvalidType();
  }

  @override
  $Type? visitThrowStmt(ThrowStmtContext ctx) {
    return const InvalidType();
  }
}
