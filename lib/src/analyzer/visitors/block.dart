part of 'visitors.dart';

/// Analyzes blocks of code in the script.
class BlockVisitor extends AnalysisVisitor {
  /// Analyzes blocks of code in the script.
  BlockVisitor(super._parent);

  @override
  $Type? visitBlock(BlockContext ctx) {
    scope = TypeScope(scope);

    if (ctx.ifStmt() != null) {
      return ctx.ifStmt()!.accept(FlowVisitor(this));
    }

    if (ctx.whileStmt() != null) {
      return ctx.whileStmt()!.accept(FlowVisitor(this));
    }
    if (ctx.forStmt() != null) {
      return ctx.forStmt()!.accept(FlowVisitor(this));
    }
    for (final child in ctx.lines()) {
      child.accept(this);
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
      return expr.accept(ExprVisitor(this));
    } else if (stmt != null) {
      return stmt.accept(StmtVisitor(this));
    } else {
      report(SemanticError('Empty line', ctx: ctx));
      return const InvalidType();
    }
  }
}
