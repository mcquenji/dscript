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
    final elements = ctx.exprs();
    final count = elements.length;
    for (final element in elements) {
      element.accept(this);
    }
    emit(INSTRUCTION_ARRAY, count);
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
    final name = ctx.identifier()!.text;
    final loc = of(name);

    emit(INSTRUCTION_READ, loc.frame, loc.index);
    ctx.expr()?.accept(this);
    final op = ctx.op?.type;

    switch (op) {
      case dscriptParser.TOKEN_PLUS_ASSIGN:
        emit(INSTRUCTION_ADD);
        break;
      case dscriptParser.TOKEN_MINUS_ASSIGN:
        emit(INSTRUCTION_SUB);
        break;
      case dscriptParser.TOKEN_MULTIPLY_ASSIGN:
        emit(INSTRUCTION_MUL);
        break;
      case dscriptParser.TOKEN_DIVIDE_ASSIGN:
        emit(INSTRUCTION_DIV);
        break;
      case dscriptParser.TOKEN_MOD_ASSIGN:
        emit(INSTRUCTION_MOD);
        break;
      default:
        throw StateError('Unknown compound assignment operator: $op');
    }
    // Store the result back into the variable
    emit(INSTRUCTION_STORE, loc.frame, loc.index);
  }

  @override
  visitContinueStmt(ContinueStmtContext ctx) {
    // TODO: implement visitContinueStmt
    throw UnimplementedError();
  }

  @override
  visitElseStmt(ElseStmtContext ctx) {
    ctx.ifStmt()?.accept(this);
    ctx.block()?.accept(this);
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
    emit(INSTRUCTION_READ, loc.frame, loc.index);
  }

  @override
  visitIfStmt(IfStmtContext ctx) {
    ctx.expr()?.accept(this);

    final idx = prepareJump(INSTRUCTION_JUMP_IF_FALSE);

    ctx.block()?.accept(this);

    finalizeJump(idx);

    ctx.elseStmt()?.accept(this);
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
    if (ctx.objectLiteral() != null) {
      ctx.objectLiteral()!.accept(this);
      return;
    } else if (ctx.arrayLiteral() != null) {
      ctx.arrayLiteral()!.accept(this);
      return;
    } else if (ctx.mapLiteral() != null) {
      ctx.mapLiteral()!.accept(this);
      return;
    }

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
    binop(ctx.left, ctx.right, ctx.op?.type, (op) {
      switch (op) {
        case dscriptParser.TOKEN_AND:
          return INSTRUCTION_AND;
        case dscriptParser.TOKEN_OR:
          return INSTRUCTION_OR;
        default:
          throw StateError('Unknown logical operator: $op');
      }
    });
  }

  @override
  visitMapEntry(MapEntryContext ctx) {
    ctx.key?.accept(this);
    ctx.value?.accept(this);
  }

  @override
  visitMapLiteral(MapLiteralContext ctx) {
    final entries = ctx.mapEntrys();
    final count = entries.length;
    for (final entry in entries) {
      entry.accept(this);
    }
    emit(INSTRUCTION_MAP, count);
  }

  @override
  visitMultiplicativeExpr(MultiplicativeExprContext ctx) {
    binop(ctx.left, ctx.right, ctx.op?.type, (op) {
      switch (op) {
        case dscriptParser.TOKEN_MULTIPLY:
          return INSTRUCTION_MUL;
        case dscriptParser.TOKEN_DIVIDE:
          return INSTRUCTION_DIV;
        case dscriptParser.TOKEN_MOD:
          return INSTRUCTION_MOD;
        default:
          throw StateError('Unknown multiplicative operator: $op');
      }
    });
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
    binop(ctx.left, ctx.right, ctx.op?.type, (op) {
      switch (op) {
        case dscriptParser.TOKEN_LT:
          return INSTRUCTION_LT;
        case dscriptParser.TOKEN_GT:
          return INSTRUCTION_GT;
        case dscriptParser.TOKEN_LTE:
          return INSTRUCTION_LTE;
        case dscriptParser.TOKEN_GTE:
          return INSTRUCTION_GTE;
        case dscriptParser.TOKEN_EQ:
          return INSTRUCTION_EQ;
        case dscriptParser.TOKEN_NE:
          return INSTRUCTION_NEQ;
        default:
          throw StateError('Unknown relational operator: $op');
      }
    });
  }

  /// Helper method to handle binary operations.
  /// It accepts two expressions, an operator, and a function that returns the corresponding instruction.
  /// If the right expression is null, it simply returns without emitting any additional instructions aside from the left expression.
  void binop(
    ParserRuleContext? left,
    ParserRuleContext? right,
    int? op,
    int Function(int) instruction,
  ) {
    left!.accept(this);
    if (right == null || op == null) {
      // If there's no right expression or operator, we just return after processing the left expression.
      return;
    }
    right.accept(this);
    emit(instruction(op));
  }

  @override
  visitReturnStmt(ReturnStmtContext ctx) {
    ctx.expr()?.accept(this);
    emit(INSTRUCTION_RETURN);
  }

  @override
  visitShiftExpr(ShiftExprContext ctx) {
    binop(ctx.left, ctx.right, ctx.op?.type, (op) {
      switch (op) {
        case dscriptParser.TOKEN_BIT_LEFT_SHIFT:
          return INSTRUCTION_SHL;
        case dscriptParser.TOKEN_BIT_RIGHT_SHIFT:
          return INSTRUCTION_SHR;
        default:
          throw StateError('Unknown shift operator: $op');
      }
    });
  }

  @override
  visitSimpleAssignment(SimpleAssignmentContext ctx) {
    final name = ctx.identifier()!.text;

    final loc = of(name);
    ctx.expr()?.accept(this);

    // Store the value in the variable
    emit(INSTRUCTION_STORE, loc.frame, loc.index);
  }

  @override
  visitStmt(StmtContext ctx) {
    ctx.returnStmt()?.accept(this);
    ctx.varDecl()?.accept(this);
    ctx.ifStmt()?.accept(this);
    ctx.forStmt()?.accept(this);
    ctx.whileStmt()?.accept(this);
    ctx.breakStmt()?.accept(this);
    ctx.continueStmt()?.accept(this);
    ctx.throwStmt()?.accept(this);
    ctx.tryStmt()?.accept(this);
    ctx.throwStmt()?.accept(this);
  }

  @override
  visitSuffixExpr(SuffixExprContext ctx) {
    ctx.primaryExpr()?.accept(this);

    final op = ctx.op?.type;

    if (op == null) {
      return;
    }

    switch (op) {
      case dscriptParser.TOKEN_PLUS_PLUS:
        emit(INSTRUCTION_INC);
        break;
      case dscriptParser.TOKEN_MINUS_MINUS:
        emit(INSTRUCTION_DEC);
        break;
      default:
        throw StateError('Unknown suffix operator: $op');
    }
  }

  @override
  visitThrowStmt(ThrowStmtContext ctx) {
    ctx.expr()?.accept(this);
    emit(INSTRUCTION_THROW);
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
    print('Visiting variable declaration: ${ctx.text}');

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

    final loc = push(name);

    // Store the value in the variable
    emit(INSTRUCTION_STORE, loc.frame, loc.index);
  }

  /// No-op for variable type declarations.
  @override
  visitVarType(VarTypeContext ctx) {}

  @override
  visitWhileStmt(WhileStmtContext ctx) {
    // TODO: implement visitWhileStmt
    throw UnimplementedError();
  }
}
