// Generated from dscript.g4 by ANTLR 4.13.2
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'dscriptListener.dart';
import 'dscriptBaseListener.dart';
import 'dscriptVisitor.dart';
import 'dscriptBaseVisitor.dart';
const int RULE_script = 0, RULE_metadata = 1, RULE_schema = 2, RULE_author = 3, 
          RULE_description = 4, RULE_version = 5, RULE_license = 6, RULE_repo = 7, 
          RULE_website = 8, RULE_name = 9, RULE_permissions = 10, RULE_permission = 11, 
          RULE_contract = 12, RULE_hook = 13, RULE_impl = 14, RULE_func = 15, 
          RULE_params = 16, RULE_param = 17, RULE_dataType = 18, RULE_stmt = 19, 
          RULE_throwStmt = 20, RULE_ifStmt = 21, RULE_elseStmt = 22, RULE_whileStmt = 23, 
          RULE_forStmt = 24, RULE_returnStmt = 25, RULE_breakStmt = 26, 
          RULE_continueStmt = 27, RULE_switchStmt = 28, RULE_caseStmt = 29, 
          RULE_defaultStmt = 30, RULE_tryStmt = 31, RULE_catchBlock = 32, 
          RULE_line = 33, RULE_varType = 34, RULE_assignment = 35, RULE_simpleAssignment = 36, 
          RULE_compoundAssignment = 37, RULE_propertyAssignment = 38, RULE_indexAssignment = 39, 
          RULE_indexPropertyAssignment = 40, RULE_varDecl = 41, RULE_expr = 42, 
          RULE_logicalExpr = 43, RULE_relationalExpr = 44, RULE_bitwiseExpr = 45, 
          RULE_shiftExpr = 46, RULE_additiveExpr = 47, RULE_multiplicativeExpr = 48, 
          RULE_unaryExpr = 49, RULE_suffixExpr = 50, RULE_primaryExpr = 51, 
          RULE_externalFunctionCall = 52, RULE_functionCall = 53, RULE_args = 54, 
          RULE_namedArg = 55, RULE_positionalArg = 56, RULE_literal = 57, 
          RULE_identifier = 58, RULE_arrayLiteral = 59, RULE_objectLiteral = 60, 
          RULE_objectProperty = 61, RULE_mapLiteral = 62, RULE_mapEntry = 63, 
          RULE_block = 64;
class dscriptParser extends Parser {
  static final checkVersion = () => RuntimeMetaData.checkVersion('4.13.2', RuntimeMetaData.VERSION);
  static const int TOKEN_EOF = IntStream.EOF;

  static final List<DFA> _decisionToDFA = List.generate(
      _ATN.numberOfDecisions, (i) => DFA(_ATN.getDecisionState(i), i));
  static final PredictionContextCache _sharedContextCache = PredictionContextCache();
  static const int TOKEN_PLUS = 1, TOKEN_MINUS = 2, TOKEN_MULTIPLY = 3, 
                   TOKEN_DIVIDE = 4, TOKEN_MOD = 5, TOKEN_OPEN_PAREN = 6, 
                   TOKEN_CLOSE_PAREN = 7, TOKEN_OPEN_BRACE = 8, TOKEN_CLOSE_BRACE = 9, 
                   TOKEN_OPEN_BRACKET = 10, TOKEN_CLOSE_BRACKET = 11, TOKEN_GT = 12, 
                   TOKEN_LT = 13, TOKEN_EQ = 14, TOKEN_ASSIGN = 15, TOKEN_NE = 16, 
                   TOKEN_GTE = 17, TOKEN_LTE = 18, TOKEN_COLON = 19, TOKEN_DOUBLE_COLON = 20, 
                   TOKEN_COMMA = 21, TOKEN_SEMI = 22, TOKEN_AND = 23, TOKEN_OR = 24, 
                   TOKEN_NOT = 25, TOKEN_BIT_AND = 26, TOKEN_BIT_OR = 27, 
                   TOKEN_BIT_XOR = 28, TOKEN_BIT_NOT = 29, TOKEN_BIT_LEFT_SHIFT = 30, 
                   TOKEN_BIT_RIGHT_SHIFT = 31, TOKEN_ARROW = 32, TOKEN_Q = 33, 
                   TOKEN_DOT = 34, TOKEN_PLUS_ASSIGN = 35, TOKEN_MINUS_ASSIGN = 36, 
                   TOKEN_MULTIPLY_ASSIGN = 37, TOKEN_DIVIDE_ASSIGN = 38, 
                   TOKEN_MOD_ASSIGN = 39, TOKEN_PLUS_PLUS = 40, TOKEN_MINUS_MINUS = 41, 
                   TOKEN_AT = 42, TOKEN_DOLLAR = 43, TOKEN_SCHEMA = 44, 
                   TOKEN_AUTHOR = 45, TOKEN_DESCRIPTION = 46, TOKEN_VERSION = 47, 
                   TOKEN_LICENSE = 48, TOKEN_REPO = 49, TOKEN_WEBSITE = 50, 
                   TOKEN_NAME = 51, TOKEN_PERMISSIONS = 52, TOKEN_CONTRACT = 53, 
                   TOKEN_IMPL = 54, TOKEN_HOOK = 55, TOKEN_FUNC = 56, TOKEN_LIST = 57, 
                   TOKEN_MAP = 58, TOKEN_IF = 59, TOKEN_ELSE = 60, TOKEN_WHILE = 61, 
                   TOKEN_FOR = 62, TOKEN_IN = 63, TOKEN_DO = 64, TOKEN_RETURN = 65, 
                   TOKEN_BREAK = 66, TOKEN_CONTINUE = 67, TOKEN_SWITCH = 68, 
                   TOKEN_CASE = 69, TOKEN_DEFAULT = 70, TOKEN_TRY = 71, 
                   TOKEN_CATCH = 72, TOKEN_THROW = 73, TOKEN_FINAL = 74, 
                   TOKEN_CONST = 75, TOKEN_VAR = 76, TOKEN_SEMVER = 77, 
                   TOKEN_BOOL = 78, TOKEN_NULL = 79, TOKEN_INT = 80, TOKEN_DOUBLE = 81, 
                   TOKEN_IDENT = 82, TOKEN_STRING = 83, TOKEN_WS = 84, TOKEN_COMMENT = 85, 
                   TOKEN_DOC_COMMENT = 86;

  @override
  final List<String> ruleNames = [
    'script', 'metadata', 'schema', 'author', 'description', 'version', 
    'license', 'repo', 'website', 'name', 'permissions', 'permission', 'contract', 
    'hook', 'impl', 'func', 'params', 'param', 'dataType', 'stmt', 'throwStmt', 
    'ifStmt', 'elseStmt', 'whileStmt', 'forStmt', 'returnStmt', 'breakStmt', 
    'continueStmt', 'switchStmt', 'caseStmt', 'defaultStmt', 'tryStmt', 
    'catchBlock', 'line', 'varType', 'assignment', 'simpleAssignment', 'compoundAssignment', 
    'propertyAssignment', 'indexAssignment', 'indexPropertyAssignment', 
    'varDecl', 'expr', 'logicalExpr', 'relationalExpr', 'bitwiseExpr', 'shiftExpr', 
    'additiveExpr', 'multiplicativeExpr', 'unaryExpr', 'suffixExpr', 'primaryExpr', 
    'externalFunctionCall', 'functionCall', 'args', 'namedArg', 'positionalArg', 
    'literal', 'identifier', 'arrayLiteral', 'objectLiteral', 'objectProperty', 
    'mapLiteral', 'mapEntry', 'block'
  ];

  static final List<String?> _LITERAL_NAMES = [
      null, "'+'", "'-'", "'*'", "'/'", "'%'", "'('", "')'", "'{'", "'}'", 
      "'['", "']'", "'>'", "'<'", "'=='", "'='", "'!='", "'>='", "'<='", 
      "':'", "'::'", "','", "';'", "'&&'", "'||'", "'!'", "'&'", "'|'", 
      "'^'", "'~'", "'<<'", "'>>'", "'->'", "'?'", "'.'", "'+='", "'-='", 
      "'*='", "'/='", "'%='", "'++'", "'--'", "'@'", "'\$'", "'schema'", 
      "'author'", "'description'", "'version'", "'license'", "'repo'", "'website'", 
      "'name'", "'permissions'", "'contract'", "'impl'", "'hook'", "'func'", 
      "'List'", "'Map'", "'if'", "'else'", "'while'", "'for'", "'in'", "'do'", 
      "'return'", "'break'", "'continue'", "'switch'", "'case'", "'default'", 
      "'try'", "'catch'", "'throw'", "'final'", "'const'", "'var'", null, 
      null, "'null'"
  ];
  static final List<String?> _SYMBOLIC_NAMES = [
      null, "PLUS", "MINUS", "MULTIPLY", "DIVIDE", "MOD", "OPEN_PAREN", 
      "CLOSE_PAREN", "OPEN_BRACE", "CLOSE_BRACE", "OPEN_BRACKET", "CLOSE_BRACKET", 
      "GT", "LT", "EQ", "ASSIGN", "NE", "GTE", "LTE", "COLON", "DOUBLE_COLON", 
      "COMMA", "SEMI", "AND", "OR", "NOT", "BIT_AND", "BIT_OR", "BIT_XOR", 
      "BIT_NOT", "BIT_LEFT_SHIFT", "BIT_RIGHT_SHIFT", "ARROW", "Q", "DOT", 
      "PLUS_ASSIGN", "MINUS_ASSIGN", "MULTIPLY_ASSIGN", "DIVIDE_ASSIGN", 
      "MOD_ASSIGN", "PLUS_PLUS", "MINUS_MINUS", "AT", "DOLLAR", "SCHEMA", 
      "AUTHOR", "DESCRIPTION", "VERSION", "LICENSE", "REPO", "WEBSITE", 
      "NAME", "PERMISSIONS", "CONTRACT", "IMPL", "HOOK", "FUNC", "LIST", 
      "MAP", "IF", "ELSE", "WHILE", "FOR", "IN", "DO", "RETURN", "BREAK", 
      "CONTINUE", "SWITCH", "CASE", "DEFAULT", "TRY", "CATCH", "THROW", 
      "FINAL", "CONST", "VAR", "SEMVER", "BOOL", "NULL", "INT", "DOUBLE", 
      "IDENT", "STRING", "WS", "COMMENT", "DOC_COMMENT"
  ];
  static final Vocabulary VOCABULARY = VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

  @override
  Vocabulary get vocabulary {
    return VOCABULARY;
  }

  @override
  String get grammarFileName => 'dscript.g4';

  @override
  List<int> get serializedATN => _serializedATN;

  @override
  ATN getATN() {
   return _ATN;
  }

  dscriptParser(TokenStream input) : super(input) {
    interpreter = ParserATNSimulator(this, _ATN, _decisionToDFA, _sharedContextCache);
  }

