import 'package:antlr4/antlr4.dart';
import 'package:dscript/src/gen/antlr/dscriptLexer.dart';
import 'package:dscript/src/gen/antlr/dscriptParser.dart';
import 'package:dscript/src/permissions.dart';
import 'package:dscript/src/runtime/scope.dart';
import 'package:dscript/src/types.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:result_dart/result_dart.dart';

import 'visitors/visitors.dart';

part 'errors.dart';
part 'scope.dart';

/// Metadata of an analyzed script.
class Script {
  /// The author of the script.
  final String author;

  /// The name of the script.
  final String name;

  /// The version of the script.
  final Version version;

  /// The description of the script.
  final String description;

  /// The license of the script, if any.
  final String? license;

  /// The repository URL of the script, if any.
  final String? repository;

  /// The website URL of the script, if any.
  final String? website;

  /// List of permissions required by the script.
  final List<ScriptPermission> permissions;

  /// The parsed AST after analysis.
  final ScriptContext ast;

  /// The implementations found in the script, mapping names to ast nodes.
  final Map<String, ImplContext> implementations;

  /// The contract implemented by the script.
  final ContractSignature contract;

  /// The hooks defined in the script, mapping names to ast nodes.
  final Map<String, HookContext> hooks;

  /// Metadata of an analyzed script.
  const Script({
    required this.ast,
    required this.implementations,
    required this.contract,
    required this.hooks,
    required this.author,
    required this.name,
    required this.version,
    required this.description,
    required this.permissions,
    this.license,
    this.repository,
    this.website,
  });
}

/// Analyzes the script in the given [code] against the provided [contracts].
///
/// Returns a [Result] containing the [Script] if successful, or an [AnalysisReport] if errors are found.
ResultDart<Script, AnalysisReport> analyze(
  CharStream code,
  List<ContractSignature> contracts,
) {
  final analyzer = Analyzer(contracts);
  final lexer = dscriptLexer(code);
  final tokens = CommonTokenStream(lexer);
  final parser = dscriptParser(tokens);

  parser.removeErrorListeners(); // Remove default error listener
  parser.addErrorListener(AnalyzerErrorListener(analyzer.errors));
  final tree = parser.script();
  analyzer.visitScript(tree);

  if (analyzer.errors.hasErrors) {
    return analyzer.errors.toFailure();
  }

  return Script(
    ast: tree,
    implementations: analyzer.implementations,
    contract: analyzer.contract,
    hooks: analyzer.hooks,
    author: analyzer.author!,
    name: analyzer.name!,
    version: analyzer.version!,
    description: analyzer.description,
    license: analyzer.license,
    repository: analyzer.repository,
    website: analyzer.website,
    permissions: analyzer.permissions,
  ).toSuccess();
}

/// Error listener for the ANTLR parser that reports syntax errors to the given analysis [report].
class AnalyzerErrorListener extends BaseErrorListener {
  /// The analysis report to which syntax errors are reported.
  final AnalysisReport report;

  /// Creates an [AnalyzerErrorListener] that reports syntax errors to the given [report].
  AnalyzerErrorListener(this.report);

  @override
  void syntaxError(
      Recognizer<ATNSimulator> recognizer,
      Object? offendingSymbol,
      int? line,
      int charPositionInLine,
      String msg,
      RecognitionException<IntStream>? e) {
    report.report(SyntaxError(
      msg,
      token: offendingSymbol as Token?,
    ));
  }
}
