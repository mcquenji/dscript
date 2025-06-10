import 'package:antlr4/antlr4.dart';
import 'package:collection/collection.dart';
import 'package:dscript/dscript.dart' hide contract;
import 'package:dscript/src/gen/antlr/dscriptBaseVisitor.dart';
import 'package:dscript/src/gen/antlr/dscriptLexer.dart';
import 'package:dscript/src/gen/antlr/dscriptParser.dart';
import 'package:dscript/src/stdlib/stdlib.dart';
import 'package:pub_semver/pub_semver.dart';

part 'metadata.dart';
part 'vars.dart';
part 'contract.dart';
part 'expressions.dart';
part 'block.dart';
part 'stmts.dart';
part 'flow.dart';

extension on TerminalNode {
  String? get innerText {
    return text?.substring(1, text!.length - 1); // Remove quotes
  }
}

/// Base class for all [dscriptBaseVisitor]s that perform static analysis
/// on a Dscript script.
abstract class AnalysisVisitor extends dscriptBaseVisitor<$Type> {
  /// {@template AnalysisVisitor.report}
  /// The report of analysis errors found during the visit.
  /// {@endtemplate}
  final _report = AnalysisReport();

  /// {@template AnalysisVisitor.scope}
  /// The current type scope for the currently visited context.
  /// {@endtemplate}
  TypeScope _scope = TypeScope(null);

  /// {@template AnalysisVisitor.contracts}
  /// A list of contract signatures that this analyzer will use to validate
  /// the script against.
  /// {@endtemplate}
  final List<ContractSignature> _contracts;

  /// {@template AnalysisVisitor.contract}
  /// The contract signature the script is implementing.
  /// {@endtemplate}
  ContractSignature? _contract;

  /// {@template AnalysisVisitor.implementations}
  /// Implementations defined in the script.
  /// {@endtemplate}
  final Map<String, ImplContext> _implementations = {};

  /// {@template AnalysisVisitor.hooks}
  /// Hooks defined in the script.
  /// {@endtemplate}
  final Map<String, HookContext> _hooks = {};

  /// {@template AnalysisVisitor.functions}
  /// Functions defined in the script, mapping names to their context.
  /// {@endtemplate}
  final Map<String, FuncContext> _functions = {};

  /// {@template AnalysisVisitor.functionSignatures}
  /// Function signatures defined in the script, mapping names to their signature.
  /// {@endtemplate}
  final Map<String, FunctionSignature> _functionSignatures = {};

  /// {@template AnalysisVisitor.name}
  /// The name of the contract if one was found during analysis.
  /// {@endtemplate}
  String? _name;

  /// {@template AnalysisVisitor.author}
  /// The author of the contract if one was found during analysis.
  /// {@endtemplate}
  String? _author;

  ///{@template AnalysisVisitor.version}
  /// The version of the contract if one was found during analysis.
  /// {@endtemplate}
  Version? _version;

  /// {@template AnalysisVisitor.description}
  /// The description of the contract if one was found during analysis.
  /// {@endtemplate}
  String _description = '';

  /// {@template AnalysisVisitor.license}
  /// The license of the contract if one was found during analysis.
  /// {@endtemplate}
  String? _license;

  /// {@template AnalysisVisitor.repository}
  /// The repository URL of the contract if one was found during analysis.
  /// {@endtemplate}
  String? _repository;

  /// {@template AnalysisVisitor.website}
  /// The website URL of the contract if one was found during analysis.
  /// {@endtemplate}
  String? _website;

  /// {@template AnalysisVisitor.permissions}
  /// Permissions defined in the script.
  /// {@endtemplate}
  final List<ScriptPermission> _permissions = [];

  /// {@template AnalysisVisitor.globals}
  /// Global variables defined in the contract.
  /// {@endtemplate}
  final List<VarDeclContext> _globals = [];

  final AnalysisVisitor? _parent;

  /// Base class for all [dscriptBaseVisitor]s that perform static analysis
  /// on a Dscript script.
  AnalysisVisitor._(this._contracts) : _parent = null;

  /// Base class for all [dscriptBaseVisitor]s that perform static analysis
  /// on a Dscript script.
  AnalysisVisitor(this._parent) : _contracts = _parent?._contracts ?? [];

  /// Reports an [AnalyzerMessage] to the report.
  ///
  /// Returns null to allow returning null from visitor methods while also reporting the error.
  $Type report(AnalyzerMessage error) {
    errors.report(error);
    return const InvalidType();
  }

  /// Matches the [found] type against the [expected] type.
  ///
  /// If the types do not match, an [AssignmentError] is reported.
  void match($Type expected, $Type found, ParserRuleContext ctx,
      [String? variable]) {
    if (!found.canCast(expected)) {
      report(
        AssignmentError(
          expected,
          found,
          ctx: ctx,
        ),
      );
    }
  }