  ScriptContext script() {
    dynamic _localctx = ScriptContext(context, state);
    enterRule(_localctx, 0, RULE_script);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 130;
      schema();
      state = 134;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 4468415255281664) != 0)) {
        state = 131;
        metadata();
        state = 136;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 140;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_PERMISSIONS) {
        state = 137;
        permissions();
        state = 142;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 143;
      contract();
      state = 144;
      match(TOKEN_EOF);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  MetadataContext metadata() {
    dynamic _localctx = MetadataContext(context, state);
    enterRule(_localctx, 2, RULE_metadata);
    try {
      state = 153;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_NAME:
        enterOuterAlt(_localctx, 1);
        state = 146;
        name();
        break;
      case TOKEN_DESCRIPTION:
        enterOuterAlt(_localctx, 2);
        state = 147;
        description();
        break;
      case TOKEN_AUTHOR:
        enterOuterAlt(_localctx, 3);
        state = 148;
        author();
        break;
      case TOKEN_VERSION:
        enterOuterAlt(_localctx, 4);
        state = 149;
        version();
        break;
      case TOKEN_LICENSE:
        enterOuterAlt(_localctx, 5);
        state = 150;
        license();
        break;
      case TOKEN_REPO:
        enterOuterAlt(_localctx, 6);
        state = 151;
        repo();
        break;
      case TOKEN_WEBSITE:
        enterOuterAlt(_localctx, 7);
        state = 152;
        website();
        break;
      default:
        throw NoViableAltException(this);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  SchemaContext schema() {
    dynamic _localctx = SchemaContext(context, state);
    enterRule(_localctx, 4, RULE_schema);
    try {
      enterOuterAlt(_localctx, 1);
      state = 155;
      match(TOKEN_SCHEMA);
      state = 156;
      match(TOKEN_STRING);
      state = 157;
      match(TOKEN_SEMI);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  AuthorContext author() {
    dynamic _localctx = AuthorContext(context, state);
    enterRule(_localctx, 6, RULE_author);
    try {
      enterOuterAlt(_localctx, 1);
      state = 159;
      match(TOKEN_AUTHOR);
      state = 160;
      match(TOKEN_STRING);
      state = 161;
      match(TOKEN_SEMI);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  DescriptionContext description() {
    dynamic _localctx = DescriptionContext(context, state);
    enterRule(_localctx, 8, RULE_description);
    try {
      enterOuterAlt(_localctx, 1);
      state = 163;
      match(TOKEN_DESCRIPTION);
      state = 164;
      match(TOKEN_STRING);
      state = 165;
      match(TOKEN_SEMI);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  VersionContext version() {
    dynamic _localctx = VersionContext(context, state);
    enterRule(_localctx, 10, RULE_version);
    try {
      enterOuterAlt(_localctx, 1);
      state = 167;
      match(TOKEN_VERSION);
      state = 168;
      match(TOKEN_SEMVER);
      state = 169;
      match(TOKEN_SEMI);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  LicenseContext license() {
    dynamic _localctx = LicenseContext(context, state);
    enterRule(_localctx, 12, RULE_license);
    try {
      enterOuterAlt(_localctx, 1);
      state = 171;
      match(TOKEN_LICENSE);
      state = 172;
      match(TOKEN_STRING);
      state = 173;
      match(TOKEN_SEMI);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  RepoContext repo() {
    dynamic _localctx = RepoContext(context, state);
    enterRule(_localctx, 14, RULE_repo);
    try {
      enterOuterAlt(_localctx, 1);
      state = 175;
      match(TOKEN_REPO);
      state = 176;
      match(TOKEN_STRING);
      state = 177;
      match(TOKEN_SEMI);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  WebsiteContext website() {
    dynamic _localctx = WebsiteContext(context, state);
    enterRule(_localctx, 16, RULE_website);
    try {
      enterOuterAlt(_localctx, 1);
      state = 179;
      match(TOKEN_WEBSITE);
      state = 180;
      match(TOKEN_STRING);
      state = 181;
      match(TOKEN_SEMI);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  NameContext name() {
    dynamic _localctx = NameContext(context, state);
    enterRule(_localctx, 18, RULE_name);
    try {
      enterOuterAlt(_localctx, 1);
      state = 183;
      match(TOKEN_NAME);
      state = 184;
      match(TOKEN_STRING);
      state = 185;
      match(TOKEN_SEMI);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  PermissionsContext permissions() {
    dynamic _localctx = PermissionsContext(context, state);
    enterRule(_localctx, 20, RULE_permissions);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 187;
      match(TOKEN_PERMISSIONS);
      state = 188;
      permission();
      state = 193;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_COMMA) {
        state = 189;
        match(TOKEN_COMMA);
        state = 190;
        permission();
        state = 195;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 196;
      match(TOKEN_SEMI);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  PermissionContext permission() {
    dynamic _localctx = PermissionContext(context, state);
    enterRule(_localctx, 22, RULE_permission);
    try {
      enterOuterAlt(_localctx, 1);
      state = 198;
      _localctx.namespace = identifier(0);
      state = 199;
      match(TOKEN_DOUBLE_COLON);
      state = 200;
      _localctx.perm = identifier(0);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ContractContext contract() {
    dynamic _localctx = ContractContext(context, state);
    enterRule(_localctx, 24, RULE_contract);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 202;
      match(TOKEN_CONTRACT);
      state = 203;
      identifier(0);
      state = 204;
      match(TOKEN_OPEN_BRACE);
      state = 210;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 126100789566373888) != 0)) {
        state = 208;
        errorHandler.sync(this);
        switch (tokenStream.LA(1)!) {
        case TOKEN_HOOK:
          state = 205;
          hook();
          break;
        case TOKEN_IMPL:
          state = 206;
          impl();
          break;
        case TOKEN_FUNC:
          state = 207;
          func();
          break;
        default:
          throw NoViableAltException(this);
        }
        state = 212;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 213;
      match(TOKEN_CLOSE_BRACE);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  HookContext hook() {
    dynamic _localctx = HookContext(context, state);
    enterRule(_localctx, 26, RULE_hook);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 215;
      match(TOKEN_HOOK);
      state = 216;
      identifier(0);
      state = 217;
      match(TOKEN_OPEN_PAREN);
      state = 219;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (((((_la - 44)) & ~0x3f) == 0 && ((1 << (_la - 44)) & 274877939711) != 0)) {
        state = 218;
        params();
      }

      state = 221;
      match(TOKEN_CLOSE_PAREN);
      state = 222;
      block();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ImplContext impl() {
    dynamic _localctx = ImplContext(context, state);
    enterRule(_localctx, 28, RULE_impl);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 224;
      match(TOKEN_IMPL);
      state = 225;
      identifier(0);
      state = 226;
      match(TOKEN_OPEN_PAREN);
      state = 228;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (((((_la - 44)) & ~0x3f) == 0 && ((1 << (_la - 44)) & 274877939711) != 0)) {
        state = 227;
        params();
      }

      state = 230;
      match(TOKEN_CLOSE_PAREN);
      state = 231;
      match(TOKEN_ARROW);
      state = 232;
      dataType();
      state = 233;
      block();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  FuncContext func() {
    dynamic _localctx = FuncContext(context, state);
    enterRule(_localctx, 30, RULE_func);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 235;
      match(TOKEN_FUNC);
      state = 236;
      identifier(0);
      state = 237;
      match(TOKEN_OPEN_PAREN);
      state = 239;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (((((_la - 44)) & ~0x3f) == 0 && ((1 << (_la - 44)) & 274877939711) != 0)) {
        state = 238;
        params();
      }

      state = 241;
      match(TOKEN_CLOSE_PAREN);
      state = 242;
      match(TOKEN_ARROW);
      state = 243;
      dataType();
      state = 244;
      block();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ParamsContext params() {
    dynamic _localctx = ParamsContext(context, state);
    enterRule(_localctx, 32, RULE_params);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 246;
      param();
      state = 251;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_COMMA) {
        state = 247;
        match(TOKEN_COMMA);
        state = 248;
        param();
        state = 253;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ParamContext param() {
    dynamic _localctx = ParamContext(context, state);
    enterRule(_localctx, 34, RULE_param);
    try {
      enterOuterAlt(_localctx, 1);
      state = 254;
      dataType();
      state = 255;
      identifier(0);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  DataTypeContext dataType() {
    dynamic _localctx = DataTypeContext(context, state);
    enterRule(_localctx, 36, RULE_dataType);
    int _la;
    try {
      state = 277;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 13, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 257;
        identifier(0);
        state = 259;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_Q) {
          state = 258;
          match(TOKEN_Q);
        }

        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 261;
        match(TOKEN_LIST);
        state = 262;
        match(TOKEN_LT);
        state = 263;
        dataType();
        state = 264;
        match(TOKEN_GT);
        state = 266;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_Q) {
          state = 265;
          match(TOKEN_Q);
        }

        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 268;
        match(TOKEN_MAP);
        state = 269;
        match(TOKEN_LT);
        state = 270;
        dataType();
        state = 271;
        match(TOKEN_COMMA);
        state = 272;
        dataType();
        state = 273;
        match(TOKEN_GT);
        state = 275;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_Q) {
          state = 274;
          match(TOKEN_Q);
        }

        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  StmtContext stmt() {
    dynamic _localctx = StmtContext(context, state);
    enterRule(_localctx, 38, RULE_stmt);
    try {
      state = 290;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_FINAL:
      case TOKEN_CONST:
      case TOKEN_VAR:
        enterOuterAlt(_localctx, 1);
        state = 279;
        varDecl();
        break;
      case TOKEN_SCHEMA:
      case TOKEN_AUTHOR:
      case TOKEN_DESCRIPTION:
      case TOKEN_VERSION:
      case TOKEN_LICENSE:
      case TOKEN_REPO:
      case TOKEN_WEBSITE:
      case TOKEN_NAME:
      case TOKEN_PERMISSIONS:
      case TOKEN_CONTRACT:
      case TOKEN_IMPL:
      case TOKEN_HOOK:
      case TOKEN_FUNC:
      case TOKEN_LIST:
      case TOKEN_MAP:
      case TOKEN_IDENT:
        enterOuterAlt(_localctx, 2);
        state = 280;
        assignment();
        break;
      case TOKEN_RETURN:
        enterOuterAlt(_localctx, 3);
        state = 281;
        returnStmt();
        break;
      case TOKEN_BREAK:
        enterOuterAlt(_localctx, 4);
        state = 282;
        breakStmt();
        break;
      case TOKEN_CONTINUE:
        enterOuterAlt(_localctx, 5);
        state = 283;
        continueStmt();
        break;
      case TOKEN_THROW:
        enterOuterAlt(_localctx, 6);
        state = 284;
        throwStmt();
        break;
      case TOKEN_IF:
        enterOuterAlt(_localctx, 7);
        state = 285;
        ifStmt();
        break;
      case TOKEN_WHILE:
        enterOuterAlt(_localctx, 8);
        state = 286;
        whileStmt();
        break;
      case TOKEN_FOR:
        enterOuterAlt(_localctx, 9);
        state = 287;
        forStmt();
        break;
      case TOKEN_TRY:
        enterOuterAlt(_localctx, 10);
        state = 288;
        tryStmt();
        break;
      case TOKEN_SWITCH:
        enterOuterAlt(_localctx, 11);
        state = 289;
        switchStmt();
        break;
      default:
        throw NoViableAltException(this);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ThrowStmtContext throwStmt() {
    dynamic _localctx = ThrowStmtContext(context, state);
    enterRule(_localctx, 40, RULE_throwStmt);
    try {
      enterOuterAlt(_localctx, 1);
      state = 292;
      match(TOKEN_THROW);
      state = 293;
      expr();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  IfStmtContext ifStmt() {
    dynamic _localctx = IfStmtContext(context, state);
    enterRule(_localctx, 42, RULE_ifStmt);
    try {
      enterOuterAlt(_localctx, 1);
      state = 295;
      match(TOKEN_IF);
      state = 296;
      match(TOKEN_OPEN_PAREN);
      state = 297;
      expr();
      state = 298;
      match(TOKEN_CLOSE_PAREN);
      state = 299;
      block();
      state = 301;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 15, context)) {
      case 1:
        state = 300;
        elseStmt();
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ElseStmtContext elseStmt() {
    dynamic _localctx = ElseStmtContext(context, state);
    enterRule(_localctx, 44, RULE_elseStmt);
    try {
      enterOuterAlt(_localctx, 1);
      state = 303;
      match(TOKEN_ELSE);
      state = 306;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 16, context)) {
      case 1:
        state = 304;
        ifStmt();
        break;
      case 2:
        state = 305;
        block();
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  WhileStmtContext whileStmt() {
    dynamic _localctx = WhileStmtContext(context, state);
    enterRule(_localctx, 46, RULE_whileStmt);
    try {
      enterOuterAlt(_localctx, 1);
      state = 308;
      match(TOKEN_WHILE);
      state = 309;
      match(TOKEN_OPEN_PAREN);
      state = 310;
      expr();
      state = 311;
      match(TOKEN_CLOSE_PAREN);
      state = 312;
      block();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ForStmtContext forStmt() {
    dynamic _localctx = ForStmtContext(context, state);
    enterRule(_localctx, 48, RULE_forStmt);
    try {
      enterOuterAlt(_localctx, 1);
      state = 314;
      match(TOKEN_FOR);
      state = 315;
      match(TOKEN_OPEN_PAREN);
      state = 329;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 18, context)) {
      case 1:
        state = 318;
        errorHandler.sync(this);
        switch (tokenStream.LA(1)!) {
        case TOKEN_FINAL:
        case TOKEN_CONST:
        case TOKEN_VAR:
          state = 316;
          varDecl();
          break;
        case TOKEN_IDENT:
          state = 317;
          match(TOKEN_IDENT);
          break;
        default:
          throw NoViableAltException(this);
        }
        state = 320;
        match(TOKEN_SEMI);
        state = 321;
        expr();
        state = 322;
        match(TOKEN_SEMI);
        state = 323;
        assignment();
        break;
      case 2:
        state = 325;
        varDecl();
        state = 326;
        match(TOKEN_IN);
        state = 327;
        expr();
        break;
      }
      state = 331;
      match(TOKEN_CLOSE_PAREN);
      state = 332;
      block();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ReturnStmtContext returnStmt() {
    dynamic _localctx = ReturnStmtContext(context, state);
    enterRule(_localctx, 50, RULE_returnStmt);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 334;
      match(TOKEN_RETURN);
      state = 336;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 576447558734316870) != 0) || ((((_la - 78)) & ~0x3f) == 0 && ((1 << (_la - 78)) & 63) != 0)) {
        state = 335;
        expr();
      }

    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  BreakStmtContext breakStmt() {
    dynamic _localctx = BreakStmtContext(context, state);
    enterRule(_localctx, 52, RULE_breakStmt);
    try {
      enterOuterAlt(_localctx, 1);
      state = 338;
      match(TOKEN_BREAK);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ContinueStmtContext continueStmt() {
    dynamic _localctx = ContinueStmtContext(context, state);
    enterRule(_localctx, 54, RULE_continueStmt);
    try {
      enterOuterAlt(_localctx, 1);
      state = 340;
      match(TOKEN_CONTINUE);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  SwitchStmtContext switchStmt() {
    dynamic _localctx = SwitchStmtContext(context, state);
    enterRule(_localctx, 56, RULE_switchStmt);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 342;
      match(TOKEN_SWITCH);
      state = 343;
      match(TOKEN_OPEN_PAREN);
      state = 344;
      expr();
      state = 345;
      match(TOKEN_CLOSE_PAREN);
      state = 346;
      match(TOKEN_OPEN_BRACE);
      state = 350;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_CASE) {
        state = 347;
        caseStmt();
        state = 352;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 354;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_DEFAULT) {
        state = 353;
        defaultStmt();
      }

      state = 356;
      match(TOKEN_CLOSE_BRACE);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  CaseStmtContext caseStmt() {
    dynamic _localctx = CaseStmtContext(context, state);
    enterRule(_localctx, 58, RULE_caseStmt);
    try {
      enterOuterAlt(_localctx, 1);
      state = 358;
      match(TOKEN_CASE);
      state = 359;
      expr();
      state = 360;
      match(TOKEN_COLON);
      state = 361;
      block();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  DefaultStmtContext defaultStmt() {
    dynamic _localctx = DefaultStmtContext(context, state);
    enterRule(_localctx, 60, RULE_defaultStmt);
    try {
      enterOuterAlt(_localctx, 1);
      state = 363;
      match(TOKEN_DEFAULT);
      state = 364;
      match(TOKEN_COLON);
      state = 365;
      block();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  TryStmtContext tryStmt() {
    dynamic _localctx = TryStmtContext(context, state);
    enterRule(_localctx, 62, RULE_tryStmt);
    try {
      enterOuterAlt(_localctx, 1);
      state = 367;
      match(TOKEN_TRY);
      state = 368;
      block();
      state = 369;
      catchBlock();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  CatchBlockContext catchBlock() {
    dynamic _localctx = CatchBlockContext(context, state);
    enterRule(_localctx, 64, RULE_catchBlock);
    try {
      enterOuterAlt(_localctx, 1);
      state = 371;
      match(TOKEN_CATCH);
      state = 372;
      match(TOKEN_OPEN_PAREN);
      state = 373;
      identifier(0);
      state = 374;
      match(TOKEN_CLOSE_PAREN);
      state = 375;
      block();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  LineContext line() {
    dynamic _localctx = LineContext(context, state);
    enterRule(_localctx, 66, RULE_line);
    try {
      state = 384;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 23, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 379;
        errorHandler.sync(this);
        switch (interpreter!.adaptivePredict(tokenStream, 22, context)) {
        case 1:
          state = 377;
          stmt();
          break;
        case 2:
          state = 378;
          expr();
          break;
        }
        state = 381;
        match(TOKEN_SEMI);
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 383;
        block();
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  VarTypeContext varType() {
    dynamic _localctx = VarTypeContext(context, state);
    enterRule(_localctx, 68, RULE_varType);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 386;
      _la = tokenStream.LA(1)!;
      if (!(((((_la - 74)) & ~0x3f) == 0 && ((1 << (_la - 74)) & 7) != 0))) {
      errorHandler.recoverInline(this);
      } else {
        if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
        errorHandler.reportMatch(this);
        consume();
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  AssignmentContext assignment() {
    dynamic _localctx = AssignmentContext(context, state);
    enterRule(_localctx, 70, RULE_assignment);
    try {
      state = 393;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 24, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 388;
        simpleAssignment();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 389;
        compoundAssignment();
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 390;
        propertyAssignment();
        break;
      case 4:
        enterOuterAlt(_localctx, 4);
        state = 391;
        indexAssignment();
        break;
      case 5:
        enterOuterAlt(_localctx, 5);
        state = 392;
        indexPropertyAssignment();
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  SimpleAssignmentContext simpleAssignment() {
    dynamic _localctx = SimpleAssignmentContext(context, state);
    enterRule(_localctx, 72, RULE_simpleAssignment);
    try {
      enterOuterAlt(_localctx, 1);
      state = 395;
      identifier(0);
      state = 396;
      match(TOKEN_ASSIGN);
      state = 397;
      expr();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  CompoundAssignmentContext compoundAssignment() {
    dynamic _localctx = CompoundAssignmentContext(context, state);
    enterRule(_localctx, 74, RULE_compoundAssignment);
    try {
      state = 419;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 25, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 399;
        identifier(0);
        state = 400;
        _localctx.op = match(TOKEN_PLUS_ASSIGN);
        state = 401;
        expr();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 403;
        identifier(0);
        state = 404;
        _localctx.op = match(TOKEN_MINUS_ASSIGN);
        state = 405;
        expr();
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 407;
        identifier(0);
        state = 408;
        _localctx.op = match(TOKEN_MULTIPLY_ASSIGN);
        state = 409;
        expr();
        break;
      case 4:
        enterOuterAlt(_localctx, 4);
        state = 411;
        identifier(0);
        state = 412;
        _localctx.op = match(TOKEN_DIVIDE_ASSIGN);
        state = 413;
        expr();
        break;
      case 5:
        enterOuterAlt(_localctx, 5);
        state = 415;
        identifier(0);
        state = 416;
        _localctx.op = match(TOKEN_MOD_ASSIGN);
        state = 417;
        expr();
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  PropertyAssignmentContext propertyAssignment() {
    dynamic _localctx = PropertyAssignmentContext(context, state);
    enterRule(_localctx, 76, RULE_propertyAssignment);
    try {
      enterOuterAlt(_localctx, 1);
      state = 421;
      identifier(0);
      state = 422;
      match(TOKEN_DOT);
      state = 423;
      identifier(0);
      state = 424;
      match(TOKEN_ASSIGN);
      state = 425;
      expr();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  IndexAssignmentContext indexAssignment() {
    dynamic _localctx = IndexAssignmentContext(context, state);
    enterRule(_localctx, 78, RULE_indexAssignment);
    try {
      enterOuterAlt(_localctx, 1);
      state = 427;
      identifier(0);
      state = 428;
      match(TOKEN_OPEN_BRACKET);
      state = 429;
      expr();
      state = 430;
      match(TOKEN_CLOSE_BRACKET);
      state = 431;
      match(TOKEN_ASSIGN);
      state = 432;
      expr();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  IndexPropertyAssignmentContext indexPropertyAssignment() {
    dynamic _localctx = IndexPropertyAssignmentContext(context, state);
    enterRule(_localctx, 80, RULE_indexPropertyAssignment);
    try {
      enterOuterAlt(_localctx, 1);
      state = 434;
      identifier(0);
      state = 435;
      match(TOKEN_OPEN_BRACKET);
      state = 436;
      expr();
      state = 437;
      match(TOKEN_CLOSE_BRACKET);
      state = 438;
      match(TOKEN_DOT);
      state = 439;
      identifier(0);
      state = 440;
      match(TOKEN_ASSIGN);
      state = 441;
      expr();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  VarDeclContext varDecl() {
    dynamic _localctx = VarDeclContext(context, state);
    enterRule(_localctx, 82, RULE_varDecl);
    try {
      state = 453;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 27, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 443;
        varType();
        state = 444;
        dataType();
        state = 445;
        identifier(0);
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 447;
        varType();
        state = 449;
        errorHandler.sync(this);
        switch (interpreter!.adaptivePredict(tokenStream, 26, context)) {
        case 1:
          state = 448;
          dataType();
          break;
        }
        state = 451;
        assignment();
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ExprContext expr() {
    dynamic _localctx = ExprContext(context, state);
    enterRule(_localctx, 84, RULE_expr);
    try {
      enterOuterAlt(_localctx, 1);
      state = 455;
      logicalExpr();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  LogicalExprContext logicalExpr() {
    dynamic _localctx = LogicalExprContext(context, state);
    enterRule(_localctx, 86, RULE_logicalExpr);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 457;
      _localctx.left = relationalExpr();
      state = 462;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_AND || _la == TOKEN_OR) {
        state = 458;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!(_la == TOKEN_AND || _la == TOKEN_OR)) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 459;
        _localctx.right = relationalExpr();
        state = 464;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  RelationalExprContext relationalExpr() {
    dynamic _localctx = RelationalExprContext(context, state);
    enterRule(_localctx, 88, RULE_relationalExpr);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 465;
      _localctx.left = bitwiseExpr();
      state = 470;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 487424) != 0)) {
        state = 466;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!((((_la) & ~0x3f) == 0 && ((1 << _la) & 487424) != 0))) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 467;
        _localctx.right = bitwiseExpr();
        state = 472;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  BitwiseExprContext bitwiseExpr() {
    dynamic _localctx = BitwiseExprContext(context, state);
    enterRule(_localctx, 90, RULE_bitwiseExpr);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 473;
      _localctx.left = shiftExpr();
      state = 478;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 469762048) != 0)) {
        state = 474;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!((((_la) & ~0x3f) == 0 && ((1 << _la) & 469762048) != 0))) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 475;
        _localctx.right = shiftExpr();
        state = 480;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ShiftExprContext shiftExpr() {
    dynamic _localctx = ShiftExprContext(context, state);
    enterRule(_localctx, 92, RULE_shiftExpr);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 481;
      _localctx.left = additiveExpr();
      state = 486;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_BIT_LEFT_SHIFT || _la == TOKEN_BIT_RIGHT_SHIFT) {
        state = 482;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!(_la == TOKEN_BIT_LEFT_SHIFT || _la == TOKEN_BIT_RIGHT_SHIFT)) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 483;
        _localctx.right = additiveExpr();
        state = 488;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  AdditiveExprContext additiveExpr() {
    dynamic _localctx = AdditiveExprContext(context, state);
    enterRule(_localctx, 94, RULE_additiveExpr);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 489;
      _localctx.left = multiplicativeExpr();
      state = 494;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_PLUS || _la == TOKEN_MINUS) {
        state = 490;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!(_la == TOKEN_PLUS || _la == TOKEN_MINUS)) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 491;
        _localctx.right = multiplicativeExpr();
        state = 496;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  MultiplicativeExprContext multiplicativeExpr() {
    dynamic _localctx = MultiplicativeExprContext(context, state);
    enterRule(_localctx, 96, RULE_multiplicativeExpr);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 497;
      _localctx.left = unaryExpr();
      state = 502;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 56) != 0)) {
        state = 498;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!((((_la) & ~0x3f) == 0 && ((1 << _la) & 56) != 0))) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 499;
        _localctx.right = unaryExpr();
        state = 504;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  UnaryExprContext unaryExpr() {
    dynamic _localctx = UnaryExprContext(context, state);
    enterRule(_localctx, 98, RULE_unaryExpr);
    int _la;
    try {
      state = 508;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_PLUS:
      case TOKEN_MINUS:
      case TOKEN_NOT:
      case TOKEN_BIT_NOT:
        enterOuterAlt(_localctx, 1);
        state = 505;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!((((_la) & ~0x3f) == 0 && ((1 << _la) & 570425350) != 0))) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 506;
        unaryExpr();
        break;
      case TOKEN_OPEN_PAREN:
      case TOKEN_OPEN_BRACE:
      case TOKEN_OPEN_BRACKET:
      case TOKEN_AT:
      case TOKEN_SCHEMA:
      case TOKEN_AUTHOR:
      case TOKEN_DESCRIPTION:
      case TOKEN_VERSION:
      case TOKEN_LICENSE:
      case TOKEN_REPO:
      case TOKEN_WEBSITE:
      case TOKEN_NAME:
      case TOKEN_PERMISSIONS:
      case TOKEN_CONTRACT:
      case TOKEN_IMPL:
      case TOKEN_HOOK:
      case TOKEN_FUNC:
      case TOKEN_LIST:
      case TOKEN_MAP:
      case TOKEN_BOOL:
      case TOKEN_NULL:
      case TOKEN_INT:
      case TOKEN_DOUBLE:
      case TOKEN_IDENT:
      case TOKEN_STRING:
        enterOuterAlt(_localctx, 2);
        state = 507;
        suffixExpr();
        break;
      default:
        throw NoViableAltException(this);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  SuffixExprContext suffixExpr() {
    dynamic _localctx = SuffixExprContext(context, state);
    enterRule(_localctx, 100, RULE_suffixExpr);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 510;
      primaryExpr();
      state = 512;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_PLUS_PLUS || _la == TOKEN_MINUS_MINUS) {
        state = 511;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!(_la == TOKEN_PLUS_PLUS || _la == TOKEN_MINUS_MINUS)) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
      }

    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  PrimaryExprContext primaryExpr() {
    dynamic _localctx = PrimaryExprContext(context, state);
    enterRule(_localctx, 102, RULE_primaryExpr);
    try {
      state = 522;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 36, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 514;
        match(TOKEN_OPEN_PAREN);
        state = 515;
        expr();
        state = 516;
        match(TOKEN_CLOSE_PAREN);
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 518;
        functionCall();
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 519;
        externalFunctionCall();
        break;
      case 4:
        enterOuterAlt(_localctx, 4);
        state = 520;
        literal();
        break;
      case 5:
        enterOuterAlt(_localctx, 5);
        state = 521;
        identifier(0);
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ExternalFunctionCallContext externalFunctionCall() {
    dynamic _localctx = ExternalFunctionCallContext(context, state);
    enterRule(_localctx, 104, RULE_externalFunctionCall);
    try {
      enterOuterAlt(_localctx, 1);
      state = 524;
      _localctx.namespace = identifier(0);
      state = 525;
      match(TOKEN_DOUBLE_COLON);
      state = 526;
      functionCall();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  FunctionCallContext functionCall() {
    dynamic _localctx = FunctionCallContext(context, state);
    enterRule(_localctx, 106, RULE_functionCall);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 528;
      _localctx.method = identifier(0);
      state = 529;
      match(TOKEN_OPEN_PAREN);
      state = 531;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 576447558734316870) != 0) || ((((_la - 78)) & ~0x3f) == 0 && ((1 << (_la - 78)) & 63) != 0)) {
        state = 530;
        args();
      }

      state = 533;
      match(TOKEN_CLOSE_PAREN);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ArgsContext args() {
    dynamic _localctx = ArgsContext(context, state);
    enterRule(_localctx, 108, RULE_args);
    int _la;
    try {
      int _alt;
      state = 568;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 42, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 535;
        positionalArg();
        state = 540;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 536;
          match(TOKEN_COMMA);
          state = 537;
          positionalArg();
          state = 542;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 543;
        namedArg();
        state = 548;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 544;
          match(TOKEN_COMMA);
          state = 545;
          namedArg();
          state = 550;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 551;
        positionalArg();
        state = 556;
        errorHandler.sync(this);
        _alt = interpreter!.adaptivePredict(tokenStream, 40, context);
        while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
          if (_alt == 1) {
            state = 552;
            match(TOKEN_COMMA);
            state = 553;
            positionalArg(); 
          }
          state = 558;
          errorHandler.sync(this);
          _alt = interpreter!.adaptivePredict(tokenStream, 40, context);
        }
        state = 559;
        match(TOKEN_COMMA);
        state = 560;
        namedArg();
        state = 565;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 561;
          match(TOKEN_COMMA);
          state = 562;
          namedArg();
          state = 567;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  NamedArgContext namedArg() {
    dynamic _localctx = NamedArgContext(context, state);
    enterRule(_localctx, 110, RULE_namedArg);
    try {
      enterOuterAlt(_localctx, 1);
      state = 570;
      identifier(0);
      state = 571;
      match(TOKEN_COLON);
      state = 572;
      expr();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  PositionalArgContext positionalArg() {
    dynamic _localctx = PositionalArgContext(context, state);
    enterRule(_localctx, 112, RULE_positionalArg);
    try {
      enterOuterAlt(_localctx, 1);
      state = 574;
      expr();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  LiteralContext literal() {
    dynamic _localctx = LiteralContext(context, state);
    enterRule(_localctx, 114, RULE_literal);
    try {
      state = 584;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_INT:
        enterOuterAlt(_localctx, 1);
        state = 576;
        match(TOKEN_INT);
        break;
      case TOKEN_DOUBLE:
        enterOuterAlt(_localctx, 2);
        state = 577;
        match(TOKEN_DOUBLE);
        break;
      case TOKEN_BOOL:
        enterOuterAlt(_localctx, 3);
        state = 578;
        match(TOKEN_BOOL);
        break;
      case TOKEN_STRING:
        enterOuterAlt(_localctx, 4);
        state = 579;
        match(TOKEN_STRING);
        break;
      case TOKEN_NULL:
        enterOuterAlt(_localctx, 5);
        state = 580;
        match(TOKEN_NULL);
        break;
      case TOKEN_OPEN_BRACKET:
        enterOuterAlt(_localctx, 6);
        state = 581;
        arrayLiteral();
        break;
      case TOKEN_OPEN_BRACE:
        enterOuterAlt(_localctx, 7);
        state = 582;
        mapLiteral();
        break;
      case TOKEN_AT:
        enterOuterAlt(_localctx, 8);
        state = 583;
        objectLiteral();
        break;
      default:
        throw NoViableAltException(this);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  IdentifierContext identifier([int _p = 0]) {
    final _parentctx = context;
    final _parentState = state;
    dynamic _localctx = IdentifierContext(context, _parentState);
    var _prevctx = _localctx;
    var _startState = 116;
    enterRecursionRule(_localctx, 116, RULE_identifier, _p);
    try {
      int _alt;
      enterOuterAlt(_localctx, 1);
      state = 603;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_IDENT:
        state = 587;
        _localctx.ident = match(TOKEN_IDENT);
        break;
      case TOKEN_AUTHOR:
        state = 588;
        _localctx.ident = match(TOKEN_AUTHOR);
        break;
      case TOKEN_NAME:
        state = 589;
        _localctx.ident = match(TOKEN_NAME);
        break;
      case TOKEN_DESCRIPTION:
        state = 590;
        _localctx.ident = match(TOKEN_DESCRIPTION);
        break;
      case TOKEN_VERSION:
        state = 591;
        _localctx.ident = match(TOKEN_VERSION);
        break;
      case TOKEN_LICENSE:
        state = 592;
        _localctx.ident = match(TOKEN_LICENSE);
        break;
      case TOKEN_REPO:
        state = 593;
        _localctx.ident = match(TOKEN_REPO);
        break;
      case TOKEN_WEBSITE:
        state = 594;
        _localctx.ident = match(TOKEN_WEBSITE);
        break;
      case TOKEN_PERMISSIONS:
        state = 595;
        _localctx.ident = match(TOKEN_PERMISSIONS);
        break;
      case TOKEN_CONTRACT:
        state = 596;
        _localctx.ident = match(TOKEN_CONTRACT);
        break;
      case TOKEN_IMPL:
        state = 597;
        _localctx.ident = match(TOKEN_IMPL);
        break;
      case TOKEN_HOOK:
        state = 598;
        _localctx.ident = match(TOKEN_HOOK);
        break;
      case TOKEN_FUNC:
        state = 599;
        _localctx.ident = match(TOKEN_FUNC);
        break;
      case TOKEN_LIST:
        state = 600;
        _localctx.ident = match(TOKEN_LIST);
        break;
      case TOKEN_MAP:
        state = 601;
        _localctx.ident = match(TOKEN_MAP);
        break;
      case TOKEN_SCHEMA:
        state = 602;
        _localctx.ident = match(TOKEN_SCHEMA);
        break;
      default:
        throw NoViableAltException(this);
      }
      state = 607;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 45, context)) {
      case 1:
        state = 605;
        _localctx.nullAware = match(TOKEN_NOT);
        break;
      case 2:
        state = 606;
        _localctx.allowNull = match(TOKEN_Q);
        break;
      }
      context!.stop = tokenStream.LT(-1);
      state = 622;
      errorHandler.sync(this);
      _alt = interpreter!.adaptivePredict(tokenStream, 48, context);
      while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
        if (_alt == 1) {
          if (parseListeners != null) triggerExitRuleEvent();
          _prevctx = _localctx;
          state = 620;
          errorHandler.sync(this);
          switch (interpreter!.adaptivePredict(tokenStream, 47, context)) {
          case 1:
            _localctx = IdentifierContext(_parentctx, _parentState);
            _localctx.objIdent = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_identifier);
            state = 609;
            if (!(precpred(context, 1))) {
              throw FailedPredicateException(this, "precpred(context, 1)");
            }
            state = 610;
            match(TOKEN_DOT);
            state = 611;
            _localctx.property = identifier(2);
            break;
          case 2:
            _localctx = IdentifierContext(_parentctx, _parentState);
            _localctx.indexIdent = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_identifier);
            state = 612;
            if (!(precpred(context, 2))) {
              throw FailedPredicateException(this, "precpred(context, 2)");
            }
            state = 613;
            match(TOKEN_OPEN_BRACKET);
            state = 614;
            _localctx.index = expr();
            state = 615;
            match(TOKEN_CLOSE_BRACKET);
            state = 618;
            errorHandler.sync(this);
            switch (interpreter!.adaptivePredict(tokenStream, 46, context)) {
            case 1:
              state = 616;
              _localctx.nullAware = match(TOKEN_NOT);
              break;
            case 2:
              state = 617;
              _localctx.allowNull = match(TOKEN_Q);
              break;
            }
            break;
          } 
        }
        state = 624;
        errorHandler.sync(this);
        _alt = interpreter!.adaptivePredict(tokenStream, 48, context);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      unrollRecursionContexts(_parentctx);
    }
    return _localctx;
  }

  ArrayLiteralContext arrayLiteral() {
    dynamic _localctx = ArrayLiteralContext(context, state);
    enterRule(_localctx, 118, RULE_arrayLiteral);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 625;
      match(TOKEN_OPEN_BRACKET);
      state = 634;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 576447558734316870) != 0) || ((((_la - 78)) & ~0x3f) == 0 && ((1 << (_la - 78)) & 63) != 0)) {
        state = 626;
        expr();
        state = 631;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 627;
          match(TOKEN_COMMA);
          state = 628;
          expr();
          state = 633;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
      }

      state = 636;
      match(TOKEN_CLOSE_BRACKET);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ObjectLiteralContext objectLiteral() {
    dynamic _localctx = ObjectLiteralContext(context, state);
    enterRule(_localctx, 120, RULE_objectLiteral);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 638;
      match(TOKEN_AT);
      state = 639;
      identifier(0);
      state = 640;
      match(TOKEN_OPEN_BRACE);
      state = 649;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (((((_la - 44)) & ~0x3f) == 0 && ((1 << (_la - 44)) & 274877939711) != 0)) {
        state = 641;
        objectProperty();
        state = 646;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 642;
          match(TOKEN_COMMA);
          state = 643;
          objectProperty();
          state = 648;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
      }

      state = 651;
      match(TOKEN_CLOSE_BRACE);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ObjectPropertyContext objectProperty() {
    dynamic _localctx = ObjectPropertyContext(context, state);
    enterRule(_localctx, 122, RULE_objectProperty);
    try {
      enterOuterAlt(_localctx, 1);
      state = 653;
      identifier(0);
      state = 654;
      match(TOKEN_COLON);
      state = 655;
      expr();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  MapLiteralContext mapLiteral() {
    dynamic _localctx = MapLiteralContext(context, state);
    enterRule(_localctx, 124, RULE_mapLiteral);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 657;
      match(TOKEN_OPEN_BRACE);
      state = 666;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 576447558734316870) != 0) || ((((_la - 78)) & ~0x3f) == 0 && ((1 << (_la - 78)) & 63) != 0)) {
        state = 658;
        mapEntry();
        state = 663;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 659;
          match(TOKEN_COMMA);
          state = 660;
          mapEntry();
          state = 665;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
      }

      state = 668;
      match(TOKEN_CLOSE_BRACE);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  MapEntryContext mapEntry() {
    dynamic _localctx = MapEntryContext(context, state);
    enterRule(_localctx, 126, RULE_mapEntry);
    try {
      enterOuterAlt(_localctx, 1);
      state = 670;
      _localctx.key = expr();
      state = 671;
      match(TOKEN_COLON);
      state = 672;
      _localctx.value = expr();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  BlockContext block() {
    dynamic _localctx = BlockContext(context, state);
    enterRule(_localctx, 128, RULE_block);
    int _la;
    try {
      state = 688;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_OPEN_BRACE:
        enterOuterAlt(_localctx, 1);
        state = 674;
        match(TOKEN_OPEN_BRACE);
        state = 678;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 8070437338678822214) != 0) || ((((_la - 65)) & ~0x3f) == 0 && ((1 << (_la - 65)) & 520143) != 0)) {
          state = 675;
          line();
          state = 680;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        state = 681;
        match(TOKEN_CLOSE_BRACE);
        break;
      case TOKEN_IF:
        enterOuterAlt(_localctx, 2);
        state = 682;
        ifStmt();
        break;
      case TOKEN_WHILE:
        enterOuterAlt(_localctx, 3);
        state = 683;
        whileStmt();
        break;
      case TOKEN_FOR:
        enterOuterAlt(_localctx, 4);
        state = 684;
        forStmt();
        break;
      case TOKEN_SWITCH:
        enterOuterAlt(_localctx, 5);
        state = 685;
        switchStmt();
        break;
      case TOKEN_TRY:
        enterOuterAlt(_localctx, 6);
        state = 686;
        tryStmt();
        break;
      case TOKEN_CATCH:
        enterOuterAlt(_localctx, 7);
        state = 687;
        catchBlock();
        break;
      default:
        throw NoViableAltException(this);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  @override
  bool sempred(RuleContext? _localctx, int ruleIndex, int predIndex) {
    switch (ruleIndex) {
    case 58:
      return _identifier_sempred(_localctx as IdentifierContext?, predIndex);
    }
    return true;
  }
  bool _identifier_sempred(dynamic _localctx, int predIndex) {
    switch (predIndex) {
      case 0: return precpred(context, 1);
      case 1: return precpred(context, 2);
    }
    return true;
  }

  static const List<int> _serializedATN = [
      4,1,86,691,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,
      2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,2,
      14,7,14,2,15,7,15,2,16,7,16,2,17,7,17,2,18,7,18,2,19,7,19,2,20,7,20,
      2,21,7,21,2,22,7,22,2,23,7,23,2,24,7,24,2,25,7,25,2,26,7,26,2,27,7,
      27,2,28,7,28,2,29,7,29,2,30,7,30,2,31,7,31,2,32,7,32,2,33,7,33,2,34,
      7,34,2,35,7,35,2,36,7,36,2,37,7,37,2,38,7,38,2,39,7,39,2,40,7,40,2,
      41,7,41,2,42,7,42,2,43,7,43,2,44,7,44,2,45,7,45,2,46,7,46,2,47,7,47,
      2,48,7,48,2,49,7,49,2,50,7,50,2,51,7,51,2,52,7,52,2,53,7,53,2,54,7,
      54,2,55,7,55,2,56,7,56,2,57,7,57,2,58,7,58,2,59,7,59,2,60,7,60,2,61,
      7,61,2,62,7,62,2,63,7,63,2,64,7,64,1,0,1,0,5,0,133,8,0,10,0,12,0,136,
      9,0,1,0,5,0,139,8,0,10,0,12,0,142,9,0,1,0,1,0,1,0,1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,3,1,154,8,1,1,2,1,2,1,2,1,2,1,3,1,3,1,3,1,3,1,4,1,4,1,
      4,1,4,1,5,1,5,1,5,1,5,1,6,1,6,1,6,1,6,1,7,1,7,1,7,1,7,1,8,1,8,1,8,
      1,8,1,9,1,9,1,9,1,9,1,10,1,10,1,10,1,10,5,10,192,8,10,10,10,12,10,
      195,9,10,1,10,1,10,1,11,1,11,1,11,1,11,1,12,1,12,1,12,1,12,1,12,1,
      12,5,12,209,8,12,10,12,12,12,212,9,12,1,12,1,12,1,13,1,13,1,13,1,13,
      3,13,220,8,13,1,13,1,13,1,13,1,14,1,14,1,14,1,14,3,14,229,8,14,1,14,
      1,14,1,14,1,14,1,14,1,15,1,15,1,15,1,15,3,15,240,8,15,1,15,1,15,1,
      15,1,15,1,15,1,16,1,16,1,16,5,16,250,8,16,10,16,12,16,253,9,16,1,17,
      1,17,1,17,1,18,1,18,3,18,260,8,18,1,18,1,18,1,18,1,18,1,18,3,18,267,
      8,18,1,18,1,18,1,18,1,18,1,18,1,18,1,18,3,18,276,8,18,3,18,278,8,18,
      1,19,1,19,1,19,1,19,1,19,1,19,1,19,1,19,1,19,1,19,1,19,3,19,291,8,
      19,1,20,1,20,1,20,1,21,1,21,1,21,1,21,1,21,1,21,3,21,302,8,21,1,22,
      1,22,1,22,3,22,307,8,22,1,23,1,23,1,23,1,23,1,23,1,23,1,24,1,24,1,
      24,1,24,3,24,319,8,24,1,24,1,24,1,24,1,24,1,24,1,24,1,24,1,24,1,24,
      3,24,330,8,24,1,24,1,24,1,24,1,25,1,25,3,25,337,8,25,1,26,1,26,1,27,
      1,27,1,28,1,28,1,28,1,28,1,28,1,28,5,28,349,8,28,10,28,12,28,352,9,
      28,1,28,3,28,355,8,28,1,28,1,28,1,29,1,29,1,29,1,29,1,29,1,30,1,30,
      1,30,1,30,1,31,1,31,1,31,1,31,1,32,1,32,1,32,1,32,1,32,1,32,1,33,1,
      33,3,33,380,8,33,1,33,1,33,1,33,3,33,385,8,33,1,34,1,34,1,35,1,35,
      1,35,1,35,1,35,3,35,394,8,35,1,36,1,36,1,36,1,36,1,37,1,37,1,37,1,
      37,1,37,1,37,1,37,1,37,1,37,1,37,1,37,1,37,1,37,1,37,1,37,1,37,1,37,
      1,37,1,37,1,37,3,37,420,8,37,1,38,1,38,1,38,1,38,1,38,1,38,1,39,1,
      39,1,39,1,39,1,39,1,39,1,39,1,40,1,40,1,40,1,40,1,40,1,40,1,40,1,40,
      1,40,1,41,1,41,1,41,1,41,1,41,1,41,3,41,450,8,41,1,41,1,41,3,41,454,
      8,41,1,42,1,42,1,43,1,43,1,43,5,43,461,8,43,10,43,12,43,464,9,43,1,
      44,1,44,1,44,5,44,469,8,44,10,44,12,44,472,9,44,1,45,1,45,1,45,5,45,
      477,8,45,10,45,12,45,480,9,45,1,46,1,46,1,46,5,46,485,8,46,10,46,12,
      46,488,9,46,1,47,1,47,1,47,5,47,493,8,47,10,47,12,47,496,9,47,1,48,
      1,48,1,48,5,48,501,8,48,10,48,12,48,504,9,48,1,49,1,49,1,49,3,49,509,
      8,49,1,50,1,50,3,50,513,8,50,1,51,1,51,1,51,1,51,1,51,1,51,1,51,1,
      51,3,51,523,8,51,1,52,1,52,1,52,1,52,1,53,1,53,1,53,3,53,532,8,53,
      1,53,1,53,1,54,1,54,1,54,5,54,539,8,54,10,54,12,54,542,9,54,1,54,1,
      54,1,54,5,54,547,8,54,10,54,12,54,550,9,54,1,54,1,54,1,54,5,54,555,
      8,54,10,54,12,54,558,9,54,1,54,1,54,1,54,1,54,5,54,564,8,54,10,54,
      12,54,567,9,54,3,54,569,8,54,1,55,1,55,1,55,1,55,1,56,1,56,1,57,1,
      57,1,57,1,57,1,57,1,57,1,57,1,57,3,57,585,8,57,1,58,1,58,1,58,1,58,
      1,58,1,58,1,58,1,58,1,58,1,58,1,58,1,58,1,58,1,58,1,58,1,58,1,58,3,
      58,604,8,58,1,58,1,58,3,58,608,8,58,1,58,1,58,1,58,1,58,1,58,1,58,
      1,58,1,58,1,58,3,58,619,8,58,5,58,621,8,58,10,58,12,58,624,9,58,1,
      59,1,59,1,59,1,59,5,59,630,8,59,10,59,12,59,633,9,59,3,59,635,8,59,
      1,59,1,59,1,60,1,60,1,60,1,60,1,60,1,60,5,60,645,8,60,10,60,12,60,
      648,9,60,3,60,650,8,60,1,60,1,60,1,61,1,61,1,61,1,61,1,62,1,62,1,62,
      1,62,5,62,662,8,62,10,62,12,62,665,9,62,3,62,667,8,62,1,62,1,62,1,
      63,1,63,1,63,1,63,1,64,1,64,5,64,677,8,64,10,64,12,64,680,9,64,1,64,
      1,64,1,64,1,64,1,64,1,64,1,64,3,64,689,8,64,1,64,0,1,116,65,0,2,4,
      6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,
      52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,
      96,98,100,102,104,106,108,110,112,114,116,118,120,122,124,126,128,
      0,9,1,0,74,76,1,0,23,24,2,0,12,14,16,18,1,0,26,28,1,0,30,31,1,0,1,
      2,1,0,3,5,3,0,1,2,25,25,29,29,1,0,40,41,735,0,130,1,0,0,0,2,153,1,
      0,0,0,4,155,1,0,0,0,6,159,1,0,0,0,8,163,1,0,0,0,10,167,1,0,0,0,12,
      171,1,0,0,0,14,175,1,0,0,0,16,179,1,0,0,0,18,183,1,0,0,0,20,187,1,
      0,0,0,22,198,1,0,0,0,24,202,1,0,0,0,26,215,1,0,0,0,28,224,1,0,0,0,
      30,235,1,0,0,0,32,246,1,0,0,0,34,254,1,0,0,0,36,277,1,0,0,0,38,290,
      1,0,0,0,40,292,1,0,0,0,42,295,1,0,0,0,44,303,1,0,0,0,46,308,1,0,0,
      0,48,314,1,0,0,0,50,334,1,0,0,0,52,338,1,0,0,0,54,340,1,0,0,0,56,342,
      1,0,0,0,58,358,1,0,0,0,60,363,1,0,0,0,62,367,1,0,0,0,64,371,1,0,0,
      0,66,384,1,0,0,0,68,386,1,0,0,0,70,393,1,0,0,0,72,395,1,0,0,0,74,419,
      1,0,0,0,76,421,1,0,0,0,78,427,1,0,0,0,80,434,1,0,0,0,82,453,1,0,0,
      0,84,455,1,0,0,0,86,457,1,0,0,0,88,465,1,0,0,0,90,473,1,0,0,0,92,481,
      1,0,0,0,94,489,1,0,0,0,96,497,1,0,0,0,98,508,1,0,0,0,100,510,1,0,0,
      0,102,522,1,0,0,0,104,524,1,0,0,0,106,528,1,0,0,0,108,568,1,0,0,0,
      110,570,1,0,0,0,112,574,1,0,0,0,114,584,1,0,0,0,116,586,1,0,0,0,118,
      625,1,0,0,0,120,638,1,0,0,0,122,653,1,0,0,0,124,657,1,0,0,0,126,670,
      1,0,0,0,128,688,1,0,0,0,130,134,3,4,2,0,131,133,3,2,1,0,132,131,1,
      0,0,0,133,136,1,0,0,0,134,132,1,0,0,0,134,135,1,0,0,0,135,140,1,0,
      0,0,136,134,1,0,0,0,137,139,3,20,10,0,138,137,1,0,0,0,139,142,1,0,
      0,0,140,138,1,0,0,0,140,141,1,0,0,0,141,143,1,0,0,0,142,140,1,0,0,
      0,143,144,3,24,12,0,144,145,5,0,0,1,145,1,1,0,0,0,146,154,3,18,9,0,
      147,154,3,8,4,0,148,154,3,6,3,0,149,154,3,10,5,0,150,154,3,12,6,0,
      151,154,3,14,7,0,152,154,3,16,8,0,153,146,1,0,0,0,153,147,1,0,0,0,
      153,148,1,0,0,0,153,149,1,0,0,0,153,150,1,0,0,0,153,151,1,0,0,0,153,
      152,1,0,0,0,154,3,1,0,0,0,155,156,5,44,0,0,156,157,5,83,0,0,157,158,
      5,22,0,0,158,5,1,0,0,0,159,160,5,45,0,0,160,161,5,83,0,0,161,162,5,
      22,0,0,162,7,1,0,0,0,163,164,5,46,0,0,164,165,5,83,0,0,165,166,5,22,
      0,0,166,9,1,0,0,0,167,168,5,47,0,0,168,169,5,77,0,0,169,170,5,22,0,
      0,170,11,1,0,0,0,171,172,5,48,0,0,172,173,5,83,0,0,173,174,5,22,0,
      0,174,13,1,0,0,0,175,176,5,49,0,0,176,177,5,83,0,0,177,178,5,22,0,
      0,178,15,1,0,0,0,179,180,5,50,0,0,180,181,5,83,0,0,181,182,5,22,0,
      0,182,17,1,0,0,0,183,184,5,51,0,0,184,185,5,83,0,0,185,186,5,22,0,
      0,186,19,1,0,0,0,187,188,5,52,0,0,188,193,3,22,11,0,189,190,5,21,0,
      0,190,192,3,22,11,0,191,189,1,0,0,0,192,195,1,0,0,0,193,191,1,0,0,
      0,193,194,1,0,0,0,194,196,1,0,0,0,195,193,1,0,0,0,196,197,5,22,0,0,
      197,21,1,0,0,0,198,199,3,116,58,0,199,200,5,20,0,0,200,201,3,116,58,
      0,201,23,1,0,0,0,202,203,5,53,0,0,203,204,3,116,58,0,204,210,5,8,0,
      0,205,209,3,26,13,0,206,209,3,28,14,0,207,209,3,30,15,0,208,205,1,
      0,0,0,208,206,1,0,0,0,208,207,1,0,0,0,209,212,1,0,0,0,210,208,1,0,
      0,0,210,211,1,0,0,0,211,213,1,0,0,0,212,210,1,0,0,0,213,214,5,9,0,
      0,214,25,1,0,0,0,215,216,5,55,0,0,216,217,3,116,58,0,217,219,5,6,0,
      0,218,220,3,32,16,0,219,218,1,0,0,0,219,220,1,0,0,0,220,221,1,0,0,
      0,221,222,5,7,0,0,222,223,3,128,64,0,223,27,1,0,0,0,224,225,5,54,0,
      0,225,226,3,116,58,0,226,228,5,6,0,0,227,229,3,32,16,0,228,227,1,0,
      0,0,228,229,1,0,0,0,229,230,1,0,0,0,230,231,5,7,0,0,231,232,5,32,0,
      0,232,233,3,36,18,0,233,234,3,128,64,0,234,29,1,0,0,0,235,236,5,56,
      0,0,236,237,3,116,58,0,237,239,5,6,0,0,238,240,3,32,16,0,239,238,1,
      0,0,0,239,240,1,0,0,0,240,241,1,0,0,0,241,242,5,7,0,0,242,243,5,32,
      0,0,243,244,3,36,18,0,244,245,3,128,64,0,245,31,1,0,0,0,246,251,3,
      34,17,0,247,248,5,21,0,0,248,250,3,34,17,0,249,247,1,0,0,0,250,253,
      1,0,0,0,251,249,1,0,0,0,251,252,1,0,0,0,252,33,1,0,0,0,253,251,1,0,
      0,0,254,255,3,36,18,0,255,256,3,116,58,0,256,35,1,0,0,0,257,259,3,
      116,58,0,258,260,5,33,0,0,259,258,1,0,0,0,259,260,1,0,0,0,260,278,
      1,0,0,0,261,262,5,57,0,0,262,263,5,13,0,0,263,264,3,36,18,0,264,266,
      5,12,0,0,265,267,5,33,0,0,266,265,1,0,0,0,266,267,1,0,0,0,267,278,
      1,0,0,0,268,269,5,58,0,0,269,270,5,13,0,0,270,271,3,36,18,0,271,272,
      5,21,0,0,272,273,3,36,18,0,273,275,5,12,0,0,274,276,5,33,0,0,275,274,
      1,0,0,0,275,276,1,0,0,0,276,278,1,0,0,0,277,257,1,0,0,0,277,261,1,
      0,0,0,277,268,1,0,0,0,278,37,1,0,0,0,279,291,3,82,41,0,280,291,3,70,
      35,0,281,291,3,50,25,0,282,291,3,52,26,0,283,291,3,54,27,0,284,291,
      3,40,20,0,285,291,3,42,21,0,286,291,3,46,23,0,287,291,3,48,24,0,288,
      291,3,62,31,0,289,291,3,56,28,0,290,279,1,0,0,0,290,280,1,0,0,0,290,
      281,1,0,0,0,290,282,1,0,0,0,290,283,1,0,0,0,290,284,1,0,0,0,290,285,
      1,0,0,0,290,286,1,0,0,0,290,287,1,0,0,0,290,288,1,0,0,0,290,289,1,
      0,0,0,291,39,1,0,0,0,292,293,5,73,0,0,293,294,3,84,42,0,294,41,1,0,
      0,0,295,296,5,59,0,0,296,297,5,6,0,0,297,298,3,84,42,0,298,299,5,7,
      0,0,299,301,3,128,64,0,300,302,3,44,22,0,301,300,1,0,0,0,301,302,1,
      0,0,0,302,43,1,0,0,0,303,306,5,60,0,0,304,307,3,42,21,0,305,307,3,
      128,64,0,306,304,1,0,0,0,306,305,1,0,0,0,307,45,1,0,0,0,308,309,5,
      61,0,0,309,310,5,6,0,0,310,311,3,84,42,0,311,312,5,7,0,0,312,313,3,
      128,64,0,313,47,1,0,0,0,314,315,5,62,0,0,315,329,5,6,0,0,316,319,3,
      82,41,0,317,319,5,82,0,0,318,316,1,0,0,0,318,317,1,0,0,0,319,320,1,
      0,0,0,320,321,5,22,0,0,321,322,3,84,42,0,322,323,5,22,0,0,323,324,
      3,70,35,0,324,330,1,0,0,0,325,326,3,82,41,0,326,327,5,63,0,0,327,328,
      3,84,42,0,328,330,1,0,0,0,329,318,1,0,0,0,329,325,1,0,0,0,330,331,
      1,0,0,0,331,332,5,7,0,0,332,333,3,128,64,0,333,49,1,0,0,0,334,336,
      5,65,0,0,335,337,3,84,42,0,336,335,1,0,0,0,336,337,1,0,0,0,337,51,
      1,0,0,0,338,339,5,66,0,0,339,53,1,0,0,0,340,341,5,67,0,0,341,55,1,
      0,0,0,342,343,5,68,0,0,343,344,5,6,0,0,344,345,3,84,42,0,345,346,5,
      7,0,0,346,350,5,8,0,0,347,349,3,58,29,0,348,347,1,0,0,0,349,352,1,
      0,0,0,350,348,1,0,0,0,350,351,1,0,0,0,351,354,1,0,0,0,352,350,1,0,
      0,0,353,355,3,60,30,0,354,353,1,0,0,0,354,355,1,0,0,0,355,356,1,0,
      0,0,356,357,5,9,0,0,357,57,1,0,0,0,358,359,5,69,0,0,359,360,3,84,42,
      0,360,361,5,19,0,0,361,362,3,128,64,0,362,59,1,0,0,0,363,364,5,70,
      0,0,364,365,5,19,0,0,365,366,3,128,64,0,366,61,1,0,0,0,367,368,5,71,
      0,0,368,369,3,128,64,0,369,370,3,64,32,0,370,63,1,0,0,0,371,372,5,
      72,0,0,372,373,5,6,0,0,373,374,3,116,58,0,374,375,5,7,0,0,375,376,
      3,128,64,0,376,65,1,0,0,0,377,380,3,38,19,0,378,380,3,84,42,0,379,
      377,1,0,0,0,379,378,1,0,0,0,380,381,1,0,0,0,381,382,5,22,0,0,382,385,
      1,0,0,0,383,385,3,128,64,0,384,379,1,0,0,0,384,383,1,0,0,0,385,67,
      1,0,0,0,386,387,7,0,0,0,387,69,1,0,0,0,388,394,3,72,36,0,389,394,3,
      74,37,0,390,394,3,76,38,0,391,394,3,78,39,0,392,394,3,80,40,0,393,
      388,1,0,0,0,393,389,1,0,0,0,393,390,1,0,0,0,393,391,1,0,0,0,393,392,
      1,0,0,0,394,71,1,0,0,0,395,396,3,116,58,0,396,397,5,15,0,0,397,398,
      3,84,42,0,398,73,1,0,0,0,399,400,3,116,58,0,400,401,5,35,0,0,401,402,
      3,84,42,0,402,420,1,0,0,0,403,404,3,116,58,0,404,405,5,36,0,0,405,
      406,3,84,42,0,406,420,1,0,0,0,407,408,3,116,58,0,408,409,5,37,0,0,
      409,410,3,84,42,0,410,420,1,0,0,0,411,412,3,116,58,0,412,413,5,38,
      0,0,413,414,3,84,42,0,414,420,1,0,0,0,415,416,3,116,58,0,416,417,5,
      39,0,0,417,418,3,84,42,0,418,420,1,0,0,0,419,399,1,0,0,0,419,403,1,
      0,0,0,419,407,1,0,0,0,419,411,1,0,0,0,419,415,1,0,0,0,420,75,1,0,0,
      0,421,422,3,116,58,0,422,423,5,34,0,0,423,424,3,116,58,0,424,425,5,
      15,0,0,425,426,3,84,42,0,426,77,1,0,0,0,427,428,3,116,58,0,428,429,
      5,10,0,0,429,430,3,84,42,0,430,431,5,11,0,0,431,432,5,15,0,0,432,433,
      3,84,42,0,433,79,1,0,0,0,434,435,3,116,58,0,435,436,5,10,0,0,436,437,
      3,84,42,0,437,438,5,11,0,0,438,439,5,34,0,0,439,440,3,116,58,0,440,
      441,5,15,0,0,441,442,3,84,42,0,442,81,1,0,0,0,443,444,3,68,34,0,444,
      445,3,36,18,0,445,446,3,116,58,0,446,454,1,0,0,0,447,449,3,68,34,0,
      448,450,3,36,18,0,449,448,1,0,0,0,449,450,1,0,0,0,450,451,1,0,0,0,
      451,452,3,70,35,0,452,454,1,0,0,0,453,443,1,0,0,0,453,447,1,0,0,0,
      454,83,1,0,0,0,455,456,3,86,43,0,456,85,1,0,0,0,457,462,3,88,44,0,
      458,459,7,1,0,0,459,461,3,88,44,0,460,458,1,0,0,0,461,464,1,0,0,0,
      462,460,1,0,0,0,462,463,1,0,0,0,463,87,1,0,0,0,464,462,1,0,0,0,465,
      470,3,90,45,0,466,467,7,2,0,0,467,469,3,90,45,0,468,466,1,0,0,0,469,
      472,1,0,0,0,470,468,1,0,0,0,470,471,1,0,0,0,471,89,1,0,0,0,472,470,
      1,0,0,0,473,478,3,92,46,0,474,475,7,3,0,0,475,477,3,92,46,0,476,474,
      1,0,0,0,477,480,1,0,0,0,478,476,1,0,0,0,478,479,1,0,0,0,479,91,1,0,
      0,0,480,478,1,0,0,0,481,486,3,94,47,0,482,483,7,4,0,0,483,485,3,94,
      47,0,484,482,1,0,0,0,485,488,1,0,0,0,486,484,1,0,0,0,486,487,1,0,0,
      0,487,93,1,0,0,0,488,486,1,0,0,0,489,494,3,96,48,0,490,491,7,5,0,0,
      491,493,3,96,48,0,492,490,1,0,0,0,493,496,1,0,0,0,494,492,1,0,0,0,
      494,495,1,0,0,0,495,95,1,0,0,0,496,494,1,0,0,0,497,502,3,98,49,0,498,
      499,7,6,0,0,499,501,3,98,49,0,500,498,1,0,0,0,501,504,1,0,0,0,502,
      500,1,0,0,0,502,503,1,0,0,0,503,97,1,0,0,0,504,502,1,0,0,0,505,506,
      7,7,0,0,506,509,3,98,49,0,507,509,3,100,50,0,508,505,1,0,0,0,508,507,
      1,0,0,0,509,99,1,0,0,0,510,512,3,102,51,0,511,513,7,8,0,0,512,511,
      1,0,0,0,512,513,1,0,0,0,513,101,1,0,0,0,514,515,5,6,0,0,515,516,3,
      84,42,0,516,517,5,7,0,0,517,523,1,0,0,0,518,523,3,106,53,0,519,523,
      3,104,52,0,520,523,3,114,57,0,521,523,3,116,58,0,522,514,1,0,0,0,522,
      518,1,0,0,0,522,519,1,0,0,0,522,520,1,0,0,0,522,521,1,0,0,0,523,103,
      1,0,0,0,524,525,3,116,58,0,525,526,5,20,0,0,526,527,3,106,53,0,527,
      105,1,0,0,0,528,529,3,116,58,0,529,531,5,6,0,0,530,532,3,108,54,0,
      531,530,1,0,0,0,531,532,1,0,0,0,532,533,1,0,0,0,533,534,5,7,0,0,534,
      107,1,0,0,0,535,540,3,112,56,0,536,537,5,21,0,0,537,539,3,112,56,0,
      538,536,1,0,0,0,539,542,1,0,0,0,540,538,1,0,0,0,540,541,1,0,0,0,541,
      569,1,0,0,0,542,540,1,0,0,0,543,548,3,110,55,0,544,545,5,21,0,0,545,
      547,3,110,55,0,546,544,1,0,0,0,547,550,1,0,0,0,548,546,1,0,0,0,548,
      549,1,0,0,0,549,569,1,0,0,0,550,548,1,0,0,0,551,556,3,112,56,0,552,
      553,5,21,0,0,553,555,3,112,56,0,554,552,1,0,0,0,555,558,1,0,0,0,556,
      554,1,0,0,0,556,557,1,0,0,0,557,559,1,0,0,0,558,556,1,0,0,0,559,560,
      5,21,0,0,560,565,3,110,55,0,561,562,5,21,0,0,562,564,3,110,55,0,563,
      561,1,0,0,0,564,567,1,0,0,0,565,563,1,0,0,0,565,566,1,0,0,0,566,569,
      1,0,0,0,567,565,1,0,0,0,568,535,1,0,0,0,568,543,1,0,0,0,568,551,1,
      0,0,0,569,109,1,0,0,0,570,571,3,116,58,0,571,572,5,19,0,0,572,573,
      3,84,42,0,573,111,1,0,0,0,574,575,3,84,42,0,575,113,1,0,0,0,576,585,
      5,80,0,0,577,585,5,81,0,0,578,585,5,78,0,0,579,585,5,83,0,0,580,585,
      5,79,0,0,581,585,3,118,59,0,582,585,3,124,62,0,583,585,3,120,60,0,
      584,576,1,0,0,0,584,577,1,0,0,0,584,578,1,0,0,0,584,579,1,0,0,0,584,
      580,1,0,0,0,584,581,1,0,0,0,584,582,1,0,0,0,584,583,1,0,0,0,585,115,
      1,0,0,0,586,603,6,58,-1,0,587,604,5,82,0,0,588,604,5,45,0,0,589,604,
      5,51,0,0,590,604,5,46,0,0,591,604,5,47,0,0,592,604,5,48,0,0,593,604,
      5,49,0,0,594,604,5,50,0,0,595,604,5,52,0,0,596,604,5,53,0,0,597,604,
      5,54,0,0,598,604,5,55,0,0,599,604,5,56,0,0,600,604,5,57,0,0,601,604,
      5,58,0,0,602,604,5,44,0,0,603,587,1,0,0,0,603,588,1,0,0,0,603,589,
      1,0,0,0,603,590,1,0,0,0,603,591,1,0,0,0,603,592,1,0,0,0,603,593,1,
      0,0,0,603,594,1,0,0,0,603,595,1,0,0,0,603,596,1,0,0,0,603,597,1,0,
      0,0,603,598,1,0,0,0,603,599,1,0,0,0,603,600,1,0,0,0,603,601,1,0,0,
      0,603,602,1,0,0,0,604,607,1,0,0,0,605,608,5,25,0,0,606,608,5,33,0,
      0,607,605,1,0,0,0,607,606,1,0,0,0,607,608,1,0,0,0,608,622,1,0,0,0,
      609,610,10,1,0,0,610,611,5,34,0,0,611,621,3,116,58,2,612,613,10,2,
      0,0,613,614,5,10,0,0,614,615,3,84,42,0,615,618,5,11,0,0,616,619,5,
      25,0,0,617,619,5,33,0,0,618,616,1,0,0,0,618,617,1,0,0,0,618,619,1,
      0,0,0,619,621,1,0,0,0,620,609,1,0,0,0,620,612,1,0,0,0,621,624,1,0,
      0,0,622,620,1,0,0,0,622,623,1,0,0,0,623,117,1,0,0,0,624,622,1,0,0,
      0,625,634,5,10,0,0,626,631,3,84,42,0,627,628,5,21,0,0,628,630,3,84,
      42,0,629,627,1,0,0,0,630,633,1,0,0,0,631,629,1,0,0,0,631,632,1,0,0,
      0,632,635,1,0,0,0,633,631,1,0,0,0,634,626,1,0,0,0,634,635,1,0,0,0,
      635,636,1,0,0,0,636,637,5,11,0,0,637,119,1,0,0,0,638,639,5,42,0,0,
      639,640,3,116,58,0,640,649,5,8,0,0,641,646,3,122,61,0,642,643,5,21,
      0,0,643,645,3,122,61,0,644,642,1,0,0,0,645,648,1,0,0,0,646,644,1,0,
      0,0,646,647,1,0,0,0,647,650,1,0,0,0,648,646,1,0,0,0,649,641,1,0,0,
      0,649,650,1,0,0,0,650,651,1,0,0,0,651,652,5,9,0,0,652,121,1,0,0,0,
      653,654,3,116,58,0,654,655,5,19,0,0,655,656,3,84,42,0,656,123,1,0,
      0,0,657,666,5,8,0,0,658,663,3,126,63,0,659,660,5,21,0,0,660,662,3,
      126,63,0,661,659,1,0,0,0,662,665,1,0,0,0,663,661,1,0,0,0,663,664,1,
      0,0,0,664,667,1,0,0,0,665,663,1,0,0,0,666,658,1,0,0,0,666,667,1,0,
      0,0,667,668,1,0,0,0,668,669,5,9,0,0,669,125,1,0,0,0,670,671,3,84,42,
      0,671,672,5,19,0,0,672,673,3,84,42,0,673,127,1,0,0,0,674,678,5,8,0,
      0,675,677,3,66,33,0,676,675,1,0,0,0,677,680,1,0,0,0,678,676,1,0,0,
      0,678,679,1,0,0,0,679,681,1,0,0,0,680,678,1,0,0,0,681,689,5,9,0,0,
      682,689,3,42,21,0,683,689,3,46,23,0,684,689,3,48,24,0,685,689,3,56,
      28,0,686,689,3,62,31,0,687,689,3,64,32,0,688,674,1,0,0,0,688,682,1,
      0,0,0,688,683,1,0,0,0,688,684,1,0,0,0,688,685,1,0,0,0,688,686,1,0,
      0,0,688,687,1,0,0,0,689,129,1,0,0,0,57,134,140,153,193,208,210,219,
      228,239,251,259,266,275,277,290,301,306,318,329,336,350,354,379,384,
      393,419,449,453,462,470,478,486,494,502,508,512,522,531,540,548,556,
      565,568,584,603,607,618,620,622,631,634,646,649,663,666,678,688
  ];

  static final ATN _ATN =
      ATNDeserializer().deserialize(_serializedATN);
}
class ScriptContext extends ParserRuleContext {
  SchemaContext? schema() => getRuleContext<SchemaContext>(0);
  ContractContext? contract() => getRuleContext<ContractContext>(0);
  TerminalNode? EOF() => getToken(dscriptParser.TOKEN_EOF, 0);
  List<MetadataContext> metadatas() => getRuleContexts<MetadataContext>();
  MetadataContext? metadata(int i) => getRuleContext<MetadataContext>(i);
  List<PermissionsContext> permissionss() => getRuleContexts<PermissionsContext>();
  PermissionsContext? permissions(int i) => getRuleContext<PermissionsContext>(i);
  ScriptContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_script;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterScript(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitScript(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitScript(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class MetadataContext extends ParserRuleContext {
  NameContext? name() => getRuleContext<NameContext>(0);
  DescriptionContext? description() => getRuleContext<DescriptionContext>(0);
  AuthorContext? author() => getRuleContext<AuthorContext>(0);
  VersionContext? version() => getRuleContext<VersionContext>(0);
  LicenseContext? license() => getRuleContext<LicenseContext>(0);
  RepoContext? repo() => getRuleContext<RepoContext>(0);
  WebsiteContext? website() => getRuleContext<WebsiteContext>(0);
  MetadataContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_metadata;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterMetadata(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitMetadata(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitMetadata(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class SchemaContext extends ParserRuleContext {
  TerminalNode? SCHEMA() => getToken(dscriptParser.TOKEN_SCHEMA, 0);
  TerminalNode? STRING() => getToken(dscriptParser.TOKEN_STRING, 0);
  TerminalNode? SEMI() => getToken(dscriptParser.TOKEN_SEMI, 0);
  SchemaContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_schema;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterSchema(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitSchema(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitSchema(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class AuthorContext extends ParserRuleContext {
  TerminalNode? AUTHOR() => getToken(dscriptParser.TOKEN_AUTHOR, 0);
  TerminalNode? STRING() => getToken(dscriptParser.TOKEN_STRING, 0);
  TerminalNode? SEMI() => getToken(dscriptParser.TOKEN_SEMI, 0);
  AuthorContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_author;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterAuthor(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitAuthor(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitAuthor(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class DescriptionContext extends ParserRuleContext {
  TerminalNode? DESCRIPTION() => getToken(dscriptParser.TOKEN_DESCRIPTION, 0);
  TerminalNode? STRING() => getToken(dscriptParser.TOKEN_STRING, 0);
  TerminalNode? SEMI() => getToken(dscriptParser.TOKEN_SEMI, 0);
  DescriptionContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_description;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterDescription(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitDescription(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitDescription(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class VersionContext extends ParserRuleContext {
  TerminalNode? VERSION() => getToken(dscriptParser.TOKEN_VERSION, 0);
  TerminalNode? SEMVER() => getToken(dscriptParser.TOKEN_SEMVER, 0);
  TerminalNode? SEMI() => getToken(dscriptParser.TOKEN_SEMI, 0);
  VersionContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_version;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterVersion(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitVersion(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitVersion(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class LicenseContext extends ParserRuleContext {
  TerminalNode? LICENSE() => getToken(dscriptParser.TOKEN_LICENSE, 0);
  TerminalNode? STRING() => getToken(dscriptParser.TOKEN_STRING, 0);
  TerminalNode? SEMI() => getToken(dscriptParser.TOKEN_SEMI, 0);
  LicenseContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_license;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterLicense(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitLicense(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitLicense(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class RepoContext extends ParserRuleContext {
  TerminalNode? REPO() => getToken(dscriptParser.TOKEN_REPO, 0);
  TerminalNode? STRING() => getToken(dscriptParser.TOKEN_STRING, 0);
  TerminalNode? SEMI() => getToken(dscriptParser.TOKEN_SEMI, 0);
  RepoContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_repo;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterRepo(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitRepo(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitRepo(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class WebsiteContext extends ParserRuleContext {
  TerminalNode? WEBSITE() => getToken(dscriptParser.TOKEN_WEBSITE, 0);
  TerminalNode? STRING() => getToken(dscriptParser.TOKEN_STRING, 0);
  TerminalNode? SEMI() => getToken(dscriptParser.TOKEN_SEMI, 0);
  WebsiteContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_website;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterWebsite(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitWebsite(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitWebsite(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class NameContext extends ParserRuleContext {
  TerminalNode? NAME() => getToken(dscriptParser.TOKEN_NAME, 0);
  TerminalNode? STRING() => getToken(dscriptParser.TOKEN_STRING, 0);
  TerminalNode? SEMI() => getToken(dscriptParser.TOKEN_SEMI, 0);
  NameContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_name;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterName(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitName(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitName(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class PermissionsContext extends ParserRuleContext {
  TerminalNode? PERMISSIONS() => getToken(dscriptParser.TOKEN_PERMISSIONS, 0);
  List<PermissionContext> permissions() => getRuleContexts<PermissionContext>();
  PermissionContext? permission(int i) => getRuleContext<PermissionContext>(i);
  TerminalNode? SEMI() => getToken(dscriptParser.TOKEN_SEMI, 0);
  List<TerminalNode> COMMAs() => getTokens(dscriptParser.TOKEN_COMMA);
  TerminalNode? COMMA(int i) => getToken(dscriptParser.TOKEN_COMMA, i);
  PermissionsContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_permissions;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterPermissions(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitPermissions(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitPermissions(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class PermissionContext extends ParserRuleContext {
  IdentifierContext? namespace;
  IdentifierContext? perm;
  TerminalNode? DOUBLE_COLON() => getToken(dscriptParser.TOKEN_DOUBLE_COLON, 0);
  List<IdentifierContext> identifiers() => getRuleContexts<IdentifierContext>();
  IdentifierContext? identifier(int i) => getRuleContext<IdentifierContext>(i);
  PermissionContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_permission;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterPermission(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitPermission(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitPermission(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ContractContext extends ParserRuleContext {
  TerminalNode? CONTRACT() => getToken(dscriptParser.TOKEN_CONTRACT, 0);
  IdentifierContext? identifier() => getRuleContext<IdentifierContext>(0);
  TerminalNode? OPEN_BRACE() => getToken(dscriptParser.TOKEN_OPEN_BRACE, 0);
  TerminalNode? CLOSE_BRACE() => getToken(dscriptParser.TOKEN_CLOSE_BRACE, 0);
  List<HookContext> hooks() => getRuleContexts<HookContext>();
  HookContext? hook(int i) => getRuleContext<HookContext>(i);
  List<ImplContext> impls() => getRuleContexts<ImplContext>();
  ImplContext? impl(int i) => getRuleContext<ImplContext>(i);
  List<FuncContext> funcs() => getRuleContexts<FuncContext>();
  FuncContext? func(int i) => getRuleContext<FuncContext>(i);
  ContractContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_contract;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterContract(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitContract(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitContract(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class HookContext extends ParserRuleContext {
  TerminalNode? HOOK() => getToken(dscriptParser.TOKEN_HOOK, 0);
  IdentifierContext? identifier() => getRuleContext<IdentifierContext>(0);
  TerminalNode? OPEN_PAREN() => getToken(dscriptParser.TOKEN_OPEN_PAREN, 0);
  TerminalNode? CLOSE_PAREN() => getToken(dscriptParser.TOKEN_CLOSE_PAREN, 0);
  BlockContext? block() => getRuleContext<BlockContext>(0);
  ParamsContext? params() => getRuleContext<ParamsContext>(0);
  HookContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_hook;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterHook(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitHook(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitHook(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ImplContext extends ParserRuleContext {
  TerminalNode? IMPL() => getToken(dscriptParser.TOKEN_IMPL, 0);
  IdentifierContext? identifier() => getRuleContext<IdentifierContext>(0);
  TerminalNode? OPEN_PAREN() => getToken(dscriptParser.TOKEN_OPEN_PAREN, 0);
  TerminalNode? CLOSE_PAREN() => getToken(dscriptParser.TOKEN_CLOSE_PAREN, 0);
  TerminalNode? ARROW() => getToken(dscriptParser.TOKEN_ARROW, 0);
  DataTypeContext? dataType() => getRuleContext<DataTypeContext>(0);
  BlockContext? block() => getRuleContext<BlockContext>(0);
  ParamsContext? params() => getRuleContext<ParamsContext>(0);
  ImplContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_impl;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterImpl(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitImpl(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitImpl(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class FuncContext extends ParserRuleContext {
  TerminalNode? FUNC() => getToken(dscriptParser.TOKEN_FUNC, 0);
  IdentifierContext? identifier() => getRuleContext<IdentifierContext>(0);
  TerminalNode? OPEN_PAREN() => getToken(dscriptParser.TOKEN_OPEN_PAREN, 0);
  TerminalNode? CLOSE_PAREN() => getToken(dscriptParser.TOKEN_CLOSE_PAREN, 0);
  TerminalNode? ARROW() => getToken(dscriptParser.TOKEN_ARROW, 0);
  DataTypeContext? dataType() => getRuleContext<DataTypeContext>(0);
  BlockContext? block() => getRuleContext<BlockContext>(0);
  ParamsContext? params() => getRuleContext<ParamsContext>(0);
  FuncContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_func;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterFunc(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitFunc(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitFunc(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ParamsContext extends ParserRuleContext {
  List<ParamContext> params() => getRuleContexts<ParamContext>();
  ParamContext? param(int i) => getRuleContext<ParamContext>(i);
  List<TerminalNode> COMMAs() => getTokens(dscriptParser.TOKEN_COMMA);
  TerminalNode? COMMA(int i) => getToken(dscriptParser.TOKEN_COMMA, i);
  ParamsContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_params;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterParams(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitParams(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitParams(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ParamContext extends ParserRuleContext {
  DataTypeContext? dataType() => getRuleContext<DataTypeContext>(0);
  IdentifierContext? identifier() => getRuleContext<IdentifierContext>(0);
  ParamContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_param;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterParam(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitParam(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitParam(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class DataTypeContext extends ParserRuleContext {
  IdentifierContext? identifier() => getRuleContext<IdentifierContext>(0);
  TerminalNode? Q() => getToken(dscriptParser.TOKEN_Q, 0);
  TerminalNode? LIST() => getToken(dscriptParser.TOKEN_LIST, 0);
  TerminalNode? LT() => getToken(dscriptParser.TOKEN_LT, 0);
  List<DataTypeContext> dataTypes() => getRuleContexts<DataTypeContext>();
  DataTypeContext? dataType(int i) => getRuleContext<DataTypeContext>(i);
  TerminalNode? GT() => getToken(dscriptParser.TOKEN_GT, 0);
  TerminalNode? MAP() => getToken(dscriptParser.TOKEN_MAP, 0);
  TerminalNode? COMMA() => getToken(dscriptParser.TOKEN_COMMA, 0);
  DataTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_dataType;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterDataType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitDataType(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitDataType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class StmtContext extends ParserRuleContext {
  VarDeclContext? varDecl() => getRuleContext<VarDeclContext>(0);
  AssignmentContext? assignment() => getRuleContext<AssignmentContext>(0);
  ReturnStmtContext? returnStmt() => getRuleContext<ReturnStmtContext>(0);
  BreakStmtContext? breakStmt() => getRuleContext<BreakStmtContext>(0);
  ContinueStmtContext? continueStmt() => getRuleContext<ContinueStmtContext>(0);
  ThrowStmtContext? throwStmt() => getRuleContext<ThrowStmtContext>(0);
  IfStmtContext? ifStmt() => getRuleContext<IfStmtContext>(0);
  WhileStmtContext? whileStmt() => getRuleContext<WhileStmtContext>(0);
  ForStmtContext? forStmt() => getRuleContext<ForStmtContext>(0);
  TryStmtContext? tryStmt() => getRuleContext<TryStmtContext>(0);
  SwitchStmtContext? switchStmt() => getRuleContext<SwitchStmtContext>(0);
  StmtContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_stmt;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterStmt(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitStmt(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitStmt(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ThrowStmtContext extends ParserRuleContext {
  TerminalNode? THROW() => getToken(dscriptParser.TOKEN_THROW, 0);
  ExprContext? expr() => getRuleContext<ExprContext>(0);
  ThrowStmtContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_throwStmt;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterThrowStmt(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitThrowStmt(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitThrowStmt(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class IfStmtContext extends ParserRuleContext {
  TerminalNode? IF() => getToken(dscriptParser.TOKEN_IF, 0);
  TerminalNode? OPEN_PAREN() => getToken(dscriptParser.TOKEN_OPEN_PAREN, 0);
  ExprContext? expr() => getRuleContext<ExprContext>(0);
  TerminalNode? CLOSE_PAREN() => getToken(dscriptParser.TOKEN_CLOSE_PAREN, 0);
  BlockContext? block() => getRuleContext<BlockContext>(0);
  ElseStmtContext? elseStmt() => getRuleContext<ElseStmtContext>(0);
  IfStmtContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_ifStmt;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterIfStmt(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitIfStmt(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitIfStmt(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ElseStmtContext extends ParserRuleContext {
  TerminalNode? ELSE() => getToken(dscriptParser.TOKEN_ELSE, 0);
  IfStmtContext? ifStmt() => getRuleContext<IfStmtContext>(0);
  BlockContext? block() => getRuleContext<BlockContext>(0);
  ElseStmtContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_elseStmt;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterElseStmt(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitElseStmt(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitElseStmt(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class WhileStmtContext extends ParserRuleContext {
  TerminalNode? WHILE() => getToken(dscriptParser.TOKEN_WHILE, 0);
  TerminalNode? OPEN_PAREN() => getToken(dscriptParser.TOKEN_OPEN_PAREN, 0);
  ExprContext? expr() => getRuleContext<ExprContext>(0);
  TerminalNode? CLOSE_PAREN() => getToken(dscriptParser.TOKEN_CLOSE_PAREN, 0);
  BlockContext? block() => getRuleContext<BlockContext>(0);
  WhileStmtContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_whileStmt;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterWhileStmt(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitWhileStmt(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitWhileStmt(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ForStmtContext extends ParserRuleContext {
  TerminalNode? FOR() => getToken(dscriptParser.TOKEN_FOR, 0);
  TerminalNode? OPEN_PAREN() => getToken(dscriptParser.TOKEN_OPEN_PAREN, 0);
  TerminalNode? CLOSE_PAREN() => getToken(dscriptParser.TOKEN_CLOSE_PAREN, 0);
  BlockContext? block() => getRuleContext<BlockContext>(0);
  List<TerminalNode> SEMIs() => getTokens(dscriptParser.TOKEN_SEMI);
  TerminalNode? SEMI(int i) => getToken(dscriptParser.TOKEN_SEMI, i);
  ExprContext? expr() => getRuleContext<ExprContext>(0);
  AssignmentContext? assignment() => getRuleContext<AssignmentContext>(0);
  VarDeclContext? varDecl() => getRuleContext<VarDeclContext>(0);
  TerminalNode? IN() => getToken(dscriptParser.TOKEN_IN, 0);
  TerminalNode? IDENT() => getToken(dscriptParser.TOKEN_IDENT, 0);
  ForStmtContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_forStmt;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterForStmt(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitForStmt(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitForStmt(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ReturnStmtContext extends ParserRuleContext {
  TerminalNode? RETURN() => getToken(dscriptParser.TOKEN_RETURN, 0);
  ExprContext? expr() => getRuleContext<ExprContext>(0);
  ReturnStmtContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_returnStmt;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterReturnStmt(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitReturnStmt(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitReturnStmt(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class BreakStmtContext extends ParserRuleContext {
  TerminalNode? BREAK() => getToken(dscriptParser.TOKEN_BREAK, 0);
  BreakStmtContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_breakStmt;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterBreakStmt(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitBreakStmt(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitBreakStmt(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ContinueStmtContext extends ParserRuleContext {
  TerminalNode? CONTINUE() => getToken(dscriptParser.TOKEN_CONTINUE, 0);
  ContinueStmtContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_continueStmt;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterContinueStmt(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitContinueStmt(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitContinueStmt(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class SwitchStmtContext extends ParserRuleContext {
  TerminalNode? SWITCH() => getToken(dscriptParser.TOKEN_SWITCH, 0);
  TerminalNode? OPEN_PAREN() => getToken(dscriptParser.TOKEN_OPEN_PAREN, 0);
  ExprContext? expr() => getRuleContext<ExprContext>(0);
  TerminalNode? CLOSE_PAREN() => getToken(dscriptParser.TOKEN_CLOSE_PAREN, 0);
  TerminalNode? OPEN_BRACE() => getToken(dscriptParser.TOKEN_OPEN_BRACE, 0);
  TerminalNode? CLOSE_BRACE() => getToken(dscriptParser.TOKEN_CLOSE_BRACE, 0);
  List<CaseStmtContext> caseStmts() => getRuleContexts<CaseStmtContext>();
  CaseStmtContext? caseStmt(int i) => getRuleContext<CaseStmtContext>(i);
  DefaultStmtContext? defaultStmt() => getRuleContext<DefaultStmtContext>(0);
  SwitchStmtContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_switchStmt;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterSwitchStmt(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitSwitchStmt(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitSwitchStmt(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class CaseStmtContext extends ParserRuleContext {
  TerminalNode? CASE() => getToken(dscriptParser.TOKEN_CASE, 0);
  ExprContext? expr() => getRuleContext<ExprContext>(0);
  TerminalNode? COLON() => getToken(dscriptParser.TOKEN_COLON, 0);
  BlockContext? block() => getRuleContext<BlockContext>(0);
  CaseStmtContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_caseStmt;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterCaseStmt(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitCaseStmt(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitCaseStmt(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class DefaultStmtContext extends ParserRuleContext {
  TerminalNode? DEFAULT() => getToken(dscriptParser.TOKEN_DEFAULT, 0);
  TerminalNode? COLON() => getToken(dscriptParser.TOKEN_COLON, 0);
  BlockContext? block() => getRuleContext<BlockContext>(0);
  DefaultStmtContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_defaultStmt;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterDefaultStmt(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitDefaultStmt(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitDefaultStmt(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class TryStmtContext extends ParserRuleContext {
  TerminalNode? TRY() => getToken(dscriptParser.TOKEN_TRY, 0);
  BlockContext? block() => getRuleContext<BlockContext>(0);
  CatchBlockContext? catchBlock() => getRuleContext<CatchBlockContext>(0);
  TryStmtContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_tryStmt;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterTryStmt(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitTryStmt(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitTryStmt(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class CatchBlockContext extends ParserRuleContext {
  TerminalNode? CATCH() => getToken(dscriptParser.TOKEN_CATCH, 0);
  TerminalNode? OPEN_PAREN() => getToken(dscriptParser.TOKEN_OPEN_PAREN, 0);
  IdentifierContext? identifier() => getRuleContext<IdentifierContext>(0);
  TerminalNode? CLOSE_PAREN() => getToken(dscriptParser.TOKEN_CLOSE_PAREN, 0);
  BlockContext? block() => getRuleContext<BlockContext>(0);
  CatchBlockContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_catchBlock;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterCatchBlock(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitCatchBlock(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitCatchBlock(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class LineContext extends ParserRuleContext {
  TerminalNode? SEMI() => getToken(dscriptParser.TOKEN_SEMI, 0);
  StmtContext? stmt() => getRuleContext<StmtContext>(0);
  ExprContext? expr() => getRuleContext<ExprContext>(0);
  BlockContext? block() => getRuleContext<BlockContext>(0);
  LineContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_line;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterLine(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitLine(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitLine(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class VarTypeContext extends ParserRuleContext {
  TerminalNode? FINAL() => getToken(dscriptParser.TOKEN_FINAL, 0);
  TerminalNode? CONST() => getToken(dscriptParser.TOKEN_CONST, 0);
  TerminalNode? VAR() => getToken(dscriptParser.TOKEN_VAR, 0);
  VarTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_varType;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterVarType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitVarType(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitVarType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class AssignmentContext extends ParserRuleContext {
  SimpleAssignmentContext? simpleAssignment() => getRuleContext<SimpleAssignmentContext>(0);
  CompoundAssignmentContext? compoundAssignment() => getRuleContext<CompoundAssignmentContext>(0);
  PropertyAssignmentContext? propertyAssignment() => getRuleContext<PropertyAssignmentContext>(0);
  IndexAssignmentContext? indexAssignment() => getRuleContext<IndexAssignmentContext>(0);
  IndexPropertyAssignmentContext? indexPropertyAssignment() => getRuleContext<IndexPropertyAssignmentContext>(0);
  AssignmentContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_assignment;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterAssignment(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitAssignment(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitAssignment(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class SimpleAssignmentContext extends ParserRuleContext {
  IdentifierContext? identifier() => getRuleContext<IdentifierContext>(0);
  TerminalNode? ASSIGN() => getToken(dscriptParser.TOKEN_ASSIGN, 0);
  ExprContext? expr() => getRuleContext<ExprContext>(0);
  SimpleAssignmentContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_simpleAssignment;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterSimpleAssignment(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitSimpleAssignment(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitSimpleAssignment(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class CompoundAssignmentContext extends ParserRuleContext {
  Token? op;
  IdentifierContext? identifier() => getRuleContext<IdentifierContext>(0);
  ExprContext? expr() => getRuleContext<ExprContext>(0);
  TerminalNode? PLUS_ASSIGN() => getToken(dscriptParser.TOKEN_PLUS_ASSIGN, 0);
  TerminalNode? MINUS_ASSIGN() => getToken(dscriptParser.TOKEN_MINUS_ASSIGN, 0);
  TerminalNode? MULTIPLY_ASSIGN() => getToken(dscriptParser.TOKEN_MULTIPLY_ASSIGN, 0);
  TerminalNode? DIVIDE_ASSIGN() => getToken(dscriptParser.TOKEN_DIVIDE_ASSIGN, 0);
  TerminalNode? MOD_ASSIGN() => getToken(dscriptParser.TOKEN_MOD_ASSIGN, 0);
  CompoundAssignmentContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_compoundAssignment;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterCompoundAssignment(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitCompoundAssignment(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitCompoundAssignment(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class PropertyAssignmentContext extends ParserRuleContext {
  List<IdentifierContext> identifiers() => getRuleContexts<IdentifierContext>();
  IdentifierContext? identifier(int i) => getRuleContext<IdentifierContext>(i);
  TerminalNode? DOT() => getToken(dscriptParser.TOKEN_DOT, 0);
  TerminalNode? ASSIGN() => getToken(dscriptParser.TOKEN_ASSIGN, 0);
  ExprContext? expr() => getRuleContext<ExprContext>(0);
  PropertyAssignmentContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_propertyAssignment;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterPropertyAssignment(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitPropertyAssignment(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitPropertyAssignment(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class IndexAssignmentContext extends ParserRuleContext {
  IdentifierContext? identifier() => getRuleContext<IdentifierContext>(0);
  TerminalNode? OPEN_BRACKET() => getToken(dscriptParser.TOKEN_OPEN_BRACKET, 0);
  List<ExprContext> exprs() => getRuleContexts<ExprContext>();
  ExprContext? expr(int i) => getRuleContext<ExprContext>(i);
  TerminalNode? CLOSE_BRACKET() => getToken(dscriptParser.TOKEN_CLOSE_BRACKET, 0);
  TerminalNode? ASSIGN() => getToken(dscriptParser.TOKEN_ASSIGN, 0);
  IndexAssignmentContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_indexAssignment;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterIndexAssignment(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitIndexAssignment(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitIndexAssignment(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class IndexPropertyAssignmentContext extends ParserRuleContext {
  List<IdentifierContext> identifiers() => getRuleContexts<IdentifierContext>();
  IdentifierContext? identifier(int i) => getRuleContext<IdentifierContext>(i);
  TerminalNode? OPEN_BRACKET() => getToken(dscriptParser.TOKEN_OPEN_BRACKET, 0);
  List<ExprContext> exprs() => getRuleContexts<ExprContext>();
  ExprContext? expr(int i) => getRuleContext<ExprContext>(i);
  TerminalNode? CLOSE_BRACKET() => getToken(dscriptParser.TOKEN_CLOSE_BRACKET, 0);
  TerminalNode? DOT() => getToken(dscriptParser.TOKEN_DOT, 0);
  TerminalNode? ASSIGN() => getToken(dscriptParser.TOKEN_ASSIGN, 0);
  IndexPropertyAssignmentContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_indexPropertyAssignment;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterIndexPropertyAssignment(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitIndexPropertyAssignment(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitIndexPropertyAssignment(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class VarDeclContext extends ParserRuleContext {
  VarTypeContext? varType() => getRuleContext<VarTypeContext>(0);
  DataTypeContext? dataType() => getRuleContext<DataTypeContext>(0);
  IdentifierContext? identifier() => getRuleContext<IdentifierContext>(0);
  AssignmentContext? assignment() => getRuleContext<AssignmentContext>(0);
  VarDeclContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_varDecl;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterVarDecl(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitVarDecl(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitVarDecl(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ExprContext extends ParserRuleContext {
  LogicalExprContext? logicalExpr() => getRuleContext<LogicalExprContext>(0);
  ExprContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_expr;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterExpr(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitExpr(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitExpr(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class LogicalExprContext extends ParserRuleContext {
  RelationalExprContext? left;
  Token? op;
  RelationalExprContext? right;
  List<RelationalExprContext> relationalExprs() => getRuleContexts<RelationalExprContext>();
  RelationalExprContext? relationalExpr(int i) => getRuleContext<RelationalExprContext>(i);
  List<TerminalNode> ANDs() => getTokens(dscriptParser.TOKEN_AND);
  TerminalNode? AND(int i) => getToken(dscriptParser.TOKEN_AND, i);
  List<TerminalNode> ORs() => getTokens(dscriptParser.TOKEN_OR);
  TerminalNode? OR(int i) => getToken(dscriptParser.TOKEN_OR, i);
  LogicalExprContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_logicalExpr;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterLogicalExpr(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitLogicalExpr(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitLogicalExpr(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class RelationalExprContext extends ParserRuleContext {
  BitwiseExprContext? left;
  Token? op;
  BitwiseExprContext? right;
  List<BitwiseExprContext> bitwiseExprs() => getRuleContexts<BitwiseExprContext>();
  BitwiseExprContext? bitwiseExpr(int i) => getRuleContext<BitwiseExprContext>(i);
  List<TerminalNode> GTs() => getTokens(dscriptParser.TOKEN_GT);
  TerminalNode? GT(int i) => getToken(dscriptParser.TOKEN_GT, i);
  List<TerminalNode> LTs() => getTokens(dscriptParser.TOKEN_LT);
  TerminalNode? LT(int i) => getToken(dscriptParser.TOKEN_LT, i);
  List<TerminalNode> EQs() => getTokens(dscriptParser.TOKEN_EQ);
  TerminalNode? EQ(int i) => getToken(dscriptParser.TOKEN_EQ, i);
  List<TerminalNode> NEs() => getTokens(dscriptParser.TOKEN_NE);
  TerminalNode? NE(int i) => getToken(dscriptParser.TOKEN_NE, i);
  List<TerminalNode> GTEs() => getTokens(dscriptParser.TOKEN_GTE);
  TerminalNode? GTE(int i) => getToken(dscriptParser.TOKEN_GTE, i);
  List<TerminalNode> LTEs() => getTokens(dscriptParser.TOKEN_LTE);
  TerminalNode? LTE(int i) => getToken(dscriptParser.TOKEN_LTE, i);
  RelationalExprContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_relationalExpr;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterRelationalExpr(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitRelationalExpr(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitRelationalExpr(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class BitwiseExprContext extends ParserRuleContext {
  ShiftExprContext? left;
  Token? op;
  ShiftExprContext? right;
  List<ShiftExprContext> shiftExprs() => getRuleContexts<ShiftExprContext>();
  ShiftExprContext? shiftExpr(int i) => getRuleContext<ShiftExprContext>(i);
  List<TerminalNode> BIT_ANDs() => getTokens(dscriptParser.TOKEN_BIT_AND);
  TerminalNode? BIT_AND(int i) => getToken(dscriptParser.TOKEN_BIT_AND, i);
  List<TerminalNode> BIT_ORs() => getTokens(dscriptParser.TOKEN_BIT_OR);
  TerminalNode? BIT_OR(int i) => getToken(dscriptParser.TOKEN_BIT_OR, i);
  List<TerminalNode> BIT_XORs() => getTokens(dscriptParser.TOKEN_BIT_XOR);
  TerminalNode? BIT_XOR(int i) => getToken(dscriptParser.TOKEN_BIT_XOR, i);
  BitwiseExprContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_bitwiseExpr;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterBitwiseExpr(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitBitwiseExpr(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitBitwiseExpr(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ShiftExprContext extends ParserRuleContext {
  AdditiveExprContext? left;
  Token? op;
  AdditiveExprContext? right;
  List<AdditiveExprContext> additiveExprs() => getRuleContexts<AdditiveExprContext>();
  AdditiveExprContext? additiveExpr(int i) => getRuleContext<AdditiveExprContext>(i);
  List<TerminalNode> BIT_LEFT_SHIFTs() => getTokens(dscriptParser.TOKEN_BIT_LEFT_SHIFT);
  TerminalNode? BIT_LEFT_SHIFT(int i) => getToken(dscriptParser.TOKEN_BIT_LEFT_SHIFT, i);
  List<TerminalNode> BIT_RIGHT_SHIFTs() => getTokens(dscriptParser.TOKEN_BIT_RIGHT_SHIFT);
  TerminalNode? BIT_RIGHT_SHIFT(int i) => getToken(dscriptParser.TOKEN_BIT_RIGHT_SHIFT, i);
  ShiftExprContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_shiftExpr;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterShiftExpr(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitShiftExpr(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitShiftExpr(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class AdditiveExprContext extends ParserRuleContext {
  MultiplicativeExprContext? left;
  Token? op;
  MultiplicativeExprContext? right;
  List<MultiplicativeExprContext> multiplicativeExprs() => getRuleContexts<MultiplicativeExprContext>();
  MultiplicativeExprContext? multiplicativeExpr(int i) => getRuleContext<MultiplicativeExprContext>(i);
  List<TerminalNode> PLUSs() => getTokens(dscriptParser.TOKEN_PLUS);
  TerminalNode? PLUS(int i) => getToken(dscriptParser.TOKEN_PLUS, i);
  List<TerminalNode> MINUSs() => getTokens(dscriptParser.TOKEN_MINUS);
  TerminalNode? MINUS(int i) => getToken(dscriptParser.TOKEN_MINUS, i);
  AdditiveExprContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_additiveExpr;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterAdditiveExpr(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitAdditiveExpr(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitAdditiveExpr(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class MultiplicativeExprContext extends ParserRuleContext {
  UnaryExprContext? left;
  Token? op;
  UnaryExprContext? right;
  List<UnaryExprContext> unaryExprs() => getRuleContexts<UnaryExprContext>();
  UnaryExprContext? unaryExpr(int i) => getRuleContext<UnaryExprContext>(i);
  List<TerminalNode> MULTIPLYs() => getTokens(dscriptParser.TOKEN_MULTIPLY);
  TerminalNode? MULTIPLY(int i) => getToken(dscriptParser.TOKEN_MULTIPLY, i);
  List<TerminalNode> DIVIDEs() => getTokens(dscriptParser.TOKEN_DIVIDE);
  TerminalNode? DIVIDE(int i) => getToken(dscriptParser.TOKEN_DIVIDE, i);
  List<TerminalNode> MODs() => getTokens(dscriptParser.TOKEN_MOD);
  TerminalNode? MOD(int i) => getToken(dscriptParser.TOKEN_MOD, i);
  MultiplicativeExprContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_multiplicativeExpr;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterMultiplicativeExpr(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitMultiplicativeExpr(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitMultiplicativeExpr(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class UnaryExprContext extends ParserRuleContext {
  Token? op;
  UnaryExprContext? unaryExpr() => getRuleContext<UnaryExprContext>(0);
  TerminalNode? PLUS() => getToken(dscriptParser.TOKEN_PLUS, 0);
  TerminalNode? MINUS() => getToken(dscriptParser.TOKEN_MINUS, 0);
  TerminalNode? NOT() => getToken(dscriptParser.TOKEN_NOT, 0);
  TerminalNode? BIT_NOT() => getToken(dscriptParser.TOKEN_BIT_NOT, 0);
  SuffixExprContext? suffixExpr() => getRuleContext<SuffixExprContext>(0);
  UnaryExprContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_unaryExpr;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterUnaryExpr(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitUnaryExpr(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitUnaryExpr(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class SuffixExprContext extends ParserRuleContext {
  Token? op;
  PrimaryExprContext? primaryExpr() => getRuleContext<PrimaryExprContext>(0);
  TerminalNode? PLUS_PLUS() => getToken(dscriptParser.TOKEN_PLUS_PLUS, 0);
  TerminalNode? MINUS_MINUS() => getToken(dscriptParser.TOKEN_MINUS_MINUS, 0);
  SuffixExprContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_suffixExpr;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterSuffixExpr(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitSuffixExpr(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitSuffixExpr(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class PrimaryExprContext extends ParserRuleContext {
  TerminalNode? OPEN_PAREN() => getToken(dscriptParser.TOKEN_OPEN_PAREN, 0);
  ExprContext? expr() => getRuleContext<ExprContext>(0);
  TerminalNode? CLOSE_PAREN() => getToken(dscriptParser.TOKEN_CLOSE_PAREN, 0);
  FunctionCallContext? functionCall() => getRuleContext<FunctionCallContext>(0);
  ExternalFunctionCallContext? externalFunctionCall() => getRuleContext<ExternalFunctionCallContext>(0);
  LiteralContext? literal() => getRuleContext<LiteralContext>(0);
  IdentifierContext? identifier() => getRuleContext<IdentifierContext>(0);
  PrimaryExprContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_primaryExpr;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterPrimaryExpr(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitPrimaryExpr(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitPrimaryExpr(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ExternalFunctionCallContext extends ParserRuleContext {
  IdentifierContext? namespace;
  TerminalNode? DOUBLE_COLON() => getToken(dscriptParser.TOKEN_DOUBLE_COLON, 0);
  FunctionCallContext? functionCall() => getRuleContext<FunctionCallContext>(0);
  IdentifierContext? identifier() => getRuleContext<IdentifierContext>(0);
  ExternalFunctionCallContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_externalFunctionCall;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterExternalFunctionCall(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitExternalFunctionCall(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitExternalFunctionCall(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class FunctionCallContext extends ParserRuleContext {
  IdentifierContext? method;
  TerminalNode? OPEN_PAREN() => getToken(dscriptParser.TOKEN_OPEN_PAREN, 0);
  TerminalNode? CLOSE_PAREN() => getToken(dscriptParser.TOKEN_CLOSE_PAREN, 0);
  IdentifierContext? identifier() => getRuleContext<IdentifierContext>(0);
  ArgsContext? args() => getRuleContext<ArgsContext>(0);
  FunctionCallContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_functionCall;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterFunctionCall(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitFunctionCall(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitFunctionCall(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ArgsContext extends ParserRuleContext {
  List<PositionalArgContext> positionalArgs() => getRuleContexts<PositionalArgContext>();
  PositionalArgContext? positionalArg(int i) => getRuleContext<PositionalArgContext>(i);
  List<TerminalNode> COMMAs() => getTokens(dscriptParser.TOKEN_COMMA);
  TerminalNode? COMMA(int i) => getToken(dscriptParser.TOKEN_COMMA, i);
  List<NamedArgContext> namedArgs() => getRuleContexts<NamedArgContext>();
  NamedArgContext? namedArg(int i) => getRuleContext<NamedArgContext>(i);
  ArgsContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_args;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterArgs(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitArgs(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitArgs(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class NamedArgContext extends ParserRuleContext {
  IdentifierContext? identifier() => getRuleContext<IdentifierContext>(0);
  TerminalNode? COLON() => getToken(dscriptParser.TOKEN_COLON, 0);
  ExprContext? expr() => getRuleContext<ExprContext>(0);
  NamedArgContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_namedArg;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterNamedArg(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitNamedArg(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitNamedArg(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class PositionalArgContext extends ParserRuleContext {
  ExprContext? expr() => getRuleContext<ExprContext>(0);
  PositionalArgContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_positionalArg;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterPositionalArg(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitPositionalArg(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitPositionalArg(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class LiteralContext extends ParserRuleContext {
  TerminalNode? INT() => getToken(dscriptParser.TOKEN_INT, 0);
  TerminalNode? DOUBLE() => getToken(dscriptParser.TOKEN_DOUBLE, 0);
  TerminalNode? BOOL() => getToken(dscriptParser.TOKEN_BOOL, 0);
  TerminalNode? STRING() => getToken(dscriptParser.TOKEN_STRING, 0);
  TerminalNode? NULL() => getToken(dscriptParser.TOKEN_NULL, 0);
  ArrayLiteralContext? arrayLiteral() => getRuleContext<ArrayLiteralContext>(0);
  MapLiteralContext? mapLiteral() => getRuleContext<MapLiteralContext>(0);
  ObjectLiteralContext? objectLiteral() => getRuleContext<ObjectLiteralContext>(0);
  LiteralContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_literal;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterLiteral(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitLiteral(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitLiteral(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class IdentifierContext extends ParserRuleContext {
  IdentifierContext? indexIdent;
  IdentifierContext? objIdent;
  Token? ident;
  Token? nullAware;
  Token? allowNull;
  IdentifierContext? property;
  ExprContext? index;
  TerminalNode? IDENT() => getToken(dscriptParser.TOKEN_IDENT, 0);
  TerminalNode? AUTHOR() => getToken(dscriptParser.TOKEN_AUTHOR, 0);
  TerminalNode? NAME() => getToken(dscriptParser.TOKEN_NAME, 0);
  TerminalNode? DESCRIPTION() => getToken(dscriptParser.TOKEN_DESCRIPTION, 0);
  TerminalNode? VERSION() => getToken(dscriptParser.TOKEN_VERSION, 0);
  TerminalNode? LICENSE() => getToken(dscriptParser.TOKEN_LICENSE, 0);
  TerminalNode? REPO() => getToken(dscriptParser.TOKEN_REPO, 0);
  TerminalNode? WEBSITE() => getToken(dscriptParser.TOKEN_WEBSITE, 0);
  TerminalNode? PERMISSIONS() => getToken(dscriptParser.TOKEN_PERMISSIONS, 0);
  TerminalNode? CONTRACT() => getToken(dscriptParser.TOKEN_CONTRACT, 0);
  TerminalNode? IMPL() => getToken(dscriptParser.TOKEN_IMPL, 0);
  TerminalNode? HOOK() => getToken(dscriptParser.TOKEN_HOOK, 0);
  TerminalNode? FUNC() => getToken(dscriptParser.TOKEN_FUNC, 0);
  TerminalNode? LIST() => getToken(dscriptParser.TOKEN_LIST, 0);
  TerminalNode? MAP() => getToken(dscriptParser.TOKEN_MAP, 0);
  TerminalNode? SCHEMA() => getToken(dscriptParser.TOKEN_SCHEMA, 0);
  TerminalNode? NOT() => getToken(dscriptParser.TOKEN_NOT, 0);
  TerminalNode? Q() => getToken(dscriptParser.TOKEN_Q, 0);
  TerminalNode? DOT() => getToken(dscriptParser.TOKEN_DOT, 0);
  List<IdentifierContext> identifiers() => getRuleContexts<IdentifierContext>();
  IdentifierContext? identifier(int i) => getRuleContext<IdentifierContext>(i);
  TerminalNode? OPEN_BRACKET() => getToken(dscriptParser.TOKEN_OPEN_BRACKET, 0);
  TerminalNode? CLOSE_BRACKET() => getToken(dscriptParser.TOKEN_CLOSE_BRACKET, 0);
  ExprContext? expr() => getRuleContext<ExprContext>(0);
  IdentifierContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_identifier;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterIdentifier(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitIdentifier(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitIdentifier(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ArrayLiteralContext extends ParserRuleContext {
  TerminalNode? OPEN_BRACKET() => getToken(dscriptParser.TOKEN_OPEN_BRACKET, 0);
  TerminalNode? CLOSE_BRACKET() => getToken(dscriptParser.TOKEN_CLOSE_BRACKET, 0);
  List<ExprContext> exprs() => getRuleContexts<ExprContext>();
  ExprContext? expr(int i) => getRuleContext<ExprContext>(i);
  List<TerminalNode> COMMAs() => getTokens(dscriptParser.TOKEN_COMMA);
  TerminalNode? COMMA(int i) => getToken(dscriptParser.TOKEN_COMMA, i);
  ArrayLiteralContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_arrayLiteral;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterArrayLiteral(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitArrayLiteral(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitArrayLiteral(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ObjectLiteralContext extends ParserRuleContext {
  TerminalNode? AT() => getToken(dscriptParser.TOKEN_AT, 0);
  IdentifierContext? identifier() => getRuleContext<IdentifierContext>(0);
  TerminalNode? OPEN_BRACE() => getToken(dscriptParser.TOKEN_OPEN_BRACE, 0);
  TerminalNode? CLOSE_BRACE() => getToken(dscriptParser.TOKEN_CLOSE_BRACE, 0);
  List<ObjectPropertyContext> objectPropertys() => getRuleContexts<ObjectPropertyContext>();
  ObjectPropertyContext? objectProperty(int i) => getRuleContext<ObjectPropertyContext>(i);
  List<TerminalNode> COMMAs() => getTokens(dscriptParser.TOKEN_COMMA);
  TerminalNode? COMMA(int i) => getToken(dscriptParser.TOKEN_COMMA, i);
  ObjectLiteralContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_objectLiteral;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterObjectLiteral(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitObjectLiteral(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitObjectLiteral(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ObjectPropertyContext extends ParserRuleContext {
  IdentifierContext? identifier() => getRuleContext<IdentifierContext>(0);
  TerminalNode? COLON() => getToken(dscriptParser.TOKEN_COLON, 0);
  ExprContext? expr() => getRuleContext<ExprContext>(0);
  ObjectPropertyContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_objectProperty;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterObjectProperty(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitObjectProperty(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitObjectProperty(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class MapLiteralContext extends ParserRuleContext {
  TerminalNode? OPEN_BRACE() => getToken(dscriptParser.TOKEN_OPEN_BRACE, 0);
  TerminalNode? CLOSE_BRACE() => getToken(dscriptParser.TOKEN_CLOSE_BRACE, 0);
  List<MapEntryContext> mapEntrys() => getRuleContexts<MapEntryContext>();
  MapEntryContext? mapEntry(int i) => getRuleContext<MapEntryContext>(i);
  List<TerminalNode> COMMAs() => getTokens(dscriptParser.TOKEN_COMMA);
  TerminalNode? COMMA(int i) => getToken(dscriptParser.TOKEN_COMMA, i);
  MapLiteralContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_mapLiteral;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterMapLiteral(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitMapLiteral(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitMapLiteral(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class MapEntryContext extends ParserRuleContext {
  ExprContext? key;
  ExprContext? value;
  TerminalNode? COLON() => getToken(dscriptParser.TOKEN_COLON, 0);
  List<ExprContext> exprs() => getRuleContexts<ExprContext>();
  ExprContext? expr(int i) => getRuleContext<ExprContext>(i);
  MapEntryContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_mapEntry;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterMapEntry(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitMapEntry(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitMapEntry(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class BlockContext extends ParserRuleContext {
  TerminalNode? OPEN_BRACE() => getToken(dscriptParser.TOKEN_OPEN_BRACE, 0);
  TerminalNode? CLOSE_BRACE() => getToken(dscriptParser.TOKEN_CLOSE_BRACE, 0);
  List<LineContext> lines() => getRuleContexts<LineContext>();
  LineContext? line(int i) => getRuleContext<LineContext>(i);
  IfStmtContext? ifStmt() => getRuleContext<IfStmtContext>(0);
  WhileStmtContext? whileStmt() => getRuleContext<WhileStmtContext>(0);
  ForStmtContext? forStmt() => getRuleContext<ForStmtContext>(0);
  SwitchStmtContext? switchStmt() => getRuleContext<SwitchStmtContext>(0);
  TryStmtContext? tryStmt() => getRuleContext<TryStmtContext>(0);
  CatchBlockContext? catchBlock() => getRuleContext<CatchBlockContext>(0);
  BlockContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_block;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.enterBlock(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is dscriptListener) listener.exitBlock(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is dscriptVisitor<T>) {
     return visitor.visitBlock(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

