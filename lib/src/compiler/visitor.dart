import 'package:dscript/dscript.dart';
import 'package:dscript/src/compiler/instructions.dart';
import 'package:dscript/src/gen/antlr/dscriptParser.dart';

/// Default compiler for Dscript scripts.
///
/// This compiler fully trusts that the input script is valid and does not perform any error checking.
class NaiveCompiler extends DscriptCompiler {
  // Default compiler for Dscript scripts.
  ///
  /// This compiler fully trusts that the input script is valid and does not perform any error checking.
  NaiveCompiler() : super();

  @override
  visitAdditiveExpr(AdditiveExprContext ctx) {
    ctx.left?.accept(this);
    ctx.right?.accept(this);

    emit(INSTRUCTION_ADD);
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
    // TODO: implement visitAssignment
    throw UnimplementedError();
  }

  @override
  visitAuthor(AuthorContext ctx) {
    // TODO: implement visitAuthor
    throw UnimplementedError();
  }

  @override
  visitBitwiseExpr(BitwiseExprContext ctx) {
    // TODO: implement visitBitwiseExpr
    throw UnimplementedError();
  }

  @override
  visitBlock(BlockContext ctx) {
    // TODO: implement visitBlock
    throw UnimplementedError();
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
  visitContract(ContractContext ctx) {
    // TODO: implement visitContract
    throw UnimplementedError();
  }

  @override
  visitDataType(DataTypeContext ctx) {
    // TODO: implement visitDataType
    throw UnimplementedError();
  }

  @override
  visitDescription(DescriptionContext ctx) {
    // TODO: implement visitDescription
    throw UnimplementedError();
  }

  @override
  visitElseStmt(ElseStmtContext ctx) {
    // TODO: implement visitElseStmt
    throw UnimplementedError();
  }

  @override
  visitExpr(ExprContext ctx) {
    // TODO: implement visitExpr
    throw UnimplementedError();
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
    // TODO: implement visitIdentifier
    throw UnimplementedError();
  }

  @override
  visitIfStmt(IfStmtContext ctx) {
    // TODO: implement visitIfStmt
    throw UnimplementedError();
  }

  @override
  visitImpl(ImplContext ctx) {
    frame();

    ctx.params()?.accept(this);

    ctx.block()?.accept(this);

    pop();
  }

  @override
  visitLicense(LicenseContext ctx) {
    // TODO: implement visitLicense
    throw UnimplementedError();
  }

  @override
  visitLine(LineContext ctx) {
    // TODO: implement visitLine
    throw UnimplementedError();
  }

  @override
  visitLiteral(LiteralContext ctx) {
    // TODO: implement visitLiteral
    throw UnimplementedError();
  }

  @override
  visitLogicalExpr(LogicalExprContext ctx) {
    // TODO: implement visitLogicalExpr
    throw UnimplementedError();
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
    // TODO: implement visitMultiplicativeExpr
    throw UnimplementedError();
  }

  @override
  visitName(NameContext ctx) {
    // TODO: implement visitName
    throw UnimplementedError();
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
  visitPermissions(PermissionsContext ctx) {
    // TODO: implement visitPermissions
    throw UnimplementedError();
  }

  @override
  visitPositionalArg(PositionalArgContext ctx) {
    // TODO: implement visitPositionalArg
    throw UnimplementedError();
  }

  @override
  visitPrimaryExpr(PrimaryExprContext ctx) {
    // TODO: implement visitPrimaryExpr
    throw UnimplementedError();
  }

  @override
  visitRelationalExpr(RelationalExprContext ctx) {
    // TODO: implement visitRelationalExpr
    throw UnimplementedError();
  }

  @override
  visitRepo(RepoContext ctx) {
    // TODO: implement visitRepo
    throw UnimplementedError();
  }

  @override
  visitReturnStmt(ReturnStmtContext ctx) {
    // TODO: implement visitReturnStmt
    throw UnimplementedError();
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
    // TODO: implement visitShiftExpr
    throw UnimplementedError();
  }

  @override
  visitSimpleAssignment(SimpleAssignmentContext ctx) {
    // TODO: implement visitSimpleAssignment
    throw UnimplementedError();
  }

  @override
  visitStmt(StmtContext ctx) {
    // TODO: implement visitStmt
    throw UnimplementedError();
  }

  @override
  visitSuffixExpr(SuffixExprContext ctx) {
    // TODO: implement visitSuffixExpr
    throw UnimplementedError();
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
    // TODO: implement visitUnaryExpr
    throw UnimplementedError();
  }

  @override
  visitVarDecl(VarDeclContext ctx) {
    // TODO: implement visitVarDecl
    throw UnimplementedError();
  }

  @override
  visitVarType(VarTypeContext ctx) {
    // TODO: implement visitVarType
    throw UnimplementedError();
  }

  @override
  visitVersion(VersionContext ctx) {
    // TODO: implement visitVersion
    throw UnimplementedError();
  }

  @override
  visitWebsite(WebsiteContext ctx) {
    // TODO: implement visitWebsite
    throw UnimplementedError();
  }

  @override
  visitWhileStmt(WhileStmtContext ctx) {
    // TODO: implement visitWhileStmt
    throw UnimplementedError();
  }
}