  /// {@macro AnalysisVisitor.globals}
  List<VarDeclContext> get globals => _inherit((v) => v._globals);

  /// {@macro AnalysisVisitor.scope}
  TypeScope get scope => _inherit((v) => v._scope);

  set scope(TypeScope value) => _propagate(
        value,
        (v, value) => v._scope = value,
      );

  /// {@macro AnalysisVisitor.contracts}
  List<ContractSignature> get contracts => _inherit((v) => v._contracts);

  /// {@macro AnalysisVisitor.contract}
  ContractSignature get contract => _inherit((v) => v._contract!);

  set contract(ContractSignature value) => _propagate(
        value,
        (v, value) => v._contract = value,
      );

  /// {@macro AnalysisVisitor.implementations}
  Map<String, ImplContext> get implementations =>
      _inherit((v) => v._implementations);

  /// {@macro AnalysisVisitor.hooks}
  Map<String, HookContext> get hooks => _inherit((v) => v._hooks);

  /// {@macro AnalysisVisitor.functions}
  Map<String, FuncContext> get functions => _inherit((v) => v._functions);

  /// {@macro AnalysisVisitor.functionSignatures}
  Map<String, FunctionSignature> get functionSignatures =>
      _inherit((v) => v._functionSignatures);

  /// {@macro AnalysisVisitor.name}
  String? get name => _inherit((v) => v._name);

  set name(String? value) => _propagate(
        value,
        (v, value) => v._name = value,
      );

  /// {@macro AnalysisVisitor.author}
  String? get author => _parent?._author ?? _author;

  set author(String? value) => _propagate(
        value,
        (v, value) => v._author = value,
      );

  /// {@macro AnalysisVisitor.version}
  Version? get version => _parent?._version ?? _version;

  set version(Version? value) => _propagate(
        value,
        (v, value) => v._version = value,
      );

  /// {@macro AnalysisVisitor.description}
  String get description => _parent?._description ?? _description;

  set description(String value) => _propagate(
        value,
        (v, value) => v._description = value,
      );

  /// {@macro AnalysisVisitor.license}
  String? get license => _parent?._license ?? _license;

  set license(String? value) => _propagate(
        value,
        (v, value) => v._license = value,
      );

  /// {@macro AnalysisVisitor.repository}
  String? get repository => _inherit((v) => v._repository);

  set repository(String? value) => _propagate(
        value,
        (v, value) => v._repository = value,
      );

  /// {@macro AnalysisVisitor.website}
  String? get website => _inherit((v) => v._website);

  set website(String? value) => _propagate(
        value,
        (v, value) => v._website = value,
      );

  /// {@macro AnalysisVisitor.permissions}
  List<ScriptPermission> get permissions => _inherit((v) => v._permissions);

  /// {@macro AnalysisVisitor.report}
  AnalysisReport get errors => _inherit((v) => v._report);

  T _inherit<T>(T Function(AnalysisVisitor) getter) {
    if (_parent != null) {
      return _parent._inherit(getter);
    }
    return getter(this);
  }

  void _propagate<T>(T value, T Function(AnalysisVisitor, T) setter) {
    if (_parent != null) {
      _parent._propagate(value, setter);
    } else {
      setter(this, value);
    }
  }
}

/// Analyzes a Dscript script for errors and validates it against the provided contract signatures.
class Analyzer extends AnalysisVisitor {
  /// Creates an [Analyzer] with the given [contracts].
  Analyzer(super.contracts) : super._();

  @override
  $Type? visitScript(ScriptContext ctx) {
    for (final metadata in ctx.metadatas()) {
      metadata.accept(MetadataVisitor(this));
    }

    if (name == null) {
      report(RequiredMetadataError('name', ctx: ctx));
    }
    if (author == null) {
      report(RequiredMetadataError('author', ctx: ctx));
    }
    if (version == null) {
      report(RequiredMetadataError('version', ctx: ctx));
    }
    if (description.isEmpty) {
      report(RequiredMetadataError('description', ctx: ctx));
    }

    for (final perm in ctx.permissionss()) {
      perm.accept(this);
    }

    ctx.contract()!.accept(ContractVisitor(this));

    return const InvalidType();
  }

  @override
  $Type? visitPermission(PermissionContext ctx) {
    final nameSpace = ctx.namespace!.text;
    final name = ctx.perm!.text;

    permissions.add(ScriptPermission(nameSpace, name));

    return const InvalidType();
  }

  @override
  $Type? visitErrorNode(ErrorNode node) {
    report(
      SemanticError('Syntax error: ${node.text}',
          ctx: node as ParserRuleContext),
    );

    return const InvalidType();
  }
}
