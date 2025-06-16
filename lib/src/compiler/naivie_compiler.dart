part of 'compiler.dart';

/// Default compiler for Dscript scripts.
///
/// This compiler fully trusts that the input script is valid and does not perform any error checking.
class NaiveCompiler extends Compiler {
  // Default compiler for Dscript scripts.
  ///
  /// This compiler fully trusts that the input script is valid and does not perform any error checking.
  NaiveCompiler(super.globals) : super();

  /// Counter used for generating unique temporary variable names.
  int _tempCounter = 0;

  /// Returns a unique temporary variable name prefixed with [prefix].
  String _tempVar(String prefix) => '_$prefix${_tempCounter++}';

  @override
  visitAdditiveExpr(AdditiveExprContext ctx) {
    binop(ctx.left, ctx.right, ctx.op?.type, (op) {
      switch (op) {
        case dscriptParser.TOKEN_PLUS:
          return Instruction.add;
        case dscriptParser.TOKEN_MINUS:
          return Instruction.sub;
        default:
          throw StateError('Unknown additive operator: $op');
      }
    });
  }

  @override
  visitArgs(ArgsContext ctx) {
    final args = ctx.positionalArgs();

    if (args.isNotEmpty) {
      for (final arg in args) {
        arg.accept(this);
      }
      emit(Instruction.array, args.length);
    } else {
      emit(Instruction.pushNull); // No positional args, push null
    }

    final namedArgs = ctx.namedArgs();
    if (namedArgs.isNotEmpty) {
      for (final namedArg in namedArgs) {
        namedArg.accept(this);
      }
      emit(Instruction.map, namedArgs.length);
    } else {
      emit(Instruction.pushNull); // No named args, push null
    }
  }

  @override
  visitArrayLiteral(ArrayLiteralContext ctx) {
    final elements = ctx.exprs();
    final count = elements.length;
    for (final element in elements) {
      element.accept(this);
    }
    emit(Instruction.array, count);
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
    frame();
    for (final line in ctx.children ?? ctx.lines()) {
      line.accept(this);
    }
    pop();
  }

  @override
  visitBreakStmt(BreakStmtContext ctx) {
    breakLoop();
  }

  @override
  visitCatchBlock(CatchBlockContext ctx) {
    frame();
    final ident = ctx.identifier()!.text;
    final loc = push(ident);
    emit(Instruction.catchStart, loc.frame, loc.index);
    ctx.block()?.accept(this);
    pop();
  }

  @override
  visitCompoundAssignment(CompoundAssignmentContext ctx) {
    final ident = ctx.identifier()!;

    ident.accept(this);
    ctx.expr()?.accept(this);
    final op = ctx.op?.type;

    switch (op) {
      case dscriptParser.TOKEN_PLUS_ASSIGN:
        emit(Instruction.add);
        break;
      case dscriptParser.TOKEN_MINUS_ASSIGN:
        emit(Instruction.sub);
        break;
      case dscriptParser.TOKEN_MULTIPLY_ASSIGN:
        emit(Instruction.mul);
        break;
      case dscriptParser.TOKEN_DIVIDE_ASSIGN:
        emit(Instruction.div);
        break;
      case dscriptParser.TOKEN_MOD_ASSIGN:
        emit(Instruction.mod);
        break;
      default:
        throw StateError('Unknown compound assignment operator: $op');
    }

    // check if its a property assignment
    if (ident.objIdent != null) {
      final objName = ident.objIdent!.text;
      final objLoc = of(objName);
      emit(Instruction.read, objLoc.frame, objLoc.index);

      final propName = ident.property!.text;
      final propIdx = addConstant(propName);
      emit(Instruction.writeProperty, propIdx);
      return;
    }

    // check if its an indexed assignment
    if (ident.indexIdent != null) {
      final objName = ident.indexIdent!.text;
      final objLoc = of(objName);
      emit(Instruction.read, objLoc.frame, objLoc.index);

      ident.index?.accept(this);

      emit(Instruction.writeElement);
      return;
    }

    // otherwise, it's a simple identifier assignment

    final loc = of(ident.text);

    // Store the result back into the variable
    emit(Instruction.store, loc.frame, loc.index);
  }

