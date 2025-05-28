// Generated from dscript.g4 by ANTLR 4.13.2
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'dscriptParser.dart';

/// This abstract class defines a complete listener for a parse tree produced by
/// [dscriptParser].
abstract class dscriptListener extends ParseTreeListener {
  /// Enter a parse tree produced by [dscriptParser.script].
  /// [ctx] the parse tree
  void enterScript(ScriptContext ctx);
  /// Exit a parse tree produced by [dscriptParser.script].
  /// [ctx] the parse tree
  void exitScript(ScriptContext ctx);

  /// Enter a parse tree produced by [dscriptParser.metadata].
  /// [ctx] the parse tree
  void enterMetadata(MetadataContext ctx);
  /// Exit a parse tree produced by [dscriptParser.metadata].
  /// [ctx] the parse tree
  void exitMetadata(MetadataContext ctx);

  /// Enter a parse tree produced by [dscriptParser.author].
  /// [ctx] the parse tree
  void enterAuthor(AuthorContext ctx);
  /// Exit a parse tree produced by [dscriptParser.author].
  /// [ctx] the parse tree
  void exitAuthor(AuthorContext ctx);

  /// Enter a parse tree produced by [dscriptParser.description].
  /// [ctx] the parse tree
  void enterDescription(DescriptionContext ctx);
  /// Exit a parse tree produced by [dscriptParser.description].
  /// [ctx] the parse tree
  void exitDescription(DescriptionContext ctx);

  /// Enter a parse tree produced by [dscriptParser.version].
  /// [ctx] the parse tree
  void enterVersion(VersionContext ctx);
  /// Exit a parse tree produced by [dscriptParser.version].
  /// [ctx] the parse tree
  void exitVersion(VersionContext ctx);

  /// Enter a parse tree produced by [dscriptParser.license].
  /// [ctx] the parse tree
  void enterLicense(LicenseContext ctx);
  /// Exit a parse tree produced by [dscriptParser.license].
  /// [ctx] the parse tree
  void exitLicense(LicenseContext ctx);

  /// Enter a parse tree produced by [dscriptParser.repo].
  /// [ctx] the parse tree
  void enterRepo(RepoContext ctx);
  /// Exit a parse tree produced by [dscriptParser.repo].
  /// [ctx] the parse tree
  void exitRepo(RepoContext ctx);

  /// Enter a parse tree produced by [dscriptParser.website].
  /// [ctx] the parse tree
  void enterWebsite(WebsiteContext ctx);
  /// Exit a parse tree produced by [dscriptParser.website].
  /// [ctx] the parse tree
  void exitWebsite(WebsiteContext ctx);

  /// Enter a parse tree produced by [dscriptParser.name].
  /// [ctx] the parse tree
  void enterName(NameContext ctx);
  /// Exit a parse tree produced by [dscriptParser.name].
  /// [ctx] the parse tree
  void exitName(NameContext ctx);

  /// Enter a parse tree produced by [dscriptParser.permissions].
  /// [ctx] the parse tree
  void enterPermissions(PermissionsContext ctx);
  /// Exit a parse tree produced by [dscriptParser.permissions].
  /// [ctx] the parse tree
  void exitPermissions(PermissionsContext ctx);

  /// Enter a parse tree produced by [dscriptParser.permission].
  /// [ctx] the parse tree
  void enterPermission(PermissionContext ctx);
  /// Exit a parse tree produced by [dscriptParser.permission].
  /// [ctx] the parse tree
  void exitPermission(PermissionContext ctx);

  /// Enter a parse tree produced by [dscriptParser.contract].
  /// [ctx] the parse tree
  void enterContract(ContractContext ctx);
  /// Exit a parse tree produced by [dscriptParser.contract].
  /// [ctx] the parse tree
  void exitContract(ContractContext ctx);

  /// Enter a parse tree produced by [dscriptParser.hook].
  /// [ctx] the parse tree
  void enterHook(HookContext ctx);
  /// Exit a parse tree produced by [dscriptParser.hook].
  /// [ctx] the parse tree
  void exitHook(HookContext ctx);

