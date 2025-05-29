part of 'visitors.dart';

/// Analyzes blocks of code in the script.
class BlockVisitor extends AnalysisVisitor {
  /// Analyzes blocks of code in the script.
  BlockVisitor(super._parent);

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
      return expr.accept(ExprVisitor(this));
    } else if (stmt != null) {
      return stmt.accept(StmtVisitor(this));
    } else {
      report(SemanticError('Empty line', ctx: ctx));
      return const InvalidType();
    }
  }
}