  @override
  visitContinueStmt(ContinueStmtContext ctx) {
    jumpToLoopStart();
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
    final namespace = ctx.namespace!.text;
    final name = ctx.functionCall()!.identifier()!.text;
    final args = ctx.functionCall()!.args();

    args?.accept(this);

    emit(Instruction.externalCall, addConstant(namespace), addConstant(name));
  }

  @override
  visitForStmt(ForStmtContext ctx) {
    if (ctx.IN() != null) {
      _compileForIn(ctx);
      return;
    }

    // Initialization runs once before starting the loop.
    ctx.varDecl()?.accept(this);

    startLoop();

    // Evaluate the loop condition.
    ctx.expr()?.accept(this);
    final idx = prepareJump(Instruction.jumpIfFalse);

    // Loop body.
    ctx.block()?.accept(this);

    markContinueTarget();

    // Increment expression.
    ctx.assignment()?.accept(this);

    // Repeat the loop.
    jumpToLoopStart();
    finalizeJump(idx);

    endLoop();
  }

  /// Compiles a `for (var x in iterable)` statement.
  void _compileForIn(ForStmtContext ctx) {
    // Evaluate the iterable expression and store in a temporary variable.
    ctx.expr()!.accept(this);
    final iterableTemp = push(_tempVar('iter'));
    emit(Instruction.store, iterableTemp.frame, iterableTemp.index);

    // Create an index counter starting at 0.
    emit(Instruction.pushConstant, addConstant(0));
    final indexTemp = push(_tempVar('i'));
    emit(Instruction.store, indexTemp.frame, indexTemp.index);

    // Reserve the loop variable.
    final loopVarName = ctx.varDecl()!.identifier()!.text;
    final loopVar = push(loopVarName);
    emit(Instruction.pushNull);
    emit(Instruction.store, loopVar.frame, loopVar.index);

    startLoop();

    // Condition: index < iterable.length
    emit(Instruction.read, indexTemp.frame, indexTemp.index);
    emit(Instruction.read, iterableTemp.frame, iterableTemp.index);

    // push iter on the stack.
    emit(Instruction.read, iterableTemp.frame, iterableTemp.index);

    // Prepare arguments for length call.
    emit(Instruction.array, 1);
    emit(Instruction.pushNull);

    // call dynamic::length(iterable)
    final ns = addConstant(const DynamicBindings().name);
    final method = addConstant(DynamicBindings.lengthBinding.name);
    emit(Instruction.externalCall, ns, method);

    emit(Instruction.lt);
    final idx = prepareJump(Instruction.jumpIfFalse);

    // loopVar = iterable[index]
    emit(Instruction.read, iterableTemp.frame, iterableTemp.index);
    emit(Instruction.read, indexTemp.frame, indexTemp.index);
    emit(Instruction.readElement);
    emit(Instruction.store, loopVar.frame, loopVar.index);

    // Body
    ctx.block()?.accept(this);

    markContinueTarget();

    // index++
    emit(Instruction.read, indexTemp.frame, indexTemp.index);
    emit(Instruction.pushConstant, addConstant(1));
    emit(Instruction.add);
    emit(Instruction.store, indexTemp.frame, indexTemp.index);

    // Loop back
    jumpToLoopStart();
    finalizeJump(idx);

    endLoop();
  }

  @override
  visitFunc(FuncContext ctx) {
    frame();

    final posParams = ctx.pos?.params() ?? [];
    final namedParams = ctx.named?.params() ?? [];

    positionalParams = posParams.length;
    namedParameterIndex.clear();

    for (var i = 0; i < posParams.length; i++) {
      final name = posParams[i].identifier()!.text;
      push(name);
    }

    for (var i = 0; i < namedParams.length; i++) {
      final name = namedParams[i].identifier()!.text;
      push(name);
      namedParameterIndex[name] = positionalParams + i;
    }

    ctx.block()?.accept(this);

    pop();
  }

  @override
  visitFunctionCall(FunctionCallContext ctx) {
    ctx.args()?.accept(this);
    final name = ctx.identifier()!.text;
    emit(Instruction.call, addConstant(name));
  }

