import 'package:antlr4/antlr4.dart';
import 'package:collection/collection.dart';
import 'package:dscript/src/gen/antlr/dscriptBaseVisitor.dart';
import 'package:dscript/src/gen/antlr/dscriptLexer.dart';
import 'package:dscript/src/gen/antlr/dscriptParser.dart';
import 'package:dscript/src/permissions.dart';
import 'package:dscript/src/runtime/scope.dart';
import 'package:dscript/src/stdlib/stdlib.dart';
import 'package:dscript/src/types.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:result_dart/result_dart.dart';

part 'visitor.dart';
part 'errors.dart';
part 'scope.dart';

extension on TerminalNode {
  String? get innerText {
    return text?.substring(1, text!.length - 1); // Remove quotes
  }
}

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

  /// Metadata of an analyzed script.
  const Script({
    required this.ast,
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
Result<Script> analyze(
  CharStream code,
  List<ContractSignature> contracts,
) {
  final analyzer = Analyzer(contracts);
  final lexer = dscriptLexer(code);
  final tokens = CommonTokenStream(lexer);
  final parser = dscriptParser(tokens);

  parser.removeErrorListeners(); // Remove default error listener
  parser.addErrorListener(AnalyzerErrorListener(analyzer._report));
  final tree = parser.script();
  analyzer.visitScript(tree);

  if (analyzer._report.hasErrors) {
    return Failure(analyzer._report);
  }

  return Success(
    Script(
      ast: tree,
      author: analyzer.author!,
      name: analyzer.name!,
      version: analyzer.version!,
      description: analyzer.description,
      license: analyzer.license,
      repository: analyzer.repository,
      website: analyzer.website,
      permissions: analyzer.permissions,
    ),
  );
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
