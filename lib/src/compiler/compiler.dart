import 'package:antlr4/antlr4.dart';
import 'package:dscript/src/analyzer/analyzer.dart';
import 'package:dscript/src/gen/antlr/dscriptLexer.dart';
import 'package:dscript/src/gen/antlr/dscriptParser.dart';
import 'package:dscript/src/gen/antlr/dscriptBaseVisitor.dart';

import 'instruction.dart';

/// Result of compiling a script.
class CompiledScript {
  /// Instructions for each implementation.
  final Map<String, List<Instruction>> implementations;

  /// Instructions for each hook.
  final Map<String, List<Instruction>> hooks;

  /// Creates a compiled script with [implementations] and [hooks].
  const CompiledScript({
    required this.implementations,
    required this.hooks,
  });
}

/// Compiles an analyzed [script] into a [CompiledScript].
CompiledScript compileScript(Script script) {
  final impls = <String, List<Instruction>>{};
  final hooks = <String, List<Instruction>>{};

  for (final entry in script.implementations.entries) {
    final visitor = _CompileVisitor();
    entry.value.accept(visitor);
    impls[entry.key] = visitor.instructions;
  }

  for (final entry in script.hooks.entries) {
    final visitor = _CompileVisitor();
    entry.value.accept(visitor);
    hooks[entry.key] = visitor.instructions;
  }

  return CompiledScript(implementations: impls, hooks: hooks);
}

class _CompileVisitor extends dscriptBaseVisitor<void> {
  final List<Instruction> instructions = [];

  @override
  void visitReturnStmt(ReturnStmtContext ctx) {
    ctx.expr()?.accept(this);
    instructions.add(const Instruction(OpCode.ret));
  }

  @override
  void visitAdditiveExpr(AdditiveExprContext ctx) {
    final exprs = ctx.multiplicativeExprs();
    exprs[0].accept(this);
    var ops = ctx.children!.whereType<TerminalNode>().toList();
    for (var i = 1; i < exprs.length; i++) {
      exprs[i].accept(this);
      final op = ops[i - 1].symbol.type;
      if (op == dscriptLexer.TOKEN_PLUS) {
        instructions.add(const Instruction(OpCode.add));
      } else {
        instructions.add(const Instruction(OpCode.sub));
      }
    }
  }

  @override
  void visitMultiplicativeExpr(MultiplicativeExprContext ctx) {
    final exprs = ctx.unaryExprs();
    exprs[0].accept(this);
    var ops = ctx.children!.whereType<TerminalNode>().toList();
    for (var i = 1; i < exprs.length; i++) {
      exprs[i].accept(this);
      final op = ops[i - 1].symbol.type;
      if (op == dscriptLexer.TOKEN_MULTIPLY) {
        instructions.add(const Instruction(OpCode.mul));
      } else if (op == dscriptLexer.TOKEN_DIVIDE) {
        instructions.add(const Instruction(OpCode.div));
      } else {
        // modulo not supported yet
      }
    }
  }

  @override
  void visitUnaryExpr(UnaryExprContext ctx) {
    if (ctx.suffixExpr() != null) {
      ctx.suffixExpr()!.accept(this);
    } else if (ctx.unaryExpr() != null) {
      ctx.unaryExpr()!.accept(this);
      final op = ctx.op?.type;
      if (op == dscriptLexer.TOKEN_MINUS) {
        instructions.add(const Instruction(OpCode.neg));
      }
    }
  }

  @override
  void visitSuffixExpr(SuffixExprContext ctx) {
    ctx.primaryExpr()?.accept(this);
  }

  @override
  void visitPrimaryExpr(PrimaryExprContext ctx) {
    if (ctx.literal() != null) {
      ctx.literal()!.accept(this);
    } else if (ctx.identifier() != null) {
      instructions.add(Instruction(OpCode.loadVar, ctx.identifier()!.text));
    } else if (ctx.expr() != null) {
      ctx.expr()!.accept(this);
    }
  }

  @override
  void visitLiteral(LiteralContext ctx) {
    if (ctx.INT() != null) {
      instructions.add(
        Instruction(OpCode.pushConst, int.parse(ctx.INT()!.text!)),
      );
    } else if (ctx.DOUBLE() != null) {
      instructions.add(
        Instruction(OpCode.pushConst, double.parse(ctx.DOUBLE()!.text!)),
      );
    } else if (ctx.STRING() != null) {
      final text = ctx.STRING()!.text!;
      instructions.add(
        Instruction(OpCode.pushConst, text.substring(1, text.length - 1)),
      );
    } else if (ctx.BOOL() != null) {
      instructions.add(
        Instruction(OpCode.pushConst, ctx.BOOL()!.text == 'true'),
      );
    } else if (ctx.NULL() != null) {
      instructions.add(const Instruction(OpCode.pushConst, null));
    }
  }
}
