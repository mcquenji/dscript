// Generated from dscript.g4 by ANTLR 4.13.2
// coverage:ignore-file
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'dscriptParser.dart';

/// This abstract class defines a complete generic visitor for a parse tree
/// produced by [dscriptParser].
///
/// [T] is the eturn type of the visit operation. Use `void` for
/// operations with no return type.
abstract class dscriptVisitor<T> extends ParseTreeVisitor<T> {
  /// Visit a parse tree produced by [dscriptParser.script].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitScript(ScriptContext ctx);

  /// Visit a parse tree produced by [dscriptParser.metadata].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitMetadata(MetadataContext ctx);

  /// Visit a parse tree produced by [dscriptParser.schema].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitSchema(SchemaContext ctx);

  /// Visit a parse tree produced by [dscriptParser.author].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitAuthor(AuthorContext ctx);

  /// Visit a parse tree produced by [dscriptParser.description].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitDescription(DescriptionContext ctx);

  /// Visit a parse tree produced by [dscriptParser.version].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitVersion(VersionContext ctx);

  /// Visit a parse tree produced by [dscriptParser.license].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitLicense(LicenseContext ctx);

  /// Visit a parse tree produced by [dscriptParser.repo].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitRepo(RepoContext ctx);

  /// Visit a parse tree produced by [dscriptParser.website].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitWebsite(WebsiteContext ctx);

  /// Visit a parse tree produced by [dscriptParser.name].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitName(NameContext ctx);

  /// Visit a parse tree produced by [dscriptParser.permissions].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitPermissions(PermissionsContext ctx);

  /// Visit a parse tree produced by [dscriptParser.permission].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitPermission(PermissionContext ctx);

  /// Visit a parse tree produced by [dscriptParser.contract].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitContract(ContractContext ctx);

  /// Visit a parse tree produced by [dscriptParser.hook].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitHook(HookContext ctx);

  /// Visit a parse tree produced by [dscriptParser.impl].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitImpl(ImplContext ctx);

  /// Visit a parse tree produced by [dscriptParser.func].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitFunc(FuncContext ctx);

  /// Visit a parse tree produced by [dscriptParser.params].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitParams(ParamsContext ctx);

  /// Visit a parse tree produced by [dscriptParser.param].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitParam(ParamContext ctx);

  /// Visit a parse tree produced by [dscriptParser.dataType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitDataType(DataTypeContext ctx);

  /// Visit a parse tree produced by [dscriptParser.stmt].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitStmt(StmtContext ctx);

  /// Visit a parse tree produced by [dscriptParser.throwStmt].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitThrowStmt(ThrowStmtContext ctx);

  /// Visit a parse tree produced by [dscriptParser.ifStmt].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitIfStmt(IfStmtContext ctx);

  /// Visit a parse tree produced by [dscriptParser.elseStmt].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitElseStmt(ElseStmtContext ctx);

  /// Visit a parse tree produced by [dscriptParser.whileStmt].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitWhileStmt(WhileStmtContext ctx);

  /// Visit a parse tree produced by [dscriptParser.forStmt].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitForStmt(ForStmtContext ctx);

  /// Visit a parse tree produced by [dscriptParser.returnStmt].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitReturnStmt(ReturnStmtContext ctx);

  /// Visit a parse tree produced by [dscriptParser.breakStmt].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitBreakStmt(BreakStmtContext ctx);

  /// Visit a parse tree produced by [dscriptParser.continueStmt].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitContinueStmt(ContinueStmtContext ctx);

  /// Visit a parse tree produced by [dscriptParser.tryStmt].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTryStmt(TryStmtContext ctx);

  /// Visit a parse tree produced by [dscriptParser.catchBlock].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitCatchBlock(CatchBlockContext ctx);

  /// Visit a parse tree produced by [dscriptParser.line].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitLine(LineContext ctx);

  /// Visit a parse tree produced by [dscriptParser.varType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitVarType(VarTypeContext ctx);

  /// Visit a parse tree produced by [dscriptParser.assignment].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitAssignment(AssignmentContext ctx);

  /// Visit a parse tree produced by [dscriptParser.simpleAssignment].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitSimpleAssignment(SimpleAssignmentContext ctx);

  /// Visit a parse tree produced by [dscriptParser.compoundAssignment].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitCompoundAssignment(CompoundAssignmentContext ctx);

  /// Visit a parse tree produced by [dscriptParser.varDecl].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitVarDecl(VarDeclContext ctx);

  /// Visit a parse tree produced by [dscriptParser.expr].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitExpr(ExprContext ctx);

  /// Visit a parse tree produced by [dscriptParser.logicalExpr].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitLogicalExpr(LogicalExprContext ctx);

  /// Visit a parse tree produced by [dscriptParser.relationalExpr].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitRelationalExpr(RelationalExprContext ctx);

  /// Visit a parse tree produced by [dscriptParser.bitwiseExpr].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitBitwiseExpr(BitwiseExprContext ctx);

  /// Visit a parse tree produced by [dscriptParser.shiftExpr].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitShiftExpr(ShiftExprContext ctx);

  /// Visit a parse tree produced by [dscriptParser.additiveExpr].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitAdditiveExpr(AdditiveExprContext ctx);

  /// Visit a parse tree produced by [dscriptParser.multiplicativeExpr].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitMultiplicativeExpr(MultiplicativeExprContext ctx);

  /// Visit a parse tree produced by [dscriptParser.unaryExpr].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitUnaryExpr(UnaryExprContext ctx);

  /// Visit a parse tree produced by [dscriptParser.suffixExpr].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitSuffixExpr(SuffixExprContext ctx);

  /// Visit a parse tree produced by [dscriptParser.primaryExpr].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitPrimaryExpr(PrimaryExprContext ctx);

  /// Visit a parse tree produced by [dscriptParser.externalFunctionCall].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitExternalFunctionCall(ExternalFunctionCallContext ctx);

  /// Visit a parse tree produced by [dscriptParser.functionCall].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitFunctionCall(FunctionCallContext ctx);

  /// Visit a parse tree produced by [dscriptParser.args].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitArgs(ArgsContext ctx);

  /// Visit a parse tree produced by [dscriptParser.namedArg].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitNamedArg(NamedArgContext ctx);

  /// Visit a parse tree produced by [dscriptParser.positionalArg].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitPositionalArg(PositionalArgContext ctx);

  /// Visit a parse tree produced by [dscriptParser.literal].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitLiteral(LiteralContext ctx);

  /// Visit a parse tree produced by [dscriptParser.identifier].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitIdentifier(IdentifierContext ctx);

  /// Visit a parse tree produced by [dscriptParser.arrayLiteral].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitArrayLiteral(ArrayLiteralContext ctx);

  /// Visit a parse tree produced by [dscriptParser.objectLiteral].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitObjectLiteral(ObjectLiteralContext ctx);

  /// Visit a parse tree produced by [dscriptParser.objectProperty].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitObjectProperty(ObjectPropertyContext ctx);

  /// Visit a parse tree produced by [dscriptParser.mapLiteral].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitMapLiteral(MapLiteralContext ctx);

  /// Visit a parse tree produced by [dscriptParser.mapEntry].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitMapEntry(MapEntryContext ctx);

  /// Visit a parse tree produced by [dscriptParser.block].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitBlock(BlockContext ctx);
}