  /// Enter a parse tree produced by [dscriptParser.impl].
  /// [ctx] the parse tree
  void enterImpl(ImplContext ctx);
  /// Exit a parse tree produced by [dscriptParser.impl].
  /// [ctx] the parse tree
  void exitImpl(ImplContext ctx);

  /// Enter a parse tree produced by [dscriptParser.func].
  /// [ctx] the parse tree
  void enterFunc(FuncContext ctx);
  /// Exit a parse tree produced by [dscriptParser.func].
  /// [ctx] the parse tree
  void exitFunc(FuncContext ctx);

  /// Enter a parse tree produced by [dscriptParser.params].
  /// [ctx] the parse tree
  void enterParams(ParamsContext ctx);
  /// Exit a parse tree produced by [dscriptParser.params].
  /// [ctx] the parse tree
  void exitParams(ParamsContext ctx);

  /// Enter a parse tree produced by [dscriptParser.param].
  /// [ctx] the parse tree
  void enterParam(ParamContext ctx);
  /// Exit a parse tree produced by [dscriptParser.param].
  /// [ctx] the parse tree
  void exitParam(ParamContext ctx);

  /// Enter a parse tree produced by [dscriptParser.dataType].
  /// [ctx] the parse tree
  void enterDataType(DataTypeContext ctx);
  /// Exit a parse tree produced by [dscriptParser.dataType].
  /// [ctx] the parse tree
  void exitDataType(DataTypeContext ctx);

  /// Enter a parse tree produced by [dscriptParser.stmt].
  /// [ctx] the parse tree
  void enterStmt(StmtContext ctx);
  /// Exit a parse tree produced by [dscriptParser.stmt].
  /// [ctx] the parse tree
  void exitStmt(StmtContext ctx);

  /// Enter a parse tree produced by [dscriptParser.throwStmt].
  /// [ctx] the parse tree
  void enterThrowStmt(ThrowStmtContext ctx);
  /// Exit a parse tree produced by [dscriptParser.throwStmt].
  /// [ctx] the parse tree
  void exitThrowStmt(ThrowStmtContext ctx);

  /// Enter a parse tree produced by [dscriptParser.ifStmt].
  /// [ctx] the parse tree
  void enterIfStmt(IfStmtContext ctx);
  /// Exit a parse tree produced by [dscriptParser.ifStmt].
  /// [ctx] the parse tree
  void exitIfStmt(IfStmtContext ctx);

  /// Enter a parse tree produced by [dscriptParser.elseStmt].
  /// [ctx] the parse tree
  void enterElseStmt(ElseStmtContext ctx);
  /// Exit a parse tree produced by [dscriptParser.elseStmt].
  /// [ctx] the parse tree
  void exitElseStmt(ElseStmtContext ctx);

  /// Enter a parse tree produced by [dscriptParser.whileStmt].
  /// [ctx] the parse tree
  void enterWhileStmt(WhileStmtContext ctx);
  /// Exit a parse tree produced by [dscriptParser.whileStmt].
  /// [ctx] the parse tree
  void exitWhileStmt(WhileStmtContext ctx);

  /// Enter a parse tree produced by [dscriptParser.forStmt].
  /// [ctx] the parse tree
  void enterForStmt(ForStmtContext ctx);
  /// Exit a parse tree produced by [dscriptParser.forStmt].
  /// [ctx] the parse tree
  void exitForStmt(ForStmtContext ctx);

  /// Enter a parse tree produced by [dscriptParser.returnStmt].
  /// [ctx] the parse tree
  void enterReturnStmt(ReturnStmtContext ctx);
  /// Exit a parse tree produced by [dscriptParser.returnStmt].
  /// [ctx] the parse tree
  void exitReturnStmt(ReturnStmtContext ctx);

  /// Enter a parse tree produced by [dscriptParser.breakStmt].
  /// [ctx] the parse tree
  void enterBreakStmt(BreakStmtContext ctx);
  /// Exit a parse tree produced by [dscriptParser.breakStmt].
  /// [ctx] the parse tree
  void exitBreakStmt(BreakStmtContext ctx);