  @override
  visitHook(HookContext ctx) {
    frame();

    final params = ctx.params()?.params() ?? [];

    positionalParams = 0;
    namedParameterIndex.clear();

    for (var i = 0; i < params.length; i++) {
      final name = params[i].identifier()!.text;
      push(name);
      namedParameterIndex[name] = i;
    }

    ctx.block()?.accept(this);

    pop();
  }

  @override
  visitIdentifier(IdentifierContext ctx) {
    // Handle property reads
    if (ctx.objIdent != null) {
      final objName = ctx.objIdent!.text;
      final objLoc = of(objName);
      emit(Instruction.read, objLoc.frame, objLoc.index);

      final propName = ctx.property!.text;
      final propIdx = addConstant(propName);
      emit(Instruction.readProperty, propIdx);
      return;
    }

    final name = ctx.text;
    final loc = of(name);
    emit(Instruction.read, loc.frame, loc.index);
  }

  @override
  visitIfStmt(IfStmtContext ctx) {
    ctx.expr()?.accept(this);

    final idx = prepareJump(Instruction.jumpIfFalse);

    ctx.block()?.accept(this);

    finalizeJump(idx);

    ctx.elseStmt()?.accept(this);
  }

  @override
  visitImpl(ImplContext ctx) {
    frame();

    final params = ctx.params()?.params() ?? [];

    positionalParams = 0;
    namedParameterIndex.clear();

    for (var i = 0; i < params.length; i++) {
      final name = params[i].identifier()!.text;
      push(name);
      namedParameterIndex[name] = i;
    }

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
      emit(Instruction.pushNull);
      return;
    }
    final idx = addConstant(value);
    emit(Instruction.pushConstant, idx);
  }

  @override
  visitLogicalExpr(LogicalExprContext ctx) {
    binop(ctx.left, ctx.right, ctx.op?.type, (op) {
      switch (op) {
        case dscriptParser.TOKEN_AND:
          return Instruction.and;
        case dscriptParser.TOKEN_OR:
          return Instruction.or;
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
    emit(Instruction.map, count);
  }

  @override
  visitMultiplicativeExpr(MultiplicativeExprContext ctx) {
    binop(ctx.left, ctx.right, ctx.op?.type, (op) {
      switch (op) {
        case dscriptParser.TOKEN_MULTIPLY:
          return Instruction.mul;
        case dscriptParser.TOKEN_DIVIDE:
          return Instruction.div;
        case dscriptParser.TOKEN_MOD:
          return Instruction.mod;
        default:
          throw StateError('Unknown multiplicative operator: $op');
      }
    });
  }

  @override
  visitNamedArg(NamedArgContext ctx) {
    final name = ctx.identifier()!.text;
    final idx = addConstant(name);
    emit(Instruction.pushConstant, idx);

    // Accept the expression for the argument value
    // to push it onto the stack
    ctx.expr()?.accept(this);
  }

  @override
  visitObjectLiteral(ObjectLiteralContext ctx) {
    final type = ctx.identifier()!.text;
    final properties = ctx.objectPropertys();
    final count = properties.length;

    for (final property in properties) {
      property.accept(this);
    }

    emit(Instruction.map, count);
    emit(Instruction.structFromMap, addConstant(type));
  }

  @override
  visitObjectProperty(ObjectPropertyContext ctx) {
    final name = ctx.identifier()!.text;

    // Push the property name as a constant
    final idx = addConstant(name);
    emit(Instruction.pushConstant, idx);

    // Accept the expression for the property value
    // to push it onto the stack
    ctx.expr()?.accept(this);
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
  visitPositionalArg(PositionalArgContext ctx) {
    ctx.expr()?.accept(this);
  }

  @override
  visitPrimaryExpr(PrimaryExprContext ctx) {
    if (ctx.literal() != null) {
      ctx.literal()!.accept(this);
    } else if (ctx.identifier() != null) {
      ctx.identifier()!.accept(this);
    } else if (ctx.expr() != null) {
      ctx.expr()!.accept(this);
    } else if (ctx.externalFunctionCall() != null) {
      ctx.externalFunctionCall()!.accept(this);
    } else if (ctx.functionCall() != null) {
      ctx.functionCall()!.accept(this);
    }
  }

  @override
  visitRelationalExpr(RelationalExprContext ctx) {
    binop(ctx.left, ctx.right, ctx.op?.type, (op) {
      switch (op) {
        case dscriptParser.TOKEN_LT:
          return Instruction.lt;
        case dscriptParser.TOKEN_GT:
          return Instruction.gt;
        case dscriptParser.TOKEN_LTE:
          return Instruction.lte;
        case dscriptParser.TOKEN_GTE:
          return Instruction.gte;
        case dscriptParser.TOKEN_EQ:
          return Instruction.eq;
        case dscriptParser.TOKEN_NE:
          return Instruction.neq;
        default:
          throw StateError('Unknown relational operator: $op');
      }
    });
  }

  /// Helper method to handle binary operations.
  /// It accepts two expressions, an operator, and a function that returns the corresponding instruction based on the operator.
  /// If the right expression is null, it simply returns without emitting any additional instructions aside from the left expression.
  void binop(
    ParserRuleContext? left,
    ParserRuleContext? right,
    int? op,
    int Function(int) instruction,
  ) {
    if (right != null && op != null) {
      // This is a binary operation with both left and right operands.

      // Push the right operand first so the left operand is on the stack first.
      right.accept(this);
      left!.accept(this);

      // Emit the instruction for the binary operation last.
      emit(instruction(op));
    } else if (left != null) {
      // If there's no right operand, we just push the left operand.
      left.accept(this);
    }
  }

  @override
  visitReturnStmt(ReturnStmtContext ctx) {
    ctx.expr()?.accept(this);
    emit(Instruction.ret);
  }

  @override
  visitShiftExpr(ShiftExprContext ctx) {
    binop(ctx.left, ctx.right, ctx.op?.type, (op) {
      switch (op) {
        case dscriptParser.TOKEN_BIT_LEFT_SHIFT:
          return Instruction.shl;
        case dscriptParser.TOKEN_BIT_RIGHT_SHIFT:
          return Instruction.shr;
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
    emit(Instruction.store, loc.frame, loc.index);
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
    ctx.assignment()?.accept(this);
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
        emit(Instruction.inc);
        break;
      case dscriptParser.TOKEN_MINUS_MINUS:
        emit(Instruction.dec);
        break;
      default:
        throw StateError('Unknown suffix operator: $op');
    }
  }

  @override
  visitThrowStmt(ThrowStmtContext ctx) {
    ctx.expr()?.accept(this);
    emit(Instruction.throw_);
  }

  @override
  visitTryStmt(TryStmtContext ctx) {
    final catchJump = prepareJump(Instruction.tryStart);
    ctx.block()?.accept(this);
    final endJump = prepareJump(Instruction.jump);
    finalizeJump(catchJump);
    ctx.catchBlock()?.accept(this);
    finalizeJump(endJump);
    emit(Instruction.endTry);
  }

  @override
  visitUnaryExpr(UnaryExprContext ctx) {
    if (ctx.suffixExpr() != null) {
      ctx.suffixExpr()!.accept(this);
    } else if (ctx.unaryExpr() != null) {
      ctx.unaryExpr()!.accept(this);
      final op = ctx.op?.type;
      if (op == dscriptParser.TOKEN_MINUS) {
        emit(Instruction.neg);
      } else if (op == dscriptParser.TOKEN_NOT) {
        emit(Instruction.not);
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
      emit(Instruction.pushNull);
    }

    final loc = push(name);

    // Store the value in the variable
    emit(Instruction.store, loc.frame, loc.index);
  }

  /// No-op for variable type declarations.
  @override
  visitVarType(VarTypeContext ctx) {}

  @override
  visitWhileStmt(WhileStmtContext ctx) {
    startLoop();

    ctx.expr()?.accept(this);
    final idx = prepareJump(Instruction.jumpIfFalse);
    ctx.block()?.accept(this);
    jumpToLoopStart();
    finalizeJump(idx);
    endLoop();
  }
}
