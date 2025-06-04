import 'dart:typed_data';

import 'package:antlr4/antlr4.dart';
import 'package:dscript/src/analyzer/analyzer.dart';
import 'package:dscript/src/permissions.dart';
import 'package:dscript/src/gen/antlr/dscriptBaseVisitor.dart';
import 'package:dscript/src/gen/antlr/dscriptLexer.dart';
import 'package:dscript/src/gen/antlr/dscriptParser.dart';

import 'instruction.dart';

/// Result of compiling a script.
class CompiledScript {
  /// Bytecode for each implementation.
  final Map<String, BytecodeFunction> implementations;

  /// Bytecode for each hook.
  final Map<String, BytecodeFunction> hooks;

  /// Permissions required by the script.
  final List<ScriptPermission> permissions;

  /// Creates a compiled script with [implementations], [hooks] and [permissions].
  const CompiledScript({
    required this.implementations,
    required this.hooks,
    required this.permissions,
  });
}

/// Compiles an analyzed [script] into a [CompiledScript].
CompiledScript compileScript(Script script) {
  final impls = <String, BytecodeFunction>{};
  final hooks = <String, BytecodeFunction>{};

  for (final entry in script.implementations.entries) {
    final visitor = _CompileVisitor();
    entry.value.accept(visitor);
    impls[entry.key] = visitor.build();
  }

  for (final entry in script.hooks.entries) {
    final visitor = _CompileVisitor();
    entry.value.accept(visitor);
    hooks[entry.key] = visitor.build();
  }

  return CompiledScript(
    implementations: impls,
    hooks: hooks,
    permissions: script.permissions,
  );
}

class _CompileVisitor extends dscriptBaseVisitor<void> {
  final List<int> _code = [];
  final List<Object?> _constants = [];
  final Map<Object?, int> _constMap = {};

  BytecodeFunction build() {
    return BytecodeFunction(
      Uint32List.fromList(_code),
      List.unmodifiable(_constants),
    );
  }

  int _addConst(Object? value) {
    final existing = _constMap[value];
    if (existing != null) return existing;
    final index = _constants.length;
    _constants.add(value);
    _constMap[value] = index;
    return index;
  }

  void _emit(OpCode op, [int? operand]) {
    _code.add(op.index);
    if (operand != null) _code.add(operand);
  }

  @override
  void visitReturnStmt(ReturnStmtContext ctx) {
    ctx.expr()?.accept(this);
    _emit(OpCode.ret);
  }

  @override
  void visitAdditiveExpr(AdditiveExprContext ctx) {
    final exprs = ctx.multiplicativeExprs();
    exprs[0].accept(this);
    final ops = ctx.children!.whereType<TerminalNode>().toList();
    for (var i = 1; i < exprs.length; i++) {
      exprs[i].accept(this);
      final op = ops[i - 1].symbol.type;
      if (op == dscriptLexer.TOKEN_PLUS) {
        _emit(OpCode.add);
      } else {
        _emit(OpCode.sub);
      }
    }
  }

  @override
  void visitMultiplicativeExpr(MultiplicativeExprContext ctx) {
    final exprs = ctx.unaryExprs();
    exprs[0].accept(this);
    final ops = ctx.children!.whereType<TerminalNode>().toList();
    for (var i = 1; i < exprs.length; i++) {
      exprs[i].accept(this);
      final op = ops[i - 1].symbol.type;
      if (op == dscriptLexer.TOKEN_MULTIPLY) {
        _emit(OpCode.mul);
      } else if (op == dscriptLexer.TOKEN_DIVIDE) {
        _emit(OpCode.div);
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
        _emit(OpCode.neg);
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
      final id = _addConst(ctx.identifier()!.text);
      _emit(OpCode.loadVar, id);
    } else if (ctx.expr() != null) {
      ctx.expr()!.accept(this);
    }
  }

  @override
  void visitLiteral(LiteralContext ctx) {
    Object? value;
    if (ctx.INT() != null) {
      value = int.parse(ctx.INT()!.text!);
    } else if (ctx.DOUBLE() != null) {
      value = double.parse(ctx.DOUBLE()!.text!);
    } else if (ctx.STRING() != null) {
      final text = ctx.STRING()!.text!;
      value = text.substring(1, text.length - 1);
    } else if (ctx.BOOL() != null) {
      value = ctx.BOOL()!.text == 'true';
    } else if (ctx.NULL() != null) {
      value = null;
    }
    final idx = _addConst(value);
    _emit(OpCode.pushConst, idx);
  }
}