  /// Enter a parse tree produced by [dscriptParser.continueStmt].
  /// [ctx] the parse tree
  void enterContinueStmt(ContinueStmtContext ctx);
  /// Exit a parse tree produced by [dscriptParser.continueStmt].
  /// [ctx] the parse tree
  void exitContinueStmt(ContinueStmtContext ctx);

  /// Enter a parse tree produced by [dscriptParser.switchStmt].
  /// [ctx] the parse tree
  void enterSwitchStmt(SwitchStmtContext ctx);
  /// Exit a parse tree produced by [dscriptParser.switchStmt].
  /// [ctx] the parse tree
  void exitSwitchStmt(SwitchStmtContext ctx);

  /// Enter a parse tree produced by [dscriptParser.caseStmt].
  /// [ctx] the parse tree
  void enterCaseStmt(CaseStmtContext ctx);
  /// Exit a parse tree produced by [dscriptParser.caseStmt].
  /// [ctx] the parse tree
  void exitCaseStmt(CaseStmtContext ctx);

  /// Enter a parse tree produced by [dscriptParser.defaultStmt].
  /// [ctx] the parse tree
  void enterDefaultStmt(DefaultStmtContext ctx);
  /// Exit a parse tree produced by [dscriptParser.defaultStmt].
  /// [ctx] the parse tree
  void exitDefaultStmt(DefaultStmtContext ctx);

  /// Enter a parse tree produced by [dscriptParser.tryStmt].
  /// [ctx] the parse tree
  void enterTryStmt(TryStmtContext ctx);
  /// Exit a parse tree produced by [dscriptParser.tryStmt].
  /// [ctx] the parse tree
  void exitTryStmt(TryStmtContext ctx);

  /// Enter a parse tree produced by [dscriptParser.catchBlock].
  /// [ctx] the parse tree
  void enterCatchBlock(CatchBlockContext ctx);
  /// Exit a parse tree produced by [dscriptParser.catchBlock].
  /// [ctx] the parse tree
  void exitCatchBlock(CatchBlockContext ctx);

  /// Enter a parse tree produced by [dscriptParser.line].
  /// [ctx] the parse tree
  void enterLine(LineContext ctx);
  /// Exit a parse tree produced by [dscriptParser.line].
  /// [ctx] the parse tree
  void exitLine(LineContext ctx);

  /// Enter a parse tree produced by [dscriptParser.varType].
  /// [ctx] the parse tree
  void enterVarType(VarTypeContext ctx);
  /// Exit a parse tree produced by [dscriptParser.varType].
  /// [ctx] the parse tree
  void exitVarType(VarTypeContext ctx);

  /// Enter a parse tree produced by [dscriptParser.assignment].
  /// [ctx] the parse tree
  void enterAssignment(AssignmentContext ctx);
  /// Exit a parse tree produced by [dscriptParser.assignment].
  /// [ctx] the parse tree
  void exitAssignment(AssignmentContext ctx);

  /// Enter a parse tree produced by [dscriptParser.simpleAssignment].
  /// [ctx] the parse tree
  void enterSimpleAssignment(SimpleAssignmentContext ctx);
  /// Exit a parse tree produced by [dscriptParser.simpleAssignment].
  /// [ctx] the parse tree
  void exitSimpleAssignment(SimpleAssignmentContext ctx);

  /// Enter a parse tree produced by [dscriptParser.compoundAssignment].
  /// [ctx] the parse tree
  void enterCompoundAssignment(CompoundAssignmentContext ctx);
  /// Exit a parse tree produced by [dscriptParser.compoundAssignment].
  /// [ctx] the parse tree
  void exitCompoundAssignment(CompoundAssignmentContext ctx);

  /// Enter a parse tree produced by [dscriptParser.propertyAssignment].
  /// [ctx] the parse tree
  void enterPropertyAssignment(PropertyAssignmentContext ctx);
  /// Exit a parse tree produced by [dscriptParser.propertyAssignment].
  /// [ctx] the parse tree
  void exitPropertyAssignment(PropertyAssignmentContext ctx);

  /// Enter a parse tree produced by [dscriptParser.indexAssignment].
  /// [ctx] the parse tree
  void enterIndexAssignment(IndexAssignmentContext ctx);
  /// Exit a parse tree produced by [dscriptParser.indexAssignment].
  /// [ctx] the parse tree
  void exitIndexAssignment(IndexAssignmentContext ctx);

