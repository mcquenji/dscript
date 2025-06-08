part of 'compiler.dart';

/// Default compiler for Dscript scripts.
///
/// This compiler fully trusts that the input script is valid and does not perform any error checking.
class NaiveCompiler extends DscriptCompiler {
  // Default compiler for Dscript scripts.
  ///
  /// This compiler fully trusts that the input script is valid and does not perform any error checking.
  NaiveCompiler(super.globals) : super();

  @override
  visitAdditiveExpr(AdditiveExprContext ctx) {
    final exprs = ctx.multiplicativeExprs();
    exprs[0].accept(this);
    final tokens = ctx.children!.whereType<TerminalNode>().toList();
    for (var i = 1; i < exprs.length; i++) {
      exprs[i].accept(this);
      final op = tokens[i - 1].symbol.type;
      if (op == dscriptParser.TOKEN_PLUS) {
        emit(INSTRUCTION_ADD);
      } else {
        emit(INSTRUCTION_SUB);
      }
    }
  }

  @override
  visitArgs(ArgsContext ctx) {
    throw UnimplementedError();
  }

  @override
  visitArrayLiteral(ArrayLiteralContext ctx) {
    // TODO: implement visitArrayLiteral
    throw UnimplementedError();
  }

  @override
  visitAssignment(AssignmentContext ctx) {
    ctx.compoundAssignment()?.accept(this);
    ctx.simpleAssignment()?.accept(this);
  }

  @override
  visitBitwiseExpr(BitwiseExprContext ctx) {
    return super.visitChildren(ctx);
  }

  @override
  visitBlock(BlockContext ctx) {
    for (final line in ctx.children ?? ctx.lines()) {
      line.accept(this);
    }
  }

  @override
  visitBreakStmt(BreakStmtContext ctx) {
    // TODO: implement visitBreakStmt
    throw UnimplementedError();
  }

  @override
  visitCatchBlock(CatchBlockContext ctx) {
    // TODO: implement visitCatchBlock
    throw UnimplementedError();
  }

  @override
  visitCompoundAssignment(CompoundAssignmentContext ctx) {
    // TODO: implement visitCompoundAssignment
    throw UnimplementedError();
  }

  @override
  visitContinueStmt(ContinueStmtContext ctx) {
    // TODO: implement visitContinueStmt
    throw UnimplementedError();
  }

  @override
  visitElseStmt(ElseStmtContext ctx) {
    // TODO: implement visitElseStmt
    throw UnimplementedError();
  }

  @override
  visitExpr(ExprContext ctx) {
    ctx.logicalExpr()?.accept(this);
  }

  @override
  visitExternalFunctionCall(ExternalFunctionCallContext ctx) {
    // TODO: implement visitExternalFunctionCall
    throw UnimplementedError();
  }

  @override
  visitForStmt(ForStmtContext ctx) {
    // TODO: implement visitForStmt
    throw UnimplementedError();
  }

  @override
  visitFunc(FuncContext ctx) {
    // TODO: implement visitFunc
    throw UnimplementedError();
  }

  @override
  visitFunctionCall(FunctionCallContext ctx) {
    // TODO: implement visitFunctionCall
    throw UnimplementedError();
  }

  @override
  visitHook(HookContext ctx) {
    frame();

    ctx.params()?.accept(this);

    ctx.block()?.accept(this);

    pop();
  }

  @override
  visitIdentifier(IdentifierContext ctx) {
    final name = ctx.text;
    final loc = of(name);
    final diff = currentFrame - loc.frame;
    emit(INSTRUCTION_READ, diff, loc.index);
  }

  @override
  visitIfStmt(IfStmtContext ctx) {
    ctx.expr()?.accept(this);

    final idx = prepareJump(INSTRUCTION_JUMP_IF_FALSE);

    ctx.block()?.accept(this);

    finalizeJump(idx);
  }

  @override
  visitImpl(ImplContext ctx) {
    frame();
    ctx.params()?.accept(this);

    ctx.block()?.accept(this);

    pop();
  }

  @override
  visitLine(LineContext ctx) {
    if (ctx.stmt() != null) {
      ctx.stmt()!.accept(this);
    } else if (ctx.expr() != null) {
      ctx.expr()!.accept(this);
    } else if (ctx.block() != null) {
      ctx.block()!.accept(this);
    }
  }

