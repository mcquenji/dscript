// Generated from dscript.g4 by ANTLR 4.13.2
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'dscriptListener.dart';
import 'dscriptBaseListener.dart';
import 'dscriptVisitor.dart';
import 'dscriptBaseVisitor.dart';
const int RULE_script = 0, RULE_metadata = 1, RULE_author = 2, RULE_description = 3, 
          RULE_version = 4, RULE_license = 5, RULE_repo = 6, RULE_website = 7, 
          RULE_name = 8, RULE_permissions = 9, RULE_permission = 10, RULE_contract = 11, 
          RULE_hook = 12, RULE_impl = 13, RULE_func = 14, RULE_params = 15, 
          RULE_param = 16, RULE_dataType = 17, RULE_stmt = 18, RULE_throwStmt = 19, 
          RULE_ifStmt = 20, RULE_elseStmt = 21, RULE_whileStmt = 22, RULE_forStmt = 23, 
          RULE_returnStmt = 24, RULE_breakStmt = 25, RULE_continueStmt = 26, 
          RULE_switchStmt = 27, RULE_caseStmt = 28, RULE_defaultStmt = 29, 
          RULE_tryStmt = 30, RULE_catchBlock = 31, RULE_line = 32, RULE_varType = 33, 
          RULE_assignment = 34, RULE_simpleAssignment = 35, RULE_compoundAssignment = 36, 
          RULE_propertyAssignment = 37, RULE_indexAssignment = 38, RULE_indexPropertyAssignment = 39, 
          RULE_varDecl = 40, RULE_expr = 41, RULE_logicalExpr = 42, RULE_relationalExpr = 43, 
          RULE_bitwiseExpr = 44, RULE_shiftExpr = 45, RULE_additiveExpr = 46, 
          RULE_multiplicativeExpr = 47, RULE_unaryExpr = 48, RULE_primaryExpr = 49, 
          RULE_externalFunctionCall = 50, RULE_functionCall = 51, RULE_args = 52, 
          RULE_namedArg = 53, RULE_positionalArg = 54, RULE_literal = 55, 
          RULE_identifier = 56, RULE_arrayLiteral = 57, RULE_objectLiteral = 58, 
          RULE_objectProperty = 59, RULE_mapLiteral = 60, RULE_mapEntry = 61, 
          RULE_block = 62;
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
                   TOKEN_AT = 42, TOKEN_DOLLAR = 43, TOKEN_AUTHOR = 44, 
                   TOKEN_DESCRIPTION = 45, TOKEN_VERSION = 46, TOKEN_LICENSE = 47, 
                   TOKEN_REPO = 48, TOKEN_WEBSITE = 49, TOKEN_NAME = 50, 
                   TOKEN_PERMISSIONS = 51, TOKEN_CONTRACT = 52, TOKEN_IMPL = 53, 
                   TOKEN_HOOK = 54, TOKEN_FUNC = 55, TOKEN_LIST = 56, TOKEN_MAP = 57, 
                   TOKEN_IF = 58, TOKEN_ELSE = 59, TOKEN_WHILE = 60, TOKEN_FOR = 61, 
                   TOKEN_IN = 62, TOKEN_DO = 63, TOKEN_RETURN = 64, TOKEN_BREAK = 65, 
                   TOKEN_CONTINUE = 66, TOKEN_SWITCH = 67, TOKEN_CASE = 68, 
                   TOKEN_DEFAULT = 69, TOKEN_TRY = 70, TOKEN_CATCH = 71, 
                   TOKEN_THROW = 72, TOKEN_FINAL = 73, TOKEN_CONST = 74, 
                   TOKEN_VAR = 75, TOKEN_SEMVER = 76, TOKEN_BOOL = 77, TOKEN_NULL = 78, 
                   TOKEN_INT = 79, TOKEN_DOUBLE = 80, TOKEN_IDENT = 81, 
                   TOKEN_STRING = 82, TOKEN_WS = 83, TOKEN_COMMENT = 84, 
                   TOKEN_DOC_COMMENT = 85;

  @override
  final List<String> ruleNames = [
    'script', 'metadata', 'author', 'description', 'version', 'license', 
    'repo', 'website', 'name', 'permissions', 'permission', 'contract', 
    'hook', 'impl', 'func', 'params', 'param', 'dataType', 'stmt', 'throwStmt', 
    'ifStmt', 'elseStmt', 'whileStmt', 'forStmt', 'returnStmt', 'breakStmt', 
    'continueStmt', 'switchStmt', 'caseStmt', 'defaultStmt', 'tryStmt', 
    'catchBlock', 'line', 'varType', 'assignment', 'simpleAssignment', 'compoundAssignment', 
    'propertyAssignment', 'indexAssignment', 'indexPropertyAssignment', 
    'varDecl', 'expr', 'logicalExpr', 'relationalExpr', 'bitwiseExpr', 'shiftExpr', 
    'additiveExpr', 'multiplicativeExpr', 'unaryExpr', 'primaryExpr', 'externalFunctionCall', 
    'functionCall', 'args', 'namedArg', 'positionalArg', 'literal', 'identifier', 
    'arrayLiteral', 'objectLiteral', 'objectProperty', 'mapLiteral', 'mapEntry', 
    'block'
  ];

  static final List<String?> _LITERAL_NAMES = [
      null, "'+'", "'-'", "'*'", "'/'", "'%'", "'('", "')'", "'{'", "'}'", 
      "'['", "']'", "'>'", "'<'", "'=='", "'='", "'!='", "'>='", "'<='", 
      "':'", "'::'", "','", "';'", "'&&'", "'||'", "'!'", "'&'", "'|'", 
      "'^'", "'~'", "'<<'", "'>>'", "'->'", "'?'", "'.'", "'+='", "'-='", 
      "'*='", "'/='", "'%='", "'++'", "'--'", "'@'", "'\$'", "'author'", 
      "'description'", "'version'", "'license'", "'repo'", "'website'", 
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
      "MOD_ASSIGN", "PLUS_PLUS", "MINUS_MINUS", "AT", "DOLLAR", "AUTHOR", 
      "DESCRIPTION", "VERSION", "LICENSE", "REPO", "WEBSITE", "NAME", "PERMISSIONS", 
      "CONTRACT", "IMPL", "HOOK", "FUNC", "LIST", "MAP", "IF", "ELSE", "WHILE", 
      "FOR", "IN", "DO", "RETURN", "BREAK", "CONTINUE", "SWITCH", "CASE", 
      "DEFAULT", "TRY", "CATCH", "THROW", "FINAL", "CONST", "VAR", "SEMVER", 
      "BOOL", "NULL", "INT", "DOUBLE", "IDENT", "STRING", "WS", "COMMENT", 
      "DOC_COMMENT"
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
      state = 129;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 2234207627640832) != 0)) {
        state = 126;
        metadata();
        state = 131;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 135;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_PERMISSIONS) {
        state = 132;
        permissions();
        state = 137;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 138;
      contract();
      state = 139;
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
      state = 148;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_NAME:
        enterOuterAlt(_localctx, 1);
        state = 141;
        name();
        break;
      case TOKEN_DESCRIPTION:
        enterOuterAlt(_localctx, 2);
        state = 142;
        description();
        break;
      case TOKEN_AUTHOR:
        enterOuterAlt(_localctx, 3);
        state = 143;
        author();
        break;
      case TOKEN_VERSION:
        enterOuterAlt(_localctx, 4);
        state = 144;
        version();
        break;
      case TOKEN_LICENSE:
        enterOuterAlt(_localctx, 5);
        state = 145;
        license();
        break;
      case TOKEN_REPO:
        enterOuterAlt(_localctx, 6);
        state = 146;
        repo();
        break;
      case TOKEN_WEBSITE:
        enterOuterAlt(_localctx, 7);
        state = 147;
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

  AuthorContext author() {
    dynamic _localctx = AuthorContext(context, state);
    enterRule(_localctx, 4, RULE_author);
    try {
      enterOuterAlt(_localctx, 1);
      state = 150;
      match(TOKEN_AUTHOR);
      state = 151;
      match(TOKEN_STRING);
      state = 152;
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
    enterRule(_localctx, 6, RULE_description);
    try {
      enterOuterAlt(_localctx, 1);
      state = 154;
      match(TOKEN_DESCRIPTION);
      state = 155;
      match(TOKEN_STRING);
      state = 156;
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
    enterRule(_localctx, 8, RULE_version);
    try {
      enterOuterAlt(_localctx, 1);
      state = 158;
      match(TOKEN_VERSION);
      state = 159;
      match(TOKEN_SEMVER);
      state = 160;
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
    enterRule(_localctx, 10, RULE_license);
    try {
      enterOuterAlt(_localctx, 1);
      state = 162;
      match(TOKEN_LICENSE);
      state = 163;
      match(TOKEN_STRING);
      state = 164;
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
    enterRule(_localctx, 12, RULE_repo);
    try {
      enterOuterAlt(_localctx, 1);
      state = 166;
      match(TOKEN_REPO);
      state = 167;
      match(TOKEN_STRING);
      state = 168;
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
    enterRule(_localctx, 14, RULE_website);
    try {
      enterOuterAlt(_localctx, 1);
      state = 170;
      match(TOKEN_WEBSITE);
      state = 171;
      match(TOKEN_STRING);
      state = 172;
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
    enterRule(_localctx, 16, RULE_name);
    try {
      enterOuterAlt(_localctx, 1);
      state = 174;
      match(TOKEN_NAME);
      state = 175;
      match(TOKEN_STRING);
      state = 176;
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
    enterRule(_localctx, 18, RULE_permissions);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 178;
      match(TOKEN_PERMISSIONS);
      state = 179;
      permission();
      state = 184;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_COMMA) {
        state = 180;
        match(TOKEN_COMMA);
        state = 181;
        permission();
        state = 186;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 187;
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
    enterRule(_localctx, 20, RULE_permission);
    try {
      enterOuterAlt(_localctx, 1);
      state = 189;
      _localctx.namespace = identifier();
      state = 190;
      match(TOKEN_DOUBLE_COLON);
      state = 191;
      _localctx.perm = identifier();
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
    enterRule(_localctx, 22, RULE_contract);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 193;
      match(TOKEN_CONTRACT);
      state = 194;
      identifier();
      state = 195;
      match(TOKEN_OPEN_BRACE);
      state = 201;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 63050394783186944) != 0)) {
        state = 199;
        errorHandler.sync(this);
        switch (tokenStream.LA(1)!) {
        case TOKEN_HOOK:
          state = 196;
          hook();
          break;
        case TOKEN_IMPL:
          state = 197;
          impl();
          break;
        case TOKEN_FUNC:
          state = 198;
          func();
          break;
        default:
          throw NoViableAltException(this);
        }
        state = 203;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 204;
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
    enterRule(_localctx, 24, RULE_hook);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 206;
      match(TOKEN_HOOK);
      state = 207;
      identifier();
      state = 208;
      match(TOKEN_OPEN_PAREN);
      state = 210;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (((((_la - 44)) & ~0x3f) == 0 && ((1 << (_la - 44)) & 137438969855) != 0)) {
        state = 209;
        params();
      }

      state = 212;
      match(TOKEN_CLOSE_PAREN);
      state = 213;
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
    enterRule(_localctx, 26, RULE_impl);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 215;
      match(TOKEN_IMPL);
      state = 216;
      identifier();
      state = 217;
      match(TOKEN_OPEN_PAREN);
      state = 219;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (((((_la - 44)) & ~0x3f) == 0 && ((1 << (_la - 44)) & 137438969855) != 0)) {
        state = 218;
        params();
      }

      state = 221;
      match(TOKEN_CLOSE_PAREN);
      state = 222;
      match(TOKEN_ARROW);
      state = 223;
      dataType();
      state = 224;
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
    enterRule(_localctx, 28, RULE_func);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 226;
      match(TOKEN_FUNC);
      state = 227;
      identifier();
      state = 228;
      match(TOKEN_OPEN_PAREN);
      state = 230;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (((((_la - 44)) & ~0x3f) == 0 && ((1 << (_la - 44)) & 137438969855) != 0)) {
        state = 229;
        params();
      }

      state = 232;
      match(TOKEN_CLOSE_PAREN);
      state = 233;
      match(TOKEN_ARROW);
      state = 234;
      dataType();
      state = 235;
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
    enterRule(_localctx, 30, RULE_params);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 237;
      param();
      state = 242;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_COMMA) {
        state = 238;
        match(TOKEN_COMMA);
        state = 239;
        param();
        state = 244;
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
    enterRule(_localctx, 32, RULE_param);
    try {
      enterOuterAlt(_localctx, 1);
      state = 245;
      dataType();
      state = 246;
      identifier();
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
    enterRule(_localctx, 34, RULE_dataType);
    int _la;
    try {
      state = 268;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 13, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 248;
        identifier();
        state = 250;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_Q) {
          state = 249;
          match(TOKEN_Q);
        }

        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 252;
        match(TOKEN_LIST);
        state = 253;
        match(TOKEN_LT);
        state = 254;
        dataType();
        state = 255;
        match(TOKEN_GT);
        state = 257;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_Q) {
          state = 256;
          match(TOKEN_Q);
        }

        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 259;
        match(TOKEN_MAP);
        state = 260;
        match(TOKEN_LT);
        state = 261;
        dataType();
        state = 262;
        match(TOKEN_COMMA);
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
    enterRule(_localctx, 36, RULE_stmt);
    try {
      state = 276;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_FINAL:
      case TOKEN_CONST:
      case TOKEN_VAR:
        enterOuterAlt(_localctx, 1);
        state = 270;
        varDecl();
        break;
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
        state = 271;
        assignment();
        break;
      case TOKEN_RETURN:
        enterOuterAlt(_localctx, 3);
        state = 272;
        returnStmt();
        break;
      case TOKEN_BREAK:
        enterOuterAlt(_localctx, 4);
        state = 273;
        breakStmt();
        break;
      case TOKEN_CONTINUE:
        enterOuterAlt(_localctx, 5);
        state = 274;
        continueStmt();
        break;
      case TOKEN_SWITCH:
        enterOuterAlt(_localctx, 6);
        state = 275;
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
    enterRule(_localctx, 38, RULE_throwStmt);
    try {
      enterOuterAlt(_localctx, 1);
      state = 278;
      match(TOKEN_THROW);
      state = 279;
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
    enterRule(_localctx, 40, RULE_ifStmt);
    try {
      enterOuterAlt(_localctx, 1);
      state = 281;
      match(TOKEN_IF);
      state = 282;
      match(TOKEN_OPEN_PAREN);
      state = 283;
      expr();
      state = 284;
      match(TOKEN_CLOSE_PAREN);
      state = 285;
      block();
      state = 287;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 15, context)) {
      case 1:
        state = 286;
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
    enterRule(_localctx, 42, RULE_elseStmt);
    try {
      enterOuterAlt(_localctx, 1);
      state = 289;
      match(TOKEN_ELSE);
      state = 292;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 16, context)) {
      case 1:
        state = 290;
        ifStmt();
        break;
      case 2:
        state = 291;
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
    enterRule(_localctx, 44, RULE_whileStmt);
    try {
      enterOuterAlt(_localctx, 1);
      state = 294;
      match(TOKEN_WHILE);
      state = 295;
      match(TOKEN_OPEN_PAREN);
      state = 296;
      expr();
      state = 297;
      match(TOKEN_CLOSE_PAREN);
      state = 298;
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
    enterRule(_localctx, 46, RULE_forStmt);
    try {
      enterOuterAlt(_localctx, 1);
      state = 300;
      match(TOKEN_FOR);
      state = 301;
      match(TOKEN_OPEN_PAREN);
      state = 315;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 18, context)) {
      case 1:
        state = 304;
        errorHandler.sync(this);
        switch (tokenStream.LA(1)!) {
        case TOKEN_FINAL:
        case TOKEN_CONST:
        case TOKEN_VAR:
          state = 302;
          varDecl();
          break;
        case TOKEN_IDENT:
          state = 303;
          match(TOKEN_IDENT);
          break;
        default:
          throw NoViableAltException(this);
        }
        state = 306;
        match(TOKEN_SEMI);
        state = 307;
        expr();
        state = 308;
        match(TOKEN_SEMI);
        state = 309;
        assignment();
        break;
      case 2:
        state = 311;
        varDecl();
        state = 312;
        match(TOKEN_IN);
        state = 313;
        expr();
        break;
      }
      state = 317;
      match(TOKEN_CLOSE_PAREN);
      state = 318;
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
    enterRule(_localctx, 48, RULE_returnStmt);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 320;
      match(TOKEN_RETURN);
      state = 322;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 288217182582605126) != 0) || ((((_la - 77)) & ~0x3f) == 0 && ((1 << (_la - 77)) & 63) != 0)) {
        state = 321;
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
    enterRule(_localctx, 50, RULE_breakStmt);
    try {
      enterOuterAlt(_localctx, 1);
      state = 324;
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
    enterRule(_localctx, 52, RULE_continueStmt);
    try {
      enterOuterAlt(_localctx, 1);
      state = 326;
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
    enterRule(_localctx, 54, RULE_switchStmt);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 328;
      match(TOKEN_SWITCH);
      state = 329;
      match(TOKEN_OPEN_PAREN);
      state = 330;
      expr();
      state = 331;
      match(TOKEN_CLOSE_PAREN);
      state = 332;
      match(TOKEN_OPEN_BRACE);
      state = 336;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_CASE) {
        state = 333;
        caseStmt();
        state = 338;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 340;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_DEFAULT) {
        state = 339;
        defaultStmt();
      }

      state = 342;
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
    enterRule(_localctx, 56, RULE_caseStmt);
    try {
      enterOuterAlt(_localctx, 1);
      state = 344;
      match(TOKEN_CASE);
      state = 345;
      expr();
      state = 346;
      match(TOKEN_COLON);
      state = 347;
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
    enterRule(_localctx, 58, RULE_defaultStmt);
    try {
      enterOuterAlt(_localctx, 1);
      state = 349;
      match(TOKEN_DEFAULT);
      state = 350;
      match(TOKEN_COLON);
      state = 351;
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
    enterRule(_localctx, 60, RULE_tryStmt);
    try {
      enterOuterAlt(_localctx, 1);
      state = 353;
      match(TOKEN_TRY);
      state = 354;
      block();
      state = 355;
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
    enterRule(_localctx, 62, RULE_catchBlock);
    try {
      enterOuterAlt(_localctx, 1);
      state = 357;
      match(TOKEN_CATCH);
      state = 358;
      match(TOKEN_OPEN_PAREN);
      state = 359;
      identifier();
      state = 360;
      match(TOKEN_CLOSE_PAREN);
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

  LineContext line() {
    dynamic _localctx = LineContext(context, state);
    enterRule(_localctx, 64, RULE_line);
    try {
      state = 370;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 23, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 365;
        errorHandler.sync(this);
        switch (interpreter!.adaptivePredict(tokenStream, 22, context)) {
        case 1:
          state = 363;
          stmt();
          break;
        case 2:
          state = 364;
          expr();
          break;
        }
        state = 367;
        match(TOKEN_SEMI);
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 369;
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
    enterRule(_localctx, 66, RULE_varType);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 372;
      _la = tokenStream.LA(1)!;
      if (!(((((_la - 73)) & ~0x3f) == 0 && ((1 << (_la - 73)) & 7) != 0))) {
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
    enterRule(_localctx, 68, RULE_assignment);
    try {
      state = 379;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 24, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 374;
        simpleAssignment();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 375;
        compoundAssignment();
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 376;
        propertyAssignment();
        break;
      case 4:
        enterOuterAlt(_localctx, 4);
        state = 377;
        indexAssignment();
        break;
      case 5:
        enterOuterAlt(_localctx, 5);
        state = 378;
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
    enterRule(_localctx, 70, RULE_simpleAssignment);
    try {
      enterOuterAlt(_localctx, 1);
      state = 381;
      identifier();
      state = 382;
      match(TOKEN_ASSIGN);
      state = 383;
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
    enterRule(_localctx, 72, RULE_compoundAssignment);
    try {
      state = 405;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 25, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 385;
        identifier();
        state = 386;
        _localctx.op = match(TOKEN_PLUS_ASSIGN);
        state = 387;
        expr();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 389;
        identifier();
        state = 390;
        _localctx.op = match(TOKEN_MINUS_ASSIGN);
        state = 391;
        expr();
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 393;
        identifier();
        state = 394;
        _localctx.op = match(TOKEN_MULTIPLY_ASSIGN);
        state = 395;
        expr();
        break;
      case 4:
        enterOuterAlt(_localctx, 4);
        state = 397;
        identifier();
        state = 398;
        _localctx.op = match(TOKEN_DIVIDE_ASSIGN);
        state = 399;
        expr();
        break;
      case 5:
        enterOuterAlt(_localctx, 5);
        state = 401;
        identifier();
        state = 402;
        _localctx.op = match(TOKEN_MOD_ASSIGN);
        state = 403;
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
    enterRule(_localctx, 74, RULE_propertyAssignment);
    try {
      enterOuterAlt(_localctx, 1);
      state = 407;
      identifier();
      state = 408;
      match(TOKEN_DOT);
      state = 409;
      identifier();
      state = 410;
      match(TOKEN_ASSIGN);
      state = 411;
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
    enterRule(_localctx, 76, RULE_indexAssignment);
    try {
      enterOuterAlt(_localctx, 1);
      state = 413;
      identifier();
      state = 414;
      match(TOKEN_OPEN_BRACKET);
      state = 415;
      expr();
      state = 416;
      match(TOKEN_CLOSE_BRACKET);
      state = 417;
      match(TOKEN_ASSIGN);
      state = 418;
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
    enterRule(_localctx, 78, RULE_indexPropertyAssignment);
    try {
      enterOuterAlt(_localctx, 1);
      state = 420;
      identifier();
      state = 421;
      match(TOKEN_OPEN_BRACKET);
      state = 422;
      expr();
      state = 423;
      match(TOKEN_CLOSE_BRACKET);
      state = 424;
      match(TOKEN_DOT);
      state = 425;
      identifier();
      state = 426;
      match(TOKEN_ASSIGN);
      state = 427;
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
    enterRule(_localctx, 80, RULE_varDecl);
    try {
      state = 439;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 27, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 429;
        varType();
        state = 430;
        dataType();
        state = 431;
        identifier();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 433;
        varType();
        state = 435;
        errorHandler.sync(this);
        switch (interpreter!.adaptivePredict(tokenStream, 26, context)) {
        case 1:
          state = 434;
          dataType();
          break;
        }
        state = 437;
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
    enterRule(_localctx, 82, RULE_expr);
    try {
      enterOuterAlt(_localctx, 1);
      state = 441;
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
    enterRule(_localctx, 84, RULE_logicalExpr);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 443;
      _localctx.left = relationalExpr();
      state = 448;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_AND || _la == TOKEN_OR) {
        state = 444;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!(_la == TOKEN_AND || _la == TOKEN_OR)) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 445;
        _localctx.right = relationalExpr();
        state = 450;
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
    enterRule(_localctx, 86, RULE_relationalExpr);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 451;
      _localctx.left = bitwiseExpr();
      state = 456;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 487424) != 0)) {
        state = 452;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!((((_la) & ~0x3f) == 0 && ((1 << _la) & 487424) != 0))) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 453;
        _localctx.right = bitwiseExpr();
        state = 458;
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
    enterRule(_localctx, 88, RULE_bitwiseExpr);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 459;
      _localctx.left = shiftExpr();
      state = 464;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 469762048) != 0)) {
        state = 460;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!((((_la) & ~0x3f) == 0 && ((1 << _la) & 469762048) != 0))) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 461;
        _localctx.right = shiftExpr();
        state = 466;
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
    enterRule(_localctx, 90, RULE_shiftExpr);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 467;
      _localctx.left = additiveExpr();
      state = 472;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_BIT_LEFT_SHIFT || _la == TOKEN_BIT_RIGHT_SHIFT) {
        state = 468;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!(_la == TOKEN_BIT_LEFT_SHIFT || _la == TOKEN_BIT_RIGHT_SHIFT)) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 469;
        _localctx.right = additiveExpr();
        state = 474;
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
    enterRule(_localctx, 92, RULE_additiveExpr);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 475;
      _localctx.left = multiplicativeExpr();
      state = 480;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_PLUS || _la == TOKEN_MINUS) {
        state = 476;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!(_la == TOKEN_PLUS || _la == TOKEN_MINUS)) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 477;
        _localctx.right = multiplicativeExpr();
        state = 482;
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
    enterRule(_localctx, 94, RULE_multiplicativeExpr);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 483;
      _localctx.left = unaryExpr();
      state = 488;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 56) != 0)) {
        state = 484;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!((((_la) & ~0x3f) == 0 && ((1 << _la) & 56) != 0))) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 485;
        _localctx.right = unaryExpr();
        state = 490;
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
    enterRule(_localctx, 96, RULE_unaryExpr);
    int _la;
    try {
      state = 538;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 34, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 491;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!((((_la) & ~0x3f) == 0 && ((1 << _la) & 570425350) != 0))) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 492;
        unaryExpr();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 493;
        primaryExpr();
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 494;
        identifier();
        state = 495;
        match(TOKEN_PLUS_PLUS);
        break;
      case 4:
        enterOuterAlt(_localctx, 4);
        state = 497;
        identifier();
        state = 498;
        match(TOKEN_MINUS_MINUS);
        break;
      case 5:
        enterOuterAlt(_localctx, 5);
        state = 500;
        identifier();
        state = 501;
        match(TOKEN_DOT);
        state = 502;
        identifier();
        state = 503;
        match(TOKEN_PLUS_PLUS);
        break;
      case 6:
        enterOuterAlt(_localctx, 6);
        state = 505;
        identifier();
        state = 506;
        match(TOKEN_DOT);
        state = 507;
        identifier();
        state = 508;
        match(TOKEN_MINUS_MINUS);
        break;
      case 7:
        enterOuterAlt(_localctx, 7);
        state = 510;
        identifier();
        state = 511;
        match(TOKEN_OPEN_BRACKET);
        state = 512;
        expr();
        state = 513;
        match(TOKEN_CLOSE_BRACKET);
        state = 514;
        match(TOKEN_PLUS_PLUS);
        break;
      case 8:
        enterOuterAlt(_localctx, 8);
        state = 516;
        identifier();
        state = 517;
        match(TOKEN_OPEN_BRACKET);
        state = 518;
        expr();
        state = 519;
        match(TOKEN_CLOSE_BRACKET);
        state = 520;
        match(TOKEN_MINUS_MINUS);
        break;
      case 9:
        enterOuterAlt(_localctx, 9);
        state = 522;
        identifier();
        state = 523;
        match(TOKEN_OPEN_BRACKET);
        state = 524;
        expr();
        state = 525;
        match(TOKEN_CLOSE_BRACKET);
        state = 526;
        match(TOKEN_DOT);
        state = 527;
        identifier();
        state = 528;
        match(TOKEN_PLUS_PLUS);
        break;
      case 10:
        enterOuterAlt(_localctx, 10);
        state = 530;
        identifier();
        state = 531;
        match(TOKEN_OPEN_BRACKET);
        state = 532;
        expr();
        state = 533;
        match(TOKEN_CLOSE_BRACKET);
        state = 534;
        match(TOKEN_DOT);
        state = 535;
        identifier();
        state = 536;
        match(TOKEN_MINUS_MINUS);
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

  PrimaryExprContext primaryExpr() {
    dynamic _localctx = PrimaryExprContext(context, state);
    enterRule(_localctx, 98, RULE_primaryExpr);
    try {
      state = 564;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 35, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 540;
        match(TOKEN_OPEN_PAREN);
        state = 541;
        expr();
        state = 542;
        match(TOKEN_CLOSE_PAREN);
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 544;
        functionCall();
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 545;
        externalFunctionCall();
        break;
      case 4:
        enterOuterAlt(_localctx, 4);
        state = 546;
        literal();
        break;
      case 5:
        enterOuterAlt(_localctx, 5);
        state = 547;
        identifier();
        break;
      case 6:
        enterOuterAlt(_localctx, 6);
        state = 548;
        identifier();
        state = 549;
        match(TOKEN_OPEN_BRACKET);
        state = 550;
        expr();
        state = 551;
        match(TOKEN_CLOSE_BRACKET);
        break;
      case 7:
        enterOuterAlt(_localctx, 7);
        state = 553;
        identifier();
        state = 554;
        match(TOKEN_OPEN_BRACKET);
        state = 555;
        expr();
        state = 556;
        match(TOKEN_CLOSE_BRACKET);
        state = 557;
        match(TOKEN_DOT);
        state = 558;
        identifier();
        break;
      case 8:
        enterOuterAlt(_localctx, 8);
        state = 560;
        identifier();
        state = 561;
        match(TOKEN_DOT);
        state = 562;
        identifier();
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
    enterRule(_localctx, 100, RULE_externalFunctionCall);
    try {
      enterOuterAlt(_localctx, 1);
      state = 566;
      _localctx.namespace = identifier();
      state = 567;
      match(TOKEN_DOUBLE_COLON);
      state = 568;
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
    enterRule(_localctx, 102, RULE_functionCall);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 570;
      _localctx.method = identifier();
      state = 571;
      match(TOKEN_OPEN_PAREN);
      state = 573;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 288217182582605126) != 0) || ((((_la - 77)) & ~0x3f) == 0 && ((1 << (_la - 77)) & 63) != 0)) {
        state = 572;
        args();
      }

      state = 575;
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
    enterRule(_localctx, 104, RULE_args);
    int _la;
    try {
      int _alt;
      state = 610;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 41, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 577;
        positionalArg();
        state = 582;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 578;
          match(TOKEN_COMMA);
          state = 579;
          positionalArg();
          state = 584;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 585;
        namedArg();
        state = 590;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 586;
          match(TOKEN_COMMA);
          state = 587;
          namedArg();
          state = 592;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 593;
        positionalArg();
        state = 598;
        errorHandler.sync(this);
        _alt = interpreter!.adaptivePredict(tokenStream, 39, context);
        while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
          if (_alt == 1) {
            state = 594;
            match(TOKEN_COMMA);
            state = 595;
            positionalArg(); 
          }
          state = 600;
          errorHandler.sync(this);
          _alt = interpreter!.adaptivePredict(tokenStream, 39, context);
        }
        state = 601;
        match(TOKEN_COMMA);
        state = 602;
        namedArg();
        state = 607;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 603;
          match(TOKEN_COMMA);
          state = 604;
          namedArg();
          state = 609;
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
    enterRule(_localctx, 106, RULE_namedArg);
    try {
      enterOuterAlt(_localctx, 1);
      state = 612;
      identifier();
      state = 613;
      match(TOKEN_COLON);
      state = 614;
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
    enterRule(_localctx, 108, RULE_positionalArg);
    try {
      enterOuterAlt(_localctx, 1);
      state = 616;
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
    enterRule(_localctx, 110, RULE_literal);
    try {
      state = 626;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_INT:
        enterOuterAlt(_localctx, 1);
        state = 618;
        match(TOKEN_INT);
        break;
      case TOKEN_DOUBLE:
        enterOuterAlt(_localctx, 2);
        state = 619;
        match(TOKEN_DOUBLE);
        break;
      case TOKEN_BOOL:
        enterOuterAlt(_localctx, 3);
        state = 620;
        match(TOKEN_BOOL);
        break;
      case TOKEN_STRING:
        enterOuterAlt(_localctx, 4);
        state = 621;
        match(TOKEN_STRING);
        break;
      case TOKEN_NULL:
        enterOuterAlt(_localctx, 5);
        state = 622;
        match(TOKEN_NULL);
        break;
      case TOKEN_OPEN_BRACKET:
        enterOuterAlt(_localctx, 6);
        state = 623;
        arrayLiteral();
        break;
      case TOKEN_OPEN_BRACE:
        enterOuterAlt(_localctx, 7);
        state = 624;
        mapLiteral();
        break;
      case TOKEN_AT:
        enterOuterAlt(_localctx, 8);
        state = 625;
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

  IdentifierContext identifier() {
    dynamic _localctx = IdentifierContext(context, state);
    enterRule(_localctx, 112, RULE_identifier);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 628;
      _la = tokenStream.LA(1)!;
      if (!(((((_la - 44)) & ~0x3f) == 0 && ((1 << (_la - 44)) & 137438969855) != 0))) {
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

  ArrayLiteralContext arrayLiteral() {
    dynamic _localctx = ArrayLiteralContext(context, state);
    enterRule(_localctx, 114, RULE_arrayLiteral);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 630;
      match(TOKEN_OPEN_BRACKET);
      state = 639;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 288217182582605126) != 0) || ((((_la - 77)) & ~0x3f) == 0 && ((1 << (_la - 77)) & 63) != 0)) {
        state = 631;
        expr();
        state = 636;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 632;
          match(TOKEN_COMMA);
          state = 633;
          expr();
          state = 638;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
      }

      state = 641;
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
    enterRule(_localctx, 116, RULE_objectLiteral);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 643;
      match(TOKEN_AT);
      state = 644;
      identifier();
      state = 645;
      match(TOKEN_OPEN_BRACE);
      state = 654;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (((((_la - 44)) & ~0x3f) == 0 && ((1 << (_la - 44)) & 137438969855) != 0)) {
        state = 646;
        objectProperty();
        state = 651;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 647;
          match(TOKEN_COMMA);
          state = 648;
          objectProperty();
          state = 653;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
      }

      state = 656;
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
    enterRule(_localctx, 118, RULE_objectProperty);
    try {
      enterOuterAlt(_localctx, 1);
      state = 658;
      identifier();
      state = 659;
      match(TOKEN_COLON);
      state = 660;
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
    enterRule(_localctx, 120, RULE_mapLiteral);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 662;
      match(TOKEN_OPEN_BRACE);
      state = 671;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 288217182582605126) != 0) || ((((_la - 77)) & ~0x3f) == 0 && ((1 << (_la - 77)) & 63) != 0)) {
        state = 663;
        mapEntry();
        state = 668;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 664;
          match(TOKEN_COMMA);
          state = 665;
          mapEntry();
          state = 670;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
      }

      state = 673;
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
    enterRule(_localctx, 122, RULE_mapEntry);
    try {
      enterOuterAlt(_localctx, 1);
      state = 675;
      _localctx.key = expr();
      state = 676;
      match(TOKEN_COLON);
      state = 677;
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
    enterRule(_localctx, 124, RULE_block);
    int _la;
    try {
      state = 693;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_OPEN_BRACE:
        enterOuterAlt(_localctx, 1);
        state = 679;
        match(TOKEN_OPEN_BRACE);
        state = 683;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 4035212072554857798) != 0) || ((((_la - 64)) & ~0x3f) == 0 && ((1 << (_la - 64)) & 519887) != 0)) {
          state = 680;
          line();
          state = 685;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        state = 686;
        match(TOKEN_CLOSE_BRACE);
        break;
      case TOKEN_IF:
        enterOuterAlt(_localctx, 2);
        state = 687;
        ifStmt();
        break;
      case TOKEN_WHILE:
        enterOuterAlt(_localctx, 3);
        state = 688;
        whileStmt();
        break;
      case TOKEN_FOR:
        enterOuterAlt(_localctx, 4);
        state = 689;
        forStmt();
        break;
      case TOKEN_SWITCH:
        enterOuterAlt(_localctx, 5);
        state = 690;
        switchStmt();
        break;
      case TOKEN_TRY:
        enterOuterAlt(_localctx, 6);
        state = 691;
        tryStmt();
        break;
      case TOKEN_CATCH:
        enterOuterAlt(_localctx, 7);
        state = 692;
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

  static const List<int> _serializedATN = [
      4,1,85,696,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,
      2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,2,
      14,7,14,2,15,7,15,2,16,7,16,2,17,7,17,2,18,7,18,2,19,7,19,2,20,7,20,
      2,21,7,21,2,22,7,22,2,23,7,23,2,24,7,24,2,25,7,25,2,26,7,26,2,27,7,
      27,2,28,7,28,2,29,7,29,2,30,7,30,2,31,7,31,2,32,7,32,2,33,7,33,2,34,
      7,34,2,35,7,35,2,36,7,36,2,37,7,37,2,38,7,38,2,39,7,39,2,40,7,40,2,
      41,7,41,2,42,7,42,2,43,7,43,2,44,7,44,2,45,7,45,2,46,7,46,2,47,7,47,
      2,48,7,48,2,49,7,49,2,50,7,50,2,51,7,51,2,52,7,52,2,53,7,53,2,54,7,
      54,2,55,7,55,2,56,7,56,2,57,7,57,2,58,7,58,2,59,7,59,2,60,7,60,2,61,
      7,61,2,62,7,62,1,0,5,0,128,8,0,10,0,12,0,131,9,0,1,0,5,0,134,8,0,10,
      0,12,0,137,9,0,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,1,149,8,1,
      1,2,1,2,1,2,1,2,1,3,1,3,1,3,1,3,1,4,1,4,1,4,1,4,1,5,1,5,1,5,1,5,1,
      6,1,6,1,6,1,6,1,7,1,7,1,7,1,7,1,8,1,8,1,8,1,8,1,9,1,9,1,9,1,9,5,9,
      183,8,9,10,9,12,9,186,9,9,1,9,1,9,1,10,1,10,1,10,1,10,1,11,1,11,1,
      11,1,11,1,11,1,11,5,11,200,8,11,10,11,12,11,203,9,11,1,11,1,11,1,12,
      1,12,1,12,1,12,3,12,211,8,12,1,12,1,12,1,12,1,13,1,13,1,13,1,13,3,
      13,220,8,13,1,13,1,13,1,13,1,13,1,13,1,14,1,14,1,14,1,14,3,14,231,
      8,14,1,14,1,14,1,14,1,14,1,14,1,15,1,15,1,15,5,15,241,8,15,10,15,12,
      15,244,9,15,1,16,1,16,1,16,1,17,1,17,3,17,251,8,17,1,17,1,17,1,17,
      1,17,1,17,3,17,258,8,17,1,17,1,17,1,17,1,17,1,17,1,17,1,17,3,17,267,
      8,17,3,17,269,8,17,1,18,1,18,1,18,1,18,1,18,1,18,3,18,277,8,18,1,19,
      1,19,1,19,1,20,1,20,1,20,1,20,1,20,1,20,3,20,288,8,20,1,21,1,21,1,
      21,3,21,293,8,21,1,22,1,22,1,22,1,22,1,22,1,22,1,23,1,23,1,23,1,23,
      3,23,305,8,23,1,23,1,23,1,23,1,23,1,23,1,23,1,23,1,23,1,23,3,23,316,
      8,23,1,23,1,23,1,23,1,24,1,24,3,24,323,8,24,1,25,1,25,1,26,1,26,1,
      27,1,27,1,27,1,27,1,27,1,27,5,27,335,8,27,10,27,12,27,338,9,27,1,27,
      3,27,341,8,27,1,27,1,27,1,28,1,28,1,28,1,28,1,28,1,29,1,29,1,29,1,
      29,1,30,1,30,1,30,1,30,1,31,1,31,1,31,1,31,1,31,1,31,1,32,1,32,3,32,
      366,8,32,1,32,1,32,1,32,3,32,371,8,32,1,33,1,33,1,34,1,34,1,34,1,34,
      1,34,3,34,380,8,34,1,35,1,35,1,35,1,35,1,36,1,36,1,36,1,36,1,36,1,
      36,1,36,1,36,1,36,1,36,1,36,1,36,1,36,1,36,1,36,1,36,1,36,1,36,1,36,
      1,36,3,36,406,8,36,1,37,1,37,1,37,1,37,1,37,1,37,1,38,1,38,1,38,1,
      38,1,38,1,38,1,38,1,39,1,39,1,39,1,39,1,39,1,39,1,39,1,39,1,39,1,40,
      1,40,1,40,1,40,1,40,1,40,3,40,436,8,40,1,40,1,40,3,40,440,8,40,1,41,
      1,41,1,42,1,42,1,42,5,42,447,8,42,10,42,12,42,450,9,42,1,43,1,43,1,
      43,5,43,455,8,43,10,43,12,43,458,9,43,1,44,1,44,1,44,5,44,463,8,44,
      10,44,12,44,466,9,44,1,45,1,45,1,45,5,45,471,8,45,10,45,12,45,474,
      9,45,1,46,1,46,1,46,5,46,479,8,46,10,46,12,46,482,9,46,1,47,1,47,1,
      47,5,47,487,8,47,10,47,12,47,490,9,47,1,48,1,48,1,48,1,48,1,48,1,48,
      1,48,1,48,1,48,1,48,1,48,1,48,1,48,1,48,1,48,1,48,1,48,1,48,1,48,1,
      48,1,48,1,48,1,48,1,48,1,48,1,48,1,48,1,48,1,48,1,48,1,48,1,48,1,48,
      1,48,1,48,1,48,1,48,1,48,1,48,1,48,1,48,1,48,1,48,1,48,1,48,1,48,1,
      48,3,48,539,8,48,1,49,1,49,1,49,1,49,1,49,1,49,1,49,1,49,1,49,1,49,
      1,49,1,49,1,49,1,49,1,49,1,49,1,49,1,49,1,49,1,49,1,49,1,49,1,49,1,
      49,3,49,565,8,49,1,50,1,50,1,50,1,50,1,51,1,51,1,51,3,51,574,8,51,
      1,51,1,51,1,52,1,52,1,52,5,52,581,8,52,10,52,12,52,584,9,52,1,52,1,
      52,1,52,5,52,589,8,52,10,52,12,52,592,9,52,1,52,1,52,1,52,5,52,597,
      8,52,10,52,12,52,600,9,52,1,52,1,52,1,52,1,52,5,52,606,8,52,10,52,
      12,52,609,9,52,3,52,611,8,52,1,53,1,53,1,53,1,53,1,54,1,54,1,55,1,
      55,1,55,1,55,1,55,1,55,1,55,1,55,3,55,627,8,55,1,56,1,56,1,57,1,57,
      1,57,1,57,5,57,635,8,57,10,57,12,57,638,9,57,3,57,640,8,57,1,57,1,
      57,1,58,1,58,1,58,1,58,1,58,1,58,5,58,650,8,58,10,58,12,58,653,9,58,
      3,58,655,8,58,1,58,1,58,1,59,1,59,1,59,1,59,1,60,1,60,1,60,1,60,5,
      60,667,8,60,10,60,12,60,670,9,60,3,60,672,8,60,1,60,1,60,1,61,1,61,
      1,61,1,61,1,62,1,62,5,62,682,8,62,10,62,12,62,685,9,62,1,62,1,62,1,
      62,1,62,1,62,1,62,1,62,3,62,694,8,62,1,62,0,0,63,0,2,4,6,8,10,12,14,
      16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,
      60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100,102,
      104,106,108,110,112,114,116,118,120,122,124,0,9,1,0,73,75,1,0,23,24,
      2,0,12,14,16,18,1,0,26,28,1,0,30,31,1,0,1,2,1,0,3,5,3,0,1,2,25,25,
      29,29,2,0,44,57,81,81,726,0,129,1,0,0,0,2,148,1,0,0,0,4,150,1,0,0,
      0,6,154,1,0,0,0,8,158,1,0,0,0,10,162,1,0,0,0,12,166,1,0,0,0,14,170,
      1,0,0,0,16,174,1,0,0,0,18,178,1,0,0,0,20,189,1,0,0,0,22,193,1,0,0,
      0,24,206,1,0,0,0,26,215,1,0,0,0,28,226,1,0,0,0,30,237,1,0,0,0,32,245,
      1,0,0,0,34,268,1,0,0,0,36,276,1,0,0,0,38,278,1,0,0,0,40,281,1,0,0,
      0,42,289,1,0,0,0,44,294,1,0,0,0,46,300,1,0,0,0,48,320,1,0,0,0,50,324,
      1,0,0,0,52,326,1,0,0,0,54,328,1,0,0,0,56,344,1,0,0,0,58,349,1,0,0,
      0,60,353,1,0,0,0,62,357,1,0,0,0,64,370,1,0,0,0,66,372,1,0,0,0,68,379,
      1,0,0,0,70,381,1,0,0,0,72,405,1,0,0,0,74,407,1,0,0,0,76,413,1,0,0,
      0,78,420,1,0,0,0,80,439,1,0,0,0,82,441,1,0,0,0,84,443,1,0,0,0,86,451,
      1,0,0,0,88,459,1,0,0,0,90,467,1,0,0,0,92,475,1,0,0,0,94,483,1,0,0,
      0,96,538,1,0,0,0,98,564,1,0,0,0,100,566,1,0,0,0,102,570,1,0,0,0,104,
      610,1,0,0,0,106,612,1,0,0,0,108,616,1,0,0,0,110,626,1,0,0,0,112,628,
      1,0,0,0,114,630,1,0,0,0,116,643,1,0,0,0,118,658,1,0,0,0,120,662,1,
      0,0,0,122,675,1,0,0,0,124,693,1,0,0,0,126,128,3,2,1,0,127,126,1,0,
      0,0,128,131,1,0,0,0,129,127,1,0,0,0,129,130,1,0,0,0,130,135,1,0,0,
      0,131,129,1,0,0,0,132,134,3,18,9,0,133,132,1,0,0,0,134,137,1,0,0,0,
      135,133,1,0,0,0,135,136,1,0,0,0,136,138,1,0,0,0,137,135,1,0,0,0,138,
      139,3,22,11,0,139,140,5,0,0,1,140,1,1,0,0,0,141,149,3,16,8,0,142,149,
      3,6,3,0,143,149,3,4,2,0,144,149,3,8,4,0,145,149,3,10,5,0,146,149,3,
      12,6,0,147,149,3,14,7,0,148,141,1,0,0,0,148,142,1,0,0,0,148,143,1,
      0,0,0,148,144,1,0,0,0,148,145,1,0,0,0,148,146,1,0,0,0,148,147,1,0,
      0,0,149,3,1,0,0,0,150,151,5,44,0,0,151,152,5,82,0,0,152,153,5,22,0,
      0,153,5,1,0,0,0,154,155,5,45,0,0,155,156,5,82,0,0,156,157,5,22,0,0,
      157,7,1,0,0,0,158,159,5,46,0,0,159,160,5,76,0,0,160,161,5,22,0,0,161,
      9,1,0,0,0,162,163,5,47,0,0,163,164,5,82,0,0,164,165,5,22,0,0,165,11,
      1,0,0,0,166,167,5,48,0,0,167,168,5,82,0,0,168,169,5,22,0,0,169,13,
      1,0,0,0,170,171,5,49,0,0,171,172,5,82,0,0,172,173,5,22,0,0,173,15,
      1,0,0,0,174,175,5,50,0,0,175,176,5,82,0,0,176,177,5,22,0,0,177,17,
      1,0,0,0,178,179,5,51,0,0,179,184,3,20,10,0,180,181,5,21,0,0,181,183,
      3,20,10,0,182,180,1,0,0,0,183,186,1,0,0,0,184,182,1,0,0,0,184,185,
      1,0,0,0,185,187,1,0,0,0,186,184,1,0,0,0,187,188,5,22,0,0,188,19,1,
      0,0,0,189,190,3,112,56,0,190,191,5,20,0,0,191,192,3,112,56,0,192,21,
      1,0,0,0,193,194,5,52,0,0,194,195,3,112,56,0,195,201,5,8,0,0,196,200,
      3,24,12,0,197,200,3,26,13,0,198,200,3,28,14,0,199,196,1,0,0,0,199,
      197,1,0,0,0,199,198,1,0,0,0,200,203,1,0,0,0,201,199,1,0,0,0,201,202,
      1,0,0,0,202,204,1,0,0,0,203,201,1,0,0,0,204,205,5,9,0,0,205,23,1,0,
      0,0,206,207,5,54,0,0,207,208,3,112,56,0,208,210,5,6,0,0,209,211,3,
      30,15,0,210,209,1,0,0,0,210,211,1,0,0,0,211,212,1,0,0,0,212,213,5,
      7,0,0,213,214,3,124,62,0,214,25,1,0,0,0,215,216,5,53,0,0,216,217,3,
      112,56,0,217,219,5,6,0,0,218,220,3,30,15,0,219,218,1,0,0,0,219,220,
      1,0,0,0,220,221,1,0,0,0,221,222,5,7,0,0,222,223,5,32,0,0,223,224,3,
      34,17,0,224,225,3,124,62,0,225,27,1,0,0,0,226,227,5,55,0,0,227,228,
      3,112,56,0,228,230,5,6,0,0,229,231,3,30,15,0,230,229,1,0,0,0,230,231,
      1,0,0,0,231,232,1,0,0,0,232,233,5,7,0,0,233,234,5,32,0,0,234,235,3,
      34,17,0,235,236,3,124,62,0,236,29,1,0,0,0,237,242,3,32,16,0,238,239,
      5,21,0,0,239,241,3,32,16,0,240,238,1,0,0,0,241,244,1,0,0,0,242,240,
      1,0,0,0,242,243,1,0,0,0,243,31,1,0,0,0,244,242,1,0,0,0,245,246,3,34,
      17,0,246,247,3,112,56,0,247,33,1,0,0,0,248,250,3,112,56,0,249,251,
      5,33,0,0,250,249,1,0,0,0,250,251,1,0,0,0,251,269,1,0,0,0,252,253,5,
      56,0,0,253,254,5,13,0,0,254,255,3,34,17,0,255,257,5,12,0,0,256,258,
      5,33,0,0,257,256,1,0,0,0,257,258,1,0,0,0,258,269,1,0,0,0,259,260,5,
      57,0,0,260,261,5,13,0,0,261,262,3,34,17,0,262,263,5,21,0,0,263,264,
      3,34,17,0,264,266,5,12,0,0,265,267,5,33,0,0,266,265,1,0,0,0,266,267,
      1,0,0,0,267,269,1,0,0,0,268,248,1,0,0,0,268,252,1,0,0,0,268,259,1,
      0,0,0,269,35,1,0,0,0,270,277,3,80,40,0,271,277,3,68,34,0,272,277,3,
      48,24,0,273,277,3,50,25,0,274,277,3,52,26,0,275,277,3,54,27,0,276,
      270,1,0,0,0,276,271,1,0,0,0,276,272,1,0,0,0,276,273,1,0,0,0,276,274,
      1,0,0,0,276,275,1,0,0,0,277,37,1,0,0,0,278,279,5,72,0,0,279,280,3,
      82,41,0,280,39,1,0,0,0,281,282,5,58,0,0,282,283,5,6,0,0,283,284,3,
      82,41,0,284,285,5,7,0,0,285,287,3,124,62,0,286,288,3,42,21,0,287,286,
      1,0,0,0,287,288,1,0,0,0,288,41,1,0,0,0,289,292,5,59,0,0,290,293,3,
      40,20,0,291,293,3,124,62,0,292,290,1,0,0,0,292,291,1,0,0,0,293,43,
      1,0,0,0,294,295,5,60,0,0,295,296,5,6,0,0,296,297,3,82,41,0,297,298,
      5,7,0,0,298,299,3,124,62,0,299,45,1,0,0,0,300,301,5,61,0,0,301,315,
      5,6,0,0,302,305,3,80,40,0,303,305,5,81,0,0,304,302,1,0,0,0,304,303,
      1,0,0,0,305,306,1,0,0,0,306,307,5,22,0,0,307,308,3,82,41,0,308,309,
      5,22,0,0,309,310,3,68,34,0,310,316,1,0,0,0,311,312,3,80,40,0,312,313,
      5,62,0,0,313,314,3,82,41,0,314,316,1,0,0,0,315,304,1,0,0,0,315,311,
      1,0,0,0,316,317,1,0,0,0,317,318,5,7,0,0,318,319,3,124,62,0,319,47,
      1,0,0,0,320,322,5,64,0,0,321,323,3,82,41,0,322,321,1,0,0,0,322,323,
      1,0,0,0,323,49,1,0,0,0,324,325,5,65,0,0,325,51,1,0,0,0,326,327,5,66,
      0,0,327,53,1,0,0,0,328,329,5,67,0,0,329,330,5,6,0,0,330,331,3,82,41,
      0,331,332,5,7,0,0,332,336,5,8,0,0,333,335,3,56,28,0,334,333,1,0,0,
      0,335,338,1,0,0,0,336,334,1,0,0,0,336,337,1,0,0,0,337,340,1,0,0,0,
      338,336,1,0,0,0,339,341,3,58,29,0,340,339,1,0,0,0,340,341,1,0,0,0,
      341,342,1,0,0,0,342,343,5,9,0,0,343,55,1,0,0,0,344,345,5,68,0,0,345,
      346,3,82,41,0,346,347,5,19,0,0,347,348,3,124,62,0,348,57,1,0,0,0,349,
      350,5,69,0,0,350,351,5,19,0,0,351,352,3,124,62,0,352,59,1,0,0,0,353,
      354,5,70,0,0,354,355,3,124,62,0,355,356,3,62,31,0,356,61,1,0,0,0,357,
      358,5,71,0,0,358,359,5,6,0,0,359,360,3,112,56,0,360,361,5,7,0,0,361,
      362,3,124,62,0,362,63,1,0,0,0,363,366,3,36,18,0,364,366,3,82,41,0,
      365,363,1,0,0,0,365,364,1,0,0,0,366,367,1,0,0,0,367,368,5,22,0,0,368,
      371,1,0,0,0,369,371,3,124,62,0,370,365,1,0,0,0,370,369,1,0,0,0,371,
      65,1,0,0,0,372,373,7,0,0,0,373,67,1,0,0,0,374,380,3,70,35,0,375,380,
      3,72,36,0,376,380,3,74,37,0,377,380,3,76,38,0,378,380,3,78,39,0,379,
      374,1,0,0,0,379,375,1,0,0,0,379,376,1,0,0,0,379,377,1,0,0,0,379,378,
      1,0,0,0,380,69,1,0,0,0,381,382,3,112,56,0,382,383,5,15,0,0,383,384,
      3,82,41,0,384,71,1,0,0,0,385,386,3,112,56,0,386,387,5,35,0,0,387,388,
      3,82,41,0,388,406,1,0,0,0,389,390,3,112,56,0,390,391,5,36,0,0,391,
      392,3,82,41,0,392,406,1,0,0,0,393,394,3,112,56,0,394,395,5,37,0,0,
      395,396,3,82,41,0,396,406,1,0,0,0,397,398,3,112,56,0,398,399,5,38,
      0,0,399,400,3,82,41,0,400,406,1,0,0,0,401,402,3,112,56,0,402,403,5,
      39,0,0,403,404,3,82,41,0,404,406,1,0,0,0,405,385,1,0,0,0,405,389,1,
      0,0,0,405,393,1,0,0,0,405,397,1,0,0,0,405,401,1,0,0,0,406,73,1,0,0,
      0,407,408,3,112,56,0,408,409,5,34,0,0,409,410,3,112,56,0,410,411,5,
      15,0,0,411,412,3,82,41,0,412,75,1,0,0,0,413,414,3,112,56,0,414,415,
      5,10,0,0,415,416,3,82,41,0,416,417,5,11,0,0,417,418,5,15,0,0,418,419,
      3,82,41,0,419,77,1,0,0,0,420,421,3,112,56,0,421,422,5,10,0,0,422,423,
      3,82,41,0,423,424,5,11,0,0,424,425,5,34,0,0,425,426,3,112,56,0,426,
      427,5,15,0,0,427,428,3,82,41,0,428,79,1,0,0,0,429,430,3,66,33,0,430,
      431,3,34,17,0,431,432,3,112,56,0,432,440,1,0,0,0,433,435,3,66,33,0,
      434,436,3,34,17,0,435,434,1,0,0,0,435,436,1,0,0,0,436,437,1,0,0,0,
      437,438,3,68,34,0,438,440,1,0,0,0,439,429,1,0,0,0,439,433,1,0,0,0,
      440,81,1,0,0,0,441,442,3,84,42,0,442,83,1,0,0,0,443,448,3,86,43,0,
      444,445,7,1,0,0,445,447,3,86,43,0,446,444,1,0,0,0,447,450,1,0,0,0,
      448,446,1,0,0,0,448,449,1,0,0,0,449,85,1,0,0,0,450,448,1,0,0,0,451,
      456,3,88,44,0,452,453,7,2,0,0,453,455,3,88,44,0,454,452,1,0,0,0,455,
      458,1,0,0,0,456,454,1,0,0,0,456,457,1,0,0,0,457,87,1,0,0,0,458,456,
      1,0,0,0,459,464,3,90,45,0,460,461,7,3,0,0,461,463,3,90,45,0,462,460,
      1,0,0,0,463,466,1,0,0,0,464,462,1,0,0,0,464,465,1,0,0,0,465,89,1,0,
      0,0,466,464,1,0,0,0,467,472,3,92,46,0,468,469,7,4,0,0,469,471,3,92,
      46,0,470,468,1,0,0,0,471,474,1,0,0,0,472,470,1,0,0,0,472,473,1,0,0,
      0,473,91,1,0,0,0,474,472,1,0,0,0,475,480,3,94,47,0,476,477,7,5,0,0,
      477,479,3,94,47,0,478,476,1,0,0,0,479,482,1,0,0,0,480,478,1,0,0,0,
      480,481,1,0,0,0,481,93,1,0,0,0,482,480,1,0,0,0,483,488,3,96,48,0,484,
      485,7,6,0,0,485,487,3,96,48,0,486,484,1,0,0,0,487,490,1,0,0,0,488,
      486,1,0,0,0,488,489,1,0,0,0,489,95,1,0,0,0,490,488,1,0,0,0,491,492,
      7,7,0,0,492,539,3,96,48,0,493,539,3,98,49,0,494,495,3,112,56,0,495,
      496,5,40,0,0,496,539,1,0,0,0,497,498,3,112,56,0,498,499,5,41,0,0,499,
      539,1,0,0,0,500,501,3,112,56,0,501,502,5,34,0,0,502,503,3,112,56,0,
      503,504,5,40,0,0,504,539,1,0,0,0,505,506,3,112,56,0,506,507,5,34,0,
      0,507,508,3,112,56,0,508,509,5,41,0,0,509,539,1,0,0,0,510,511,3,112,
      56,0,511,512,5,10,0,0,512,513,3,82,41,0,513,514,5,11,0,0,514,515,5,
      40,0,0,515,539,1,0,0,0,516,517,3,112,56,0,517,518,5,10,0,0,518,519,
      3,82,41,0,519,520,5,11,0,0,520,521,5,41,0,0,521,539,1,0,0,0,522,523,
      3,112,56,0,523,524,5,10,0,0,524,525,3,82,41,0,525,526,5,11,0,0,526,
      527,5,34,0,0,527,528,3,112,56,0,528,529,5,40,0,0,529,539,1,0,0,0,530,
      531,3,112,56,0,531,532,5,10,0,0,532,533,3,82,41,0,533,534,5,11,0,0,
      534,535,5,34,0,0,535,536,3,112,56,0,536,537,5,41,0,0,537,539,1,0,0,
      0,538,491,1,0,0,0,538,493,1,0,0,0,538,494,1,0,0,0,538,497,1,0,0,0,
      538,500,1,0,0,0,538,505,1,0,0,0,538,510,1,0,0,0,538,516,1,0,0,0,538,
      522,1,0,0,0,538,530,1,0,0,0,539,97,1,0,0,0,540,541,5,6,0,0,541,542,
      3,82,41,0,542,543,5,7,0,0,543,565,1,0,0,0,544,565,3,102,51,0,545,565,
      3,100,50,0,546,565,3,110,55,0,547,565,3,112,56,0,548,549,3,112,56,
      0,549,550,5,10,0,0,550,551,3,82,41,0,551,552,5,11,0,0,552,565,1,0,
      0,0,553,554,3,112,56,0,554,555,5,10,0,0,555,556,3,82,41,0,556,557,
      5,11,0,0,557,558,5,34,0,0,558,559,3,112,56,0,559,565,1,0,0,0,560,561,
      3,112,56,0,561,562,5,34,0,0,562,563,3,112,56,0,563,565,1,0,0,0,564,
      540,1,0,0,0,564,544,1,0,0,0,564,545,1,0,0,0,564,546,1,0,0,0,564,547,
      1,0,0,0,564,548,1,0,0,0,564,553,1,0,0,0,564,560,1,0,0,0,565,99,1,0,
      0,0,566,567,3,112,56,0,567,568,5,20,0,0,568,569,3,102,51,0,569,101,
      1,0,0,0,570,571,3,112,56,0,571,573,5,6,0,0,572,574,3,104,52,0,573,
      572,1,0,0,0,573,574,1,0,0,0,574,575,1,0,0,0,575,576,5,7,0,0,576,103,
      1,0,0,0,577,582,3,108,54,0,578,579,5,21,0,0,579,581,3,108,54,0,580,
      578,1,0,0,0,581,584,1,0,0,0,582,580,1,0,0,0,582,583,1,0,0,0,583,611,
      1,0,0,0,584,582,1,0,0,0,585,590,3,106,53,0,586,587,5,21,0,0,587,589,
      3,106,53,0,588,586,1,0,0,0,589,592,1,0,0,0,590,588,1,0,0,0,590,591,
      1,0,0,0,591,611,1,0,0,0,592,590,1,0,0,0,593,598,3,108,54,0,594,595,
      5,21,0,0,595,597,3,108,54,0,596,594,1,0,0,0,597,600,1,0,0,0,598,596,
      1,0,0,0,598,599,1,0,0,0,599,601,1,0,0,0,600,598,1,0,0,0,601,602,5,
      21,0,0,602,607,3,106,53,0,603,604,5,21,0,0,604,606,3,106,53,0,605,
      603,1,0,0,0,606,609,1,0,0,0,607,605,1,0,0,0,607,608,1,0,0,0,608,611,
      1,0,0,0,609,607,1,0,0,0,610,577,1,0,0,0,610,585,1,0,0,0,610,593,1,
      0,0,0,611,105,1,0,0,0,612,613,3,112,56,0,613,614,5,19,0,0,614,615,
      3,82,41,0,615,107,1,0,0,0,616,617,3,82,41,0,617,109,1,0,0,0,618,627,
      5,79,0,0,619,627,5,80,0,0,620,627,5,77,0,0,621,627,5,82,0,0,622,627,
      5,78,0,0,623,627,3,114,57,0,624,627,3,120,60,0,625,627,3,116,58,0,
      626,618,1,0,0,0,626,619,1,0,0,0,626,620,1,0,0,0,626,621,1,0,0,0,626,
      622,1,0,0,0,626,623,1,0,0,0,626,624,1,0,0,0,626,625,1,0,0,0,627,111,
      1,0,0,0,628,629,7,8,0,0,629,113,1,0,0,0,630,639,5,10,0,0,631,636,3,
      82,41,0,632,633,5,21,0,0,633,635,3,82,41,0,634,632,1,0,0,0,635,638,
      1,0,0,0,636,634,1,0,0,0,636,637,1,0,0,0,637,640,1,0,0,0,638,636,1,
      0,0,0,639,631,1,0,0,0,639,640,1,0,0,0,640,641,1,0,0,0,641,642,5,11,
      0,0,642,115,1,0,0,0,643,644,5,42,0,0,644,645,3,112,56,0,645,654,5,
      8,0,0,646,651,3,118,59,0,647,648,5,21,0,0,648,650,3,118,59,0,649,647,
      1,0,0,0,650,653,1,0,0,0,651,649,1,0,0,0,651,652,1,0,0,0,652,655,1,
      0,0,0,653,651,1,0,0,0,654,646,1,0,0,0,654,655,1,0,0,0,655,656,1,0,
      0,0,656,657,5,9,0,0,657,117,1,0,0,0,658,659,3,112,56,0,659,660,5,19,
      0,0,660,661,3,82,41,0,661,119,1,0,0,0,662,671,5,8,0,0,663,668,3,122,
      61,0,664,665,5,21,0,0,665,667,3,122,61,0,666,664,1,0,0,0,667,670,1,
      0,0,0,668,666,1,0,0,0,668,669,1,0,0,0,669,672,1,0,0,0,670,668,1,0,
      0,0,671,663,1,0,0,0,671,672,1,0,0,0,672,673,1,0,0,0,673,674,5,9,0,
      0,674,121,1,0,0,0,675,676,3,82,41,0,676,677,5,19,0,0,677,678,3,82,
      41,0,678,123,1,0,0,0,679,683,5,8,0,0,680,682,3,64,32,0,681,680,1,0,
      0,0,682,685,1,0,0,0,683,681,1,0,0,0,683,684,1,0,0,0,684,686,1,0,0,
      0,685,683,1,0,0,0,686,694,5,9,0,0,687,694,3,40,20,0,688,694,3,44,22,
      0,689,694,3,46,23,0,690,694,3,54,27,0,691,694,3,60,30,0,692,694,3,
      62,31,0,693,679,1,0,0,0,693,687,1,0,0,0,693,688,1,0,0,0,693,689,1,
      0,0,0,693,690,1,0,0,0,693,691,1,0,0,0,693,692,1,0,0,0,694,125,1,0,
      0,0,51,129,135,148,184,199,201,210,219,230,242,250,257,266,268,276,
      287,292,304,315,322,336,340,365,370,379,405,435,439,448,456,464,472,
      480,488,538,564,573,582,590,598,607,610,626,636,639,651,654,668,671,
      683,693
  ];

  static final ATN _ATN =
      ATNDeserializer().deserialize(_serializedATN);
}
class ScriptContext extends ParserRuleContext {
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
  PrimaryExprContext? primaryExpr() => getRuleContext<PrimaryExprContext>(0);
  List<IdentifierContext> identifiers() => getRuleContexts<IdentifierContext>();
  IdentifierContext? identifier(int i) => getRuleContext<IdentifierContext>(i);
  TerminalNode? PLUS_PLUS() => getToken(dscriptParser.TOKEN_PLUS_PLUS, 0);
  TerminalNode? MINUS_MINUS() => getToken(dscriptParser.TOKEN_MINUS_MINUS, 0);
  TerminalNode? DOT() => getToken(dscriptParser.TOKEN_DOT, 0);
  TerminalNode? OPEN_BRACKET() => getToken(dscriptParser.TOKEN_OPEN_BRACKET, 0);
  ExprContext? expr() => getRuleContext<ExprContext>(0);
  TerminalNode? CLOSE_BRACKET() => getToken(dscriptParser.TOKEN_CLOSE_BRACKET, 0);
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

class PrimaryExprContext extends ParserRuleContext {
  TerminalNode? OPEN_PAREN() => getToken(dscriptParser.TOKEN_OPEN_PAREN, 0);
  ExprContext? expr() => getRuleContext<ExprContext>(0);
  TerminalNode? CLOSE_PAREN() => getToken(dscriptParser.TOKEN_CLOSE_PAREN, 0);
  FunctionCallContext? functionCall() => getRuleContext<FunctionCallContext>(0);
  ExternalFunctionCallContext? externalFunctionCall() => getRuleContext<ExternalFunctionCallContext>(0);
  LiteralContext? literal() => getRuleContext<LiteralContext>(0);
  List<IdentifierContext> identifiers() => getRuleContexts<IdentifierContext>();
  IdentifierContext? identifier(int i) => getRuleContext<IdentifierContext>(i);
  TerminalNode? OPEN_BRACKET() => getToken(dscriptParser.TOKEN_OPEN_BRACKET, 0);
  TerminalNode? CLOSE_BRACKET() => getToken(dscriptParser.TOKEN_CLOSE_BRACKET, 0);
  TerminalNode? DOT() => getToken(dscriptParser.TOKEN_DOT, 0);
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