  /// Enter a parse tree produced by [dscriptParser.indexPropertyAssignment].
  /// [ctx] the parse tree
  void enterIndexPropertyAssignment(IndexPropertyAssignmentContext ctx);
  /// Exit a parse tree produced by [dscriptParser.indexPropertyAssignment].
  /// [ctx] the parse tree
  void exitIndexPropertyAssignment(IndexPropertyAssignmentContext ctx);

  /// Enter a parse tree produced by [dscriptParser.varDecl].
  /// [ctx] the parse tree
  void enterVarDecl(VarDeclContext ctx);
  /// Exit a parse tree produced by [dscriptParser.varDecl].
  /// [ctx] the parse tree
  void exitVarDecl(VarDeclContext ctx);

  /// Enter a parse tree produced by [dscriptParser.expr].
  /// [ctx] the parse tree
  void enterExpr(ExprContext ctx);
  /// Exit a parse tree produced by [dscriptParser.expr].
  /// [ctx] the parse tree
  void exitExpr(ExprContext ctx);

  /// Enter a parse tree produced by [dscriptParser.logicalExpr].
  /// [ctx] the parse tree
  void enterLogicalExpr(LogicalExprContext ctx);
  /// Exit a parse tree produced by [dscriptParser.logicalExpr].
  /// [ctx] the parse tree
  void exitLogicalExpr(LogicalExprContext ctx);

  /// Enter a parse tree produced by [dscriptParser.relationalExpr].
  /// [ctx] the parse tree
  void enterRelationalExpr(RelationalExprContext ctx);
  /// Exit a parse tree produced by [dscriptParser.relationalExpr].
  /// [ctx] the parse tree
  void exitRelationalExpr(RelationalExprContext ctx);

  /// Enter a parse tree produced by [dscriptParser.bitwiseExpr].
  /// [ctx] the parse tree
  void enterBitwiseExpr(BitwiseExprContext ctx);
  /// Exit a parse tree produced by [dscriptParser.bitwiseExpr].
  /// [ctx] the parse tree
  void exitBitwiseExpr(BitwiseExprContext ctx);

  /// Enter a parse tree produced by [dscriptParser.shiftExpr].
  /// [ctx] the parse tree
  void enterShiftExpr(ShiftExprContext ctx);
  /// Exit a parse tree produced by [dscriptParser.shiftExpr].
  /// [ctx] the parse tree
  void exitShiftExpr(ShiftExprContext ctx);

  /// Enter a parse tree produced by [dscriptParser.additiveExpr].
  /// [ctx] the parse tree
  void enterAdditiveExpr(AdditiveExprContext ctx);
  /// Exit a parse tree produced by [dscriptParser.additiveExpr].
  /// [ctx] the parse tree
  void exitAdditiveExpr(AdditiveExprContext ctx);

  /// Enter a parse tree produced by [dscriptParser.multiplicativeExpr].
  /// [ctx] the parse tree
  void enterMultiplicativeExpr(MultiplicativeExprContext ctx);
  /// Exit a parse tree produced by [dscriptParser.multiplicativeExpr].
  /// [ctx] the parse tree
  void exitMultiplicativeExpr(MultiplicativeExprContext ctx);

  /// Enter a parse tree produced by [dscriptParser.unaryExpr].
  /// [ctx] the parse tree
  void enterUnaryExpr(UnaryExprContext ctx);
  /// Exit a parse tree produced by [dscriptParser.unaryExpr].
  /// [ctx] the parse tree
  void exitUnaryExpr(UnaryExprContext ctx);

  /// Enter a parse tree produced by [dscriptParser.primaryExpr].
  /// [ctx] the parse tree
  void enterPrimaryExpr(PrimaryExprContext ctx);
  /// Exit a parse tree produced by [dscriptParser.primaryExpr].
  /// [ctx] the parse tree
  void exitPrimaryExpr(PrimaryExprContext ctx);