  @override
  visitLiteral(LiteralContext ctx) {
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
      emit(INSTRUCTION_PUSH_NULL);
      return;
    }
    final idx = addConstant(value);
    emit(INSTRUCTION_PUSH_CONSTANT, idx);
  }

  @override
  visitLogicalExpr(LogicalExprContext ctx) {
    final exprs = ctx.relationalExprs();
    exprs[0].accept(this);
    final tokens = ctx.children!.whereType<TerminalNode>().toList();
    for (var i = 1; i < exprs.length; i++) {
      exprs[i].accept(this);
      final op = tokens[i - 1].symbol.type;
      if (op == dscriptParser.TOKEN_AND) {
        emit(INSTRUCTION_AND);
      } else {
        emit(INSTRUCTION_OR);
      }
    }
  }

  @override
  visitMapEntry(MapEntryContext ctx) {
    // TODO: implement visitMapEntry
    throw UnimplementedError();
  }

  @override
  visitMapLiteral(MapLiteralContext ctx) {
    // TODO: implement visitMapLiteral
    throw UnimplementedError();
  }

  @override
  visitMetadata(MetadataContext ctx) {
    // TODO: implement visitMetadata
    throw UnimplementedError();
  }

  @override
  visitMultiplicativeExpr(MultiplicativeExprContext ctx) {
    final exprs = ctx.unaryExprs();
    exprs[0].accept(this);
    final tokens = ctx.children!.whereType<TerminalNode>().toList();
    for (var i = 1; i < exprs.length; i++) {
      exprs[i].accept(this);
      final op = tokens[i - 1].symbol.type;
      if (op == dscriptParser.TOKEN_MULTIPLY) {
        emit(INSTRUCTION_MUL);
      } else if (op == dscriptParser.TOKEN_DIVIDE) {
        emit(INSTRUCTION_DIV);
      } else {
        emit(INSTRUCTION_MOD);
      }
    }
  }

  @override
  visitNamedArg(NamedArgContext ctx) {
    // TODO: implement visitNamedArg
    throw UnimplementedError();
  }

  @override
  visitObjectLiteral(ObjectLiteralContext ctx) {
    // TODO: implement visitObjectLiteral
    throw UnimplementedError();
  }

  @override
  visitObjectProperty(ObjectPropertyContext ctx) {
    // TODO: implement visitObjectProperty
    throw UnimplementedError();
  }

  @override
  visitParam(ParamContext ctx) {
    final name = ctx.identifier()?.text ?? '';
    push(name);
  }

  @override
  visitParams(ParamsContext ctx) {
    for (final param in ctx.params()) {
      param.accept(this);
    }
  }

  @override
  visitPermission(PermissionContext ctx) {
    // TODO: implement visitPermission
    throw UnimplementedError();
  }

  @override
  visitPositionalArg(PositionalArgContext ctx) {
    // TODO: implement visitPositionalArg
    throw UnimplementedError();
  }

  @override
  visitPrimaryExpr(PrimaryExprContext ctx) {
    if (ctx.literal() != null) {
      ctx.literal()!.accept(this);
    } else if (ctx.identifier() != null) {
      ctx.identifier()!.accept(this);
    } else if (ctx.expr() != null) {
      ctx.expr()!.accept(this);
    }
  }

  @override
  visitRelationalExpr(RelationalExprContext ctx) {
    final exprs = ctx.bitwiseExprs();
    exprs[0].accept(this);
    final tokens = ctx.children!.whereType<TerminalNode>().toList();
    for (var i = 1; i < exprs.length; i++) {
      exprs[i].accept(this);
      final op = tokens[i - 1].symbol.type;
      switch (op) {
        case dscriptParser.TOKEN_EQ:
          emit(INSTRUCTION_EQ);
          break;
        case dscriptParser.TOKEN_NE:
          emit(INSTRUCTION_NEQ);
          break;
        case dscriptParser.TOKEN_LT:
          emit(INSTRUCTION_LT);
          break;
        case dscriptParser.TOKEN_GT:
          emit(INSTRUCTION_GT);
          break;
        case dscriptParser.TOKEN_LTE:
          emit(INSTRUCTION_LTE);
          break;
        case dscriptParser.TOKEN_GTE:
          emit(INSTRUCTION_GTE);
          break;
      }
    }
  }

  @override
  visitReturnStmt(ReturnStmtContext ctx) {
    ctx.expr()?.accept(this);
    emit(INSTRUCTION_RETURN);
  }

  @override
  visitSchema(SchemaContext ctx) {
    // TODO: implement visitSchema
    throw UnimplementedError();
  }

  @override
  visitScript(ScriptContext ctx) {
    // TODO: implement visitScript
    throw UnimplementedError();
  }

  @override
  visitShiftExpr(ShiftExprContext ctx) {
    return super.visitChildren(ctx);
  }

  @override
  visitSimpleAssignment(SimpleAssignmentContext ctx) {
    // TODO: implement visitSimpleAssignment
    throw UnimplementedError();
  }

  @override
  visitStmt(StmtContext ctx) {
    ctx.returnStmt()?.accept(this);
  }

  @override
  visitSuffixExpr(SuffixExprContext ctx) {
    ctx.primaryExpr()?.accept(this);
  }

  @override
  visitThrowStmt(ThrowStmtContext ctx) {
    // TODO: implement visitThrowStmt
    throw UnimplementedError();
  }

  @override
  visitTryStmt(TryStmtContext ctx) {
    // TODO: implement visitTryStmt
    throw UnimplementedError();
  }

  @override
  visitUnaryExpr(UnaryExprContext ctx) {
    if (ctx.suffixExpr() != null) {
      ctx.suffixExpr()!.accept(this);
    } else if (ctx.unaryExpr() != null) {
      ctx.unaryExpr()!.accept(this);
      final op = ctx.op?.type;
      if (op == dscriptParser.TOKEN_MINUS) {
        emit(INSTRUCTION_NEG);
      } else if (op == dscriptParser.TOKEN_NOT) {
        emit(INSTRUCTION_NOT);
      }
    }
  }

  @override
  visitVarDecl(VarDeclContext ctx) {
    final name = ctx.identifier()?.text ??
        ctx.assignment()?.simpleAssignment()?.identifier()?.text;

    if (name == null) {
      throw StateError('Variable declaration without name');
    }

    final initializer = ctx.assignment()?.simpleAssignment()?.expr();

    if (initializer != null) {
      initializer.accept(this);
    } else {
      emit(INSTRUCTION_PUSH_NULL);
    }

    push(name);
  }

  @override
  visitVarType(VarTypeContext ctx) {
    // TODO: implement visitVarType
    throw UnimplementedError();
  }

  @override
  visitWhileStmt(WhileStmtContext ctx) {
    // TODO: implement visitWhileStmt
    throw UnimplementedError();
  }
}