  /// Enter a parse tree produced by [dscriptParser.externalFunctionCall].
  /// [ctx] the parse tree
  void enterExternalFunctionCall(ExternalFunctionCallContext ctx);
  /// Exit a parse tree produced by [dscriptParser.externalFunctionCall].
  /// [ctx] the parse tree
  void exitExternalFunctionCall(ExternalFunctionCallContext ctx);

  /// Enter a parse tree produced by [dscriptParser.functionCall].
  /// [ctx] the parse tree
  void enterFunctionCall(FunctionCallContext ctx);
  /// Exit a parse tree produced by [dscriptParser.functionCall].
  /// [ctx] the parse tree
  void exitFunctionCall(FunctionCallContext ctx);

  /// Enter a parse tree produced by [dscriptParser.args].
  /// [ctx] the parse tree
  void enterArgs(ArgsContext ctx);
  /// Exit a parse tree produced by [dscriptParser.args].
  /// [ctx] the parse tree
  void exitArgs(ArgsContext ctx);

  /// Enter a parse tree produced by [dscriptParser.namedArg].
  /// [ctx] the parse tree
  void enterNamedArg(NamedArgContext ctx);
  /// Exit a parse tree produced by [dscriptParser.namedArg].
  /// [ctx] the parse tree
  void exitNamedArg(NamedArgContext ctx);

  /// Enter a parse tree produced by [dscriptParser.positionalArg].
  /// [ctx] the parse tree
  void enterPositionalArg(PositionalArgContext ctx);
  /// Exit a parse tree produced by [dscriptParser.positionalArg].
  /// [ctx] the parse tree
  void exitPositionalArg(PositionalArgContext ctx);

  /// Enter a parse tree produced by [dscriptParser.literal].
  /// [ctx] the parse tree
  void enterLiteral(LiteralContext ctx);
  /// Exit a parse tree produced by [dscriptParser.literal].
  /// [ctx] the parse tree
  void exitLiteral(LiteralContext ctx);

  /// Enter a parse tree produced by [dscriptParser.identifier].
  /// [ctx] the parse tree
  void enterIdentifier(IdentifierContext ctx);
  /// Exit a parse tree produced by [dscriptParser.identifier].
  /// [ctx] the parse tree
  void exitIdentifier(IdentifierContext ctx);

  /// Enter a parse tree produced by [dscriptParser.arrayLiteral].
  /// [ctx] the parse tree
  void enterArrayLiteral(ArrayLiteralContext ctx);
  /// Exit a parse tree produced by [dscriptParser.arrayLiteral].
  /// [ctx] the parse tree
  void exitArrayLiteral(ArrayLiteralContext ctx);

  /// Enter a parse tree produced by [dscriptParser.objectLiteral].
  /// [ctx] the parse tree
  void enterObjectLiteral(ObjectLiteralContext ctx);
  /// Exit a parse tree produced by [dscriptParser.objectLiteral].
  /// [ctx] the parse tree
  void exitObjectLiteral(ObjectLiteralContext ctx);

  /// Enter a parse tree produced by [dscriptParser.objectProperty].
  /// [ctx] the parse tree
  void enterObjectProperty(ObjectPropertyContext ctx);
  /// Exit a parse tree produced by [dscriptParser.objectProperty].
  /// [ctx] the parse tree
  void exitObjectProperty(ObjectPropertyContext ctx);

  /// Enter a parse tree produced by [dscriptParser.mapLiteral].
  /// [ctx] the parse tree
  void enterMapLiteral(MapLiteralContext ctx);
  /// Exit a parse tree produced by [dscriptParser.mapLiteral].
  /// [ctx] the parse tree
  void exitMapLiteral(MapLiteralContext ctx);

  /// Enter a parse tree produced by [dscriptParser.mapEntry].
  /// [ctx] the parse tree
  void enterMapEntry(MapEntryContext ctx);
  /// Exit a parse tree produced by [dscriptParser.mapEntry].
  /// [ctx] the parse tree
  void exitMapEntry(MapEntryContext ctx);

  /// Enter a parse tree produced by [dscriptParser.block].
  /// [ctx] the parse tree
  void enterBlock(BlockContext ctx);
  /// Exit a parse tree produced by [dscriptParser.block].
  /// [ctx] the parse tree
  void exitBlock(BlockContext ctx);
}