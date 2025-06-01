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
          RULE_continueStmt = 27, RULE_tryStmt = 28, RULE_catchBlock = 29, 
          RULE_line = 30, RULE_varType = 31, RULE_assignment = 32, RULE_simpleAssignment = 33, 
          RULE_compoundAssignment = 34, RULE_propertyAssignment = 35, RULE_indexAssignment = 36, 
          RULE_indexPropertyAssignment = 37, RULE_varDecl = 38, RULE_expr = 39, 
          RULE_logicalExpr = 40, RULE_relationalExpr = 41, RULE_bitwiseExpr = 42, 
          RULE_shiftExpr = 43, RULE_additiveExpr = 44, RULE_multiplicativeExpr = 45, 
          RULE_unaryExpr = 46, RULE_suffixExpr = 47, RULE_primaryExpr = 48, 
          RULE_externalFunctionCall = 49, RULE_functionCall = 50, RULE_args = 51, 
          RULE_namedArg = 52, RULE_positionalArg = 53, RULE_literal = 54, 
          RULE_identifier = 55, RULE_arrayLiteral = 56, RULE_objectLiteral = 57, 
          RULE_objectProperty = 58, RULE_mapLiteral = 59, RULE_mapEntry = 60, 
          RULE_block = 61;
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
    'continueStmt', 'tryStmt', 'catchBlock', 'line', 'varType', 'assignment', 
    'simpleAssignment', 'compoundAssignment', 'propertyAssignment', 'indexAssignment', 
    'indexPropertyAssignment', 'varDecl', 'expr', 'logicalExpr', 'relationalExpr', 
    'bitwiseExpr', 'shiftExpr', 'additiveExpr', 'multiplicativeExpr', 'unaryExpr', 
    'suffixExpr', 'primaryExpr', 'externalFunctionCall', 'functionCall', 
    'args', 'namedArg', 'positionalArg', 'literal', 'identifier', 'arrayLiteral', 
    'objectLiteral', 'objectProperty', 'mapLiteral', 'mapEntry', 'block'
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
      state = 125;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_SCHEMA) {
        state = 124;
        schema();
      }

      state = 130;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 4468415255281664) != 0)) {
        state = 127;
        metadata();
        state = 132;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 136;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_PERMISSIONS) {
        state = 133;
        permissions();
        state = 138;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 139;
      contract();
      state = 140;
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
      state = 149;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_NAME:
        enterOuterAlt(_localctx, 1);
        state = 142;
        name();
        break;
      case TOKEN_DESCRIPTION:
        enterOuterAlt(_localctx, 2);
        state = 143;
        description();
        break;
      case TOKEN_AUTHOR:
        enterOuterAlt(_localctx, 3);
        state = 144;
        author();
        break;
      case TOKEN_VERSION:
        enterOuterAlt(_localctx, 4);
        state = 145;
        version();
        break;
      case TOKEN_LICENSE:
        enterOuterAlt(_localctx, 5);
        state = 146;
        license();
        break;
      case TOKEN_REPO:
        enterOuterAlt(_localctx, 6);
        state = 147;
        repo();
        break;
      case TOKEN_WEBSITE:
        enterOuterAlt(_localctx, 7);
        state = 148;
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
      state = 151;
      match(TOKEN_SCHEMA);
      state = 152;
      match(TOKEN_STRING);
      state = 153;
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
      state = 155;
      match(TOKEN_AUTHOR);
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

  DescriptionContext description() {
    dynamic _localctx = DescriptionContext(context, state);
    enterRule(_localctx, 8, RULE_description);
    try {
      enterOuterAlt(_localctx, 1);
      state = 159;
      match(TOKEN_DESCRIPTION);
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

  VersionContext version() {
    dynamic _localctx = VersionContext(context, state);
    enterRule(_localctx, 10, RULE_version);
    try {
      enterOuterAlt(_localctx, 1);
      state = 163;
      match(TOKEN_VERSION);
      state = 164;
      match(TOKEN_SEMVER);
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

  LicenseContext license() {
    dynamic _localctx = LicenseContext(context, state);
    enterRule(_localctx, 12, RULE_license);
    try {
      enterOuterAlt(_localctx, 1);
      state = 167;
      match(TOKEN_LICENSE);
      state = 168;
      match(TOKEN_STRING);
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

  RepoContext repo() {
    dynamic _localctx = RepoContext(context, state);
    enterRule(_localctx, 14, RULE_repo);
    try {
      enterOuterAlt(_localctx, 1);
      state = 171;
      match(TOKEN_REPO);
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

  WebsiteContext website() {
    dynamic _localctx = WebsiteContext(context, state);
    enterRule(_localctx, 16, RULE_website);
    try {
      enterOuterAlt(_localctx, 1);
      state = 175;
      match(TOKEN_WEBSITE);
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

  NameContext name() {
    dynamic _localctx = NameContext(context, state);
    enterRule(_localctx, 18, RULE_name);
    try {
      enterOuterAlt(_localctx, 1);
      state = 179;
      match(TOKEN_NAME);
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

  PermissionsContext permissions() {
    dynamic _localctx = PermissionsContext(context, state);
    enterRule(_localctx, 20, RULE_permissions);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 183;
      match(TOKEN_PERMISSIONS);
      state = 184;
      permission();
      state = 189;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_COMMA) {
        state = 185;
        match(TOKEN_COMMA);
        state = 186;
        permission();
        state = 191;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 192;
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
      state = 194;
      _localctx.namespace = identifier(0);
      state = 195;
      match(TOKEN_DOUBLE_COLON);
      state = 196;
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
      state = 198;
      match(TOKEN_CONTRACT);
      state = 199;
      identifier(0);
      state = 200;
      match(TOKEN_OPEN_BRACE);
      state = 206;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (((((_la - 74)) & ~0x3f) == 0 && ((1 << (_la - 74)) & 7) != 0)) {
        state = 201;
        varDecl();
        state = 202;
        match(TOKEN_SEMI);
        state = 208;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 214;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 126100789566373888) != 0)) {
        state = 212;
        errorHandler.sync(this);
        switch (tokenStream.LA(1)!) {
        case TOKEN_HOOK:
          state = 209;
          hook();
          break;
        case TOKEN_IMPL:
          state = 210;
          impl();
          break;
        case TOKEN_FUNC:
          state = 211;
          func();
          break;
        default:
          throw NoViableAltException(this);
        }
        state = 216;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 217;
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
      state = 219;
      match(TOKEN_HOOK);
      state = 220;
      identifier(0);
      state = 221;
      match(TOKEN_OPEN_PAREN);
      state = 223;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (((((_la - 44)) & ~0x3f) == 0 && ((1 << (_la - 44)) & 274877939711) != 0)) {
        state = 222;
        params();
      }

      state = 225;
      match(TOKEN_CLOSE_PAREN);
      state = 226;
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
      state = 228;
      match(TOKEN_IMPL);
      state = 229;
      identifier(0);
      state = 230;
      match(TOKEN_OPEN_PAREN);
      state = 232;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (((((_la - 44)) & ~0x3f) == 0 && ((1 << (_la - 44)) & 274877939711) != 0)) {
        state = 231;
        params();
      }

      state = 234;
      match(TOKEN_CLOSE_PAREN);
      state = 235;
      match(TOKEN_ARROW);
      state = 236;
      dataType();
      state = 237;
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
      state = 239;
      match(TOKEN_FUNC);
      state = 240;
      identifier(0);
      state = 241;
      match(TOKEN_OPEN_PAREN);
      state = 243;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (((((_la - 44)) & ~0x3f) == 0 && ((1 << (_la - 44)) & 274877939711) != 0)) {
        state = 242;
        params();
      }

      state = 245;
      match(TOKEN_CLOSE_PAREN);
      state = 246;
      match(TOKEN_ARROW);
      state = 247;
      dataType();
      state = 248;
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
      state = 250;
      param();
      state = 255;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_COMMA) {
        state = 251;
        match(TOKEN_COMMA);
        state = 252;
        param();
        state = 257;
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
      state = 258;
      dataType();
      state = 259;
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
      state = 281;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 15, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 261;
        identifier(0);
        state = 263;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_Q) {
          state = 262;
          match(TOKEN_Q);
        }

        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 265;
        match(TOKEN_LIST);
        state = 266;
        match(TOKEN_LT);
        state = 267;
        dataType();
        state = 268;
        match(TOKEN_GT);
        state = 270;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_Q) {
          state = 269;
          match(TOKEN_Q);
        }

        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 272;
        match(TOKEN_MAP);
        state = 273;
        match(TOKEN_LT);
        state = 274;
        dataType();
        state = 275;
        match(TOKEN_COMMA);
        state = 276;
        dataType();
        state = 277;
        match(TOKEN_GT);
        state = 279;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_Q) {
          state = 278;
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
      state = 293;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_FINAL:
      case TOKEN_CONST:
      case TOKEN_VAR:
        enterOuterAlt(_localctx, 1);
        state = 283;
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
        state = 284;
        assignment();
        break;
      case TOKEN_RETURN:
        enterOuterAlt(_localctx, 3);
        state = 285;
        returnStmt();
        break;
      case TOKEN_BREAK:
        enterOuterAlt(_localctx, 4);
        state = 286;
        breakStmt();
        break;
      case TOKEN_CONTINUE:
        enterOuterAlt(_localctx, 5);
        state = 287;
        continueStmt();
        break;
      case TOKEN_THROW:
        enterOuterAlt(_localctx, 6);
        state = 288;
        throwStmt();
        break;
      case TOKEN_IF:
        enterOuterAlt(_localctx, 7);
        state = 289;
        ifStmt();
        break;
      case TOKEN_WHILE:
        enterOuterAlt(_localctx, 8);
        state = 290;
        whileStmt();
        break;
      case TOKEN_FOR:
        enterOuterAlt(_localctx, 9);
        state = 291;
        forStmt();
        break;
      case TOKEN_TRY:
        enterOuterAlt(_localctx, 10);
        state = 292;
        tryStmt();
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
      state = 295;
      match(TOKEN_THROW);
      state = 296;
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
      state = 298;
      match(TOKEN_IF);
      state = 299;
      match(TOKEN_OPEN_PAREN);
      state = 300;
      expr();
      state = 301;
      match(TOKEN_CLOSE_PAREN);
      state = 302;
      block();
      state = 304;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 17, context)) {
      case 1:
        state = 303;
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
      state = 306;
      match(TOKEN_ELSE);
      state = 309;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 18, context)) {
      case 1:
        state = 307;
        ifStmt();
        break;
      case 2:
        state = 308;
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
      state = 311;
      match(TOKEN_WHILE);
      state = 312;
      match(TOKEN_OPEN_PAREN);
      state = 313;
      expr();
      state = 314;
      match(TOKEN_CLOSE_PAREN);
      state = 315;
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
      state = 317;
      match(TOKEN_FOR);
      state = 318;
      match(TOKEN_OPEN_PAREN);
      state = 332;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 20, context)) {
      case 1:
        state = 321;
        errorHandler.sync(this);
        switch (tokenStream.LA(1)!) {
        case TOKEN_FINAL:
        case TOKEN_CONST:
        case TOKEN_VAR:
          state = 319;
          varDecl();
          break;
        case TOKEN_IDENT:
          state = 320;
          match(TOKEN_IDENT);
          break;
        default:
          throw NoViableAltException(this);
        }
        state = 323;
        match(TOKEN_SEMI);
        state = 324;
        expr();
        state = 325;
        match(TOKEN_SEMI);
        state = 326;
        assignment();
        break;
      case 2:
        state = 328;
        varDecl();
        state = 329;
        match(TOKEN_IN);
        state = 330;
        expr();
        break;
      }
      state = 334;
      match(TOKEN_CLOSE_PAREN);
      state = 335;
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
      state = 337;
      match(TOKEN_RETURN);
      state = 339;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 576447558734316870) != 0) || ((((_la - 78)) & ~0x3f) == 0 && ((1 << (_la - 78)) & 63) != 0)) {
        state = 338;
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
      state = 341;
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
      state = 343;
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

  TryStmtContext tryStmt() {
    dynamic _localctx = TryStmtContext(context, state);
    enterRule(_localctx, 56, RULE_tryStmt);
    try {
      enterOuterAlt(_localctx, 1);
      state = 345;
      match(TOKEN_TRY);
      state = 346;
      block();
      state = 347;
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
    enterRule(_localctx, 58, RULE_catchBlock);
    try {
      enterOuterAlt(_localctx, 1);
      state = 349;
      match(TOKEN_CATCH);
      state = 350;
      match(TOKEN_OPEN_PAREN);
      state = 351;
      identifier(0);
      state = 352;
      match(TOKEN_CLOSE_PAREN);
      state = 353;
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
    enterRule(_localctx, 60, RULE_line);
    try {
      state = 362;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 23, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 357;
        errorHandler.sync(this);
        switch (interpreter!.adaptivePredict(tokenStream, 22, context)) {
        case 1:
          state = 355;
          stmt();
          break;
        case 2:
          state = 356;
          expr();
          break;
        }
        state = 359;
        match(TOKEN_SEMI);
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 361;
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
    enterRule(_localctx, 62, RULE_varType);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 364;
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
    enterRule(_localctx, 64, RULE_assignment);
    try {
      state = 371;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 24, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 366;
        simpleAssignment();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 367;
        compoundAssignment();
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 368;
        propertyAssignment();
        break;
      case 4:
        enterOuterAlt(_localctx, 4);
        state = 369;
        indexAssignment();
        break;
      case 5:
        enterOuterAlt(_localctx, 5);
        state = 370;
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
    enterRule(_localctx, 66, RULE_simpleAssignment);
    try {
      enterOuterAlt(_localctx, 1);
      state = 373;
      identifier(0);
      state = 374;
      match(TOKEN_ASSIGN);
      state = 375;
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
    enterRule(_localctx, 68, RULE_compoundAssignment);
    try {
      state = 397;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 25, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 377;
        identifier(0);
        state = 378;
        _localctx.op = match(TOKEN_PLUS_ASSIGN);
        state = 379;
        expr();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 381;
        identifier(0);
        state = 382;
        _localctx.op = match(TOKEN_MINUS_ASSIGN);
        state = 383;
        expr();
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 385;
        identifier(0);
        state = 386;
        _localctx.op = match(TOKEN_MULTIPLY_ASSIGN);
        state = 387;
        expr();
        break;
      case 4:
        enterOuterAlt(_localctx, 4);
        state = 389;
        identifier(0);
        state = 390;
        _localctx.op = match(TOKEN_DIVIDE_ASSIGN);
        state = 391;
        expr();
        break;
      case 5:
        enterOuterAlt(_localctx, 5);
        state = 393;
        identifier(0);
        state = 394;
        _localctx.op = match(TOKEN_MOD_ASSIGN);
        state = 395;
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
    enterRule(_localctx, 70, RULE_propertyAssignment);
    try {
      enterOuterAlt(_localctx, 1);
      state = 399;
      identifier(0);
      state = 400;
      match(TOKEN_DOT);
      state = 401;
      identifier(0);
      state = 402;
      match(TOKEN_ASSIGN);
      state = 403;
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
    enterRule(_localctx, 72, RULE_indexAssignment);
    try {
      enterOuterAlt(_localctx, 1);
      state = 405;
      identifier(0);
      state = 406;
      match(TOKEN_OPEN_BRACKET);
      state = 407;
      expr();
      state = 408;
      match(TOKEN_CLOSE_BRACKET);
      state = 409;
      match(TOKEN_ASSIGN);
      state = 410;
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
    enterRule(_localctx, 74, RULE_indexPropertyAssignment);
    try {
      enterOuterAlt(_localctx, 1);
      state = 412;
      identifier(0);
      state = 413;
      match(TOKEN_OPEN_BRACKET);
      state = 414;
      expr();
      state = 415;
      match(TOKEN_CLOSE_BRACKET);
      state = 416;
      match(TOKEN_DOT);
      state = 417;
      identifier(0);
      state = 418;
      match(TOKEN_ASSIGN);
      state = 419;
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
    enterRule(_localctx, 76, RULE_varDecl);
    try {
      state = 431;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 27, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 421;
        varType();
        state = 422;
        dataType();
        state = 423;
        identifier(0);
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 425;
        varType();
        state = 427;
        errorHandler.sync(this);
        switch (interpreter!.adaptivePredict(tokenStream, 26, context)) {
        case 1:
          state = 426;
          dataType();
          break;
        }
        state = 429;
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
    enterRule(_localctx, 78, RULE_expr);
    try {
      enterOuterAlt(_localctx, 1);
      state = 433;
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
    enterRule(_localctx, 80, RULE_logicalExpr);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 435;
      _localctx.left = relationalExpr();
      state = 440;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_AND || _la == TOKEN_OR) {
        state = 436;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!(_la == TOKEN_AND || _la == TOKEN_OR)) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 437;
        _localctx.right = relationalExpr();
        state = 442;
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
    enterRule(_localctx, 82, RULE_relationalExpr);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 443;
      _localctx.left = bitwiseExpr();
      state = 448;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 487424) != 0)) {
        state = 444;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!((((_la) & ~0x3f) == 0 && ((1 << _la) & 487424) != 0))) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 445;
        _localctx.right = bitwiseExpr();
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

  BitwiseExprContext bitwiseExpr() {
    dynamic _localctx = BitwiseExprContext(context, state);
    enterRule(_localctx, 84, RULE_bitwiseExpr);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 451;
      _localctx.left = shiftExpr();
      state = 456;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 469762048) != 0)) {
        state = 452;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!((((_la) & ~0x3f) == 0 && ((1 << _la) & 469762048) != 0))) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 453;
        _localctx.right = shiftExpr();
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

  ShiftExprContext shiftExpr() {
    dynamic _localctx = ShiftExprContext(context, state);
    enterRule(_localctx, 86, RULE_shiftExpr);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 459;
      _localctx.left = additiveExpr();
      state = 464;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_BIT_LEFT_SHIFT || _la == TOKEN_BIT_RIGHT_SHIFT) {
        state = 460;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!(_la == TOKEN_BIT_LEFT_SHIFT || _la == TOKEN_BIT_RIGHT_SHIFT)) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 461;
        _localctx.right = additiveExpr();
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

  AdditiveExprContext additiveExpr() {
    dynamic _localctx = AdditiveExprContext(context, state);
    enterRule(_localctx, 88, RULE_additiveExpr);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 467;
      _localctx.left = multiplicativeExpr();
      state = 472;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_PLUS || _la == TOKEN_MINUS) {
        state = 468;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!(_la == TOKEN_PLUS || _la == TOKEN_MINUS)) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 469;
        _localctx.right = multiplicativeExpr();
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

  MultiplicativeExprContext multiplicativeExpr() {
    dynamic _localctx = MultiplicativeExprContext(context, state);
    enterRule(_localctx, 90, RULE_multiplicativeExpr);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 475;
      _localctx.left = unaryExpr();
      state = 480;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 56) != 0)) {
        state = 476;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!((((_la) & ~0x3f) == 0 && ((1 << _la) & 56) != 0))) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 477;
        _localctx.right = unaryExpr();
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

  UnaryExprContext unaryExpr() {
    dynamic _localctx = UnaryExprContext(context, state);
    enterRule(_localctx, 92, RULE_unaryExpr);
    int _la;
    try {
      state = 486;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_PLUS:
      case TOKEN_MINUS:
      case TOKEN_NOT:
      case TOKEN_BIT_NOT:
        enterOuterAlt(_localctx, 1);
        state = 483;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!((((_la) & ~0x3f) == 0 && ((1 << _la) & 570425350) != 0))) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 484;
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
        state = 485;
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
    enterRule(_localctx, 94, RULE_suffixExpr);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 488;
      primaryExpr();
      state = 490;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_PLUS_PLUS || _la == TOKEN_MINUS_MINUS) {
        state = 489;
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
    enterRule(_localctx, 96, RULE_primaryExpr);
    try {
      state = 500;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 36, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 492;
        match(TOKEN_OPEN_PAREN);
        state = 493;
        expr();
        state = 494;
        match(TOKEN_CLOSE_PAREN);
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 496;
        functionCall();
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 497;
        externalFunctionCall();
        break;
      case 4:
        enterOuterAlt(_localctx, 4);
        state = 498;
        literal();
        break;
      case 5:
        enterOuterAlt(_localctx, 5);
        state = 499;
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
    enterRule(_localctx, 98, RULE_externalFunctionCall);
    try {
      enterOuterAlt(_localctx, 1);
      state = 502;
      _localctx.namespace = identifier(0);
      state = 503;
      match(TOKEN_DOUBLE_COLON);
      state = 504;
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
    enterRule(_localctx, 100, RULE_functionCall);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 506;
      _localctx.method = identifier(0);
      state = 507;
      match(TOKEN_OPEN_PAREN);
      state = 509;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 576447558734316870) != 0) || ((((_la - 78)) & ~0x3f) == 0 && ((1 << (_la - 78)) & 63) != 0)) {
        state = 508;
        args();
      }

      state = 511;
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
    enterRule(_localctx, 102, RULE_args);
    int _la;
    try {
      int _alt;
      state = 546;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 42, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 513;
        positionalArg();
        state = 518;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 514;
          match(TOKEN_COMMA);
          state = 515;
          positionalArg();
          state = 520;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 521;
        namedArg();
        state = 526;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 522;
          match(TOKEN_COMMA);
          state = 523;
          namedArg();
          state = 528;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 529;
        positionalArg();
        state = 534;
        errorHandler.sync(this);
        _alt = interpreter!.adaptivePredict(tokenStream, 40, context);
        while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
          if (_alt == 1) {
            state = 530;
            match(TOKEN_COMMA);
            state = 531;
            positionalArg(); 
          }
          state = 536;
          errorHandler.sync(this);
          _alt = interpreter!.adaptivePredict(tokenStream, 40, context);
        }
        state = 537;
        match(TOKEN_COMMA);
        state = 538;
        namedArg();
        state = 543;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 539;
          match(TOKEN_COMMA);
          state = 540;
          namedArg();
          state = 545;
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
    enterRule(_localctx, 104, RULE_namedArg);
    try {
      enterOuterAlt(_localctx, 1);
      state = 548;
      identifier(0);
      state = 549;
      match(TOKEN_COLON);
      state = 550;
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
    enterRule(_localctx, 106, RULE_positionalArg);
    try {
      enterOuterAlt(_localctx, 1);
      state = 552;
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
    enterRule(_localctx, 108, RULE_literal);
    try {
      state = 562;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_INT:
        enterOuterAlt(_localctx, 1);
        state = 554;
        match(TOKEN_INT);
        break;
      case TOKEN_DOUBLE:
        enterOuterAlt(_localctx, 2);
        state = 555;
        match(TOKEN_DOUBLE);
        break;
      case TOKEN_BOOL:
        enterOuterAlt(_localctx, 3);
        state = 556;
        match(TOKEN_BOOL);
        break;
      case TOKEN_STRING:
        enterOuterAlt(_localctx, 4);
        state = 557;
        match(TOKEN_STRING);
        break;
      case TOKEN_NULL:
        enterOuterAlt(_localctx, 5);
        state = 558;
        match(TOKEN_NULL);
        break;
      case TOKEN_OPEN_BRACKET:
        enterOuterAlt(_localctx, 6);
        state = 559;
        arrayLiteral();
        break;
      case TOKEN_OPEN_BRACE:
        enterOuterAlt(_localctx, 7);
        state = 560;
        mapLiteral();
        break;
      case TOKEN_AT:
        enterOuterAlt(_localctx, 8);
        state = 561;
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
    var _startState = 110;
    enterRecursionRule(_localctx, 110, RULE_identifier, _p);
    try {
      int _alt;
      enterOuterAlt(_localctx, 1);
      state = 581;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_IDENT:
        state = 565;
        _localctx.ident = match(TOKEN_IDENT);
        break;
      case TOKEN_AUTHOR:
        state = 566;
        _localctx.ident = match(TOKEN_AUTHOR);
        break;
      case TOKEN_NAME:
        state = 567;
        _localctx.ident = match(TOKEN_NAME);
        break;
      case TOKEN_DESCRIPTION:
        state = 568;
        _localctx.ident = match(TOKEN_DESCRIPTION);
        break;
      case TOKEN_VERSION:
        state = 569;
        _localctx.ident = match(TOKEN_VERSION);
        break;
      case TOKEN_LICENSE:
        state = 570;
        _localctx.ident = match(TOKEN_LICENSE);
        break;
      case TOKEN_REPO:
        state = 571;
        _localctx.ident = match(TOKEN_REPO);
        break;
      case TOKEN_WEBSITE:
        state = 572;
        _localctx.ident = match(TOKEN_WEBSITE);
        break;
      case TOKEN_PERMISSIONS:
        state = 573;
        _localctx.ident = match(TOKEN_PERMISSIONS);
        break;
      case TOKEN_CONTRACT:
        state = 574;
        _localctx.ident = match(TOKEN_CONTRACT);
        break;
      case TOKEN_IMPL:
        state = 575;
        _localctx.ident = match(TOKEN_IMPL);
        break;
      case TOKEN_HOOK:
        state = 576;
        _localctx.ident = match(TOKEN_HOOK);
        break;
      case TOKEN_FUNC:
        state = 577;
        _localctx.ident = match(TOKEN_FUNC);
        break;
      case TOKEN_LIST:
        state = 578;
        _localctx.ident = match(TOKEN_LIST);
        break;
      case TOKEN_MAP:
        state = 579;
        _localctx.ident = match(TOKEN_MAP);
        break;
      case TOKEN_SCHEMA:
        state = 580;
        _localctx.ident = match(TOKEN_SCHEMA);
        break;
      default:
        throw NoViableAltException(this);
      }
      state = 585;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 45, context)) {
      case 1:
        state = 583;
        _localctx.nullAware = match(TOKEN_NOT);
        break;
      case 2:
        state = 584;
        _localctx.allowNull = match(TOKEN_Q);
        break;
      }
      context!.stop = tokenStream.LT(-1);
      state = 600;
      errorHandler.sync(this);
      _alt = interpreter!.adaptivePredict(tokenStream, 48, context);
      while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
        if (_alt == 1) {
          if (parseListeners != null) triggerExitRuleEvent();
          _prevctx = _localctx;
          state = 598;
          errorHandler.sync(this);
          switch (interpreter!.adaptivePredict(tokenStream, 47, context)) {
          case 1:
            _localctx = IdentifierContext(_parentctx, _parentState);
            _localctx.objIdent = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_identifier);
            state = 587;
            if (!(precpred(context, 1))) {
              throw FailedPredicateException(this, "precpred(context, 1)");
            }
            state = 588;
            match(TOKEN_DOT);
            state = 589;
            _localctx.property = identifier(2);
            break;
          case 2:
            _localctx = IdentifierContext(_parentctx, _parentState);
            _localctx.indexIdent = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_identifier);
            state = 590;
            if (!(precpred(context, 2))) {
              throw FailedPredicateException(this, "precpred(context, 2)");
            }
            state = 591;
            match(TOKEN_OPEN_BRACKET);
            state = 592;
            _localctx.index = expr();
            state = 593;
            match(TOKEN_CLOSE_BRACKET);
            state = 596;
            errorHandler.sync(this);
            switch (interpreter!.adaptivePredict(tokenStream, 46, context)) {
            case 1:
              state = 594;
              _localctx.nullAware = match(TOKEN_NOT);
              break;
            case 2:
              state = 595;
              _localctx.allowNull = match(TOKEN_Q);
              break;
            }
            break;
          } 
        }
        state = 602;
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
    enterRule(_localctx, 112, RULE_arrayLiteral);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 603;
      match(TOKEN_OPEN_BRACKET);
      state = 612;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 576447558734316870) != 0) || ((((_la - 78)) & ~0x3f) == 0 && ((1 << (_la - 78)) & 63) != 0)) {
        state = 604;
        expr();
        state = 609;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 605;
          match(TOKEN_COMMA);
          state = 606;
          expr();
          state = 611;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
      }

      state = 614;
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
    enterRule(_localctx, 114, RULE_objectLiteral);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 616;
      match(TOKEN_AT);
      state = 617;
      identifier(0);
      state = 618;
      match(TOKEN_OPEN_BRACE);
      state = 627;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (((((_la - 44)) & ~0x3f) == 0 && ((1 << (_la - 44)) & 274877939711) != 0)) {
        state = 619;
        objectProperty();
        state = 624;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 620;
          match(TOKEN_COMMA);
          state = 621;
          objectProperty();
          state = 626;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
      }

      state = 629;
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
    enterRule(_localctx, 116, RULE_objectProperty);
    try {
      enterOuterAlt(_localctx, 1);
      state = 631;
      identifier(0);
      state = 632;
      match(TOKEN_COLON);
      state = 633;
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
    enterRule(_localctx, 118, RULE_mapLiteral);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 635;
      match(TOKEN_OPEN_BRACE);
      state = 644;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 576447558734316870) != 0) || ((((_la - 78)) & ~0x3f) == 0 && ((1 << (_la - 78)) & 63) != 0)) {
        state = 636;
        mapEntry();
        state = 641;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 637;
          match(TOKEN_COMMA);
          state = 638;
          mapEntry();
          state = 643;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
      }

      state = 646;
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
    enterRule(_localctx, 120, RULE_mapEntry);
    try {
      enterOuterAlt(_localctx, 1);
      state = 648;
      _localctx.key = expr();
      state = 649;
      match(TOKEN_COLON);
      state = 650;
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
    enterRule(_localctx, 122, RULE_block);
    int _la;
    try {
      state = 665;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_OPEN_BRACE:
        enterOuterAlt(_localctx, 1);
        state = 652;
        match(TOKEN_OPEN_BRACE);
        state = 656;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 8070437338678822214) != 0) || ((((_la - 65)) & ~0x3f) == 0 && ((1 << (_la - 65)) & 520135) != 0)) {
          state = 653;
          line();
          state = 658;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        state = 659;
        match(TOKEN_CLOSE_BRACE);
        break;
      case TOKEN_IF:
        enterOuterAlt(_localctx, 2);
        state = 660;
        ifStmt();
        break;
      case TOKEN_WHILE:
        enterOuterAlt(_localctx, 3);
        state = 661;
        whileStmt();
        break;
      case TOKEN_FOR:
        enterOuterAlt(_localctx, 4);
        state = 662;
        forStmt();
        break;
      case TOKEN_TRY:
        enterOuterAlt(_localctx, 5);
        state = 663;
        tryStmt();
        break;
      case TOKEN_CATCH:
        enterOuterAlt(_localctx, 6);
        state = 664;
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
    case 55:
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
      4,1,86,668,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,
      2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,2,
      14,7,14,2,15,7,15,2,16,7,16,2,17,7,17,2,18,7,18,2,19,7,19,2,20,7,20,
      2,21,7,21,2,22,7,22,2,23,7,23,2,24,7,24,2,25,7,25,2,26,7,26,2,27,7,
      27,2,28,7,28,2,29,7,29,2,30,7,30,2,31,7,31,2,32,7,32,2,33,7,33,2,34,
      7,34,2,35,7,35,2,36,7,36,2,37,7,37,2,38,7,38,2,39,7,39,2,40,7,40,2,
      41,7,41,2,42,7,42,2,43,7,43,2,44,7,44,2,45,7,45,2,46,7,46,2,47,7,47,
      2,48,7,48,2,49,7,49,2,50,7,50,2,51,7,51,2,52,7,52,2,53,7,53,2,54,7,
      54,2,55,7,55,2,56,7,56,2,57,7,57,2,58,7,58,2,59,7,59,2,60,7,60,2,61,
      7,61,1,0,3,0,126,8,0,1,0,5,0,129,8,0,10,0,12,0,132,9,0,1,0,5,0,135,
      8,0,10,0,12,0,138,9,0,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,1,
      150,8,1,1,2,1,2,1,2,1,2,1,3,1,3,1,3,1,3,1,4,1,4,1,4,1,4,1,5,1,5,1,
      5,1,5,1,6,1,6,1,6,1,6,1,7,1,7,1,7,1,7,1,8,1,8,1,8,1,8,1,9,1,9,1,9,
      1,9,1,10,1,10,1,10,1,10,5,10,188,8,10,10,10,12,10,191,9,10,1,10,1,
      10,1,11,1,11,1,11,1,11,1,12,1,12,1,12,1,12,1,12,1,12,5,12,205,8,12,
      10,12,12,12,208,9,12,1,12,1,12,1,12,5,12,213,8,12,10,12,12,12,216,
      9,12,1,12,1,12,1,13,1,13,1,13,1,13,3,13,224,8,13,1,13,1,13,1,13,1,
      14,1,14,1,14,1,14,3,14,233,8,14,1,14,1,14,1,14,1,14,1,14,1,15,1,15,
      1,15,1,15,3,15,244,8,15,1,15,1,15,1,15,1,15,1,15,1,16,1,16,1,16,5,
      16,254,8,16,10,16,12,16,257,9,16,1,17,1,17,1,17,1,18,1,18,3,18,264,
      8,18,1,18,1,18,1,18,1,18,1,18,3,18,271,8,18,1,18,1,18,1,18,1,18,1,
      18,1,18,1,18,3,18,280,8,18,3,18,282,8,18,1,19,1,19,1,19,1,19,1,19,
      1,19,1,19,1,19,1,19,1,19,3,19,294,8,19,1,20,1,20,1,20,1,21,1,21,1,
      21,1,21,1,21,1,21,3,21,305,8,21,1,22,1,22,1,22,3,22,310,8,22,1,23,
      1,23,1,23,1,23,1,23,1,23,1,24,1,24,1,24,1,24,3,24,322,8,24,1,24,1,
      24,1,24,1,24,1,24,1,24,1,24,1,24,1,24,3,24,333,8,24,1,24,1,24,1,24,
      1,25,1,25,3,25,340,8,25,1,26,1,26,1,27,1,27,1,28,1,28,1,28,1,28,1,
      29,1,29,1,29,1,29,1,29,1,29,1,30,1,30,3,30,358,8,30,1,30,1,30,1,30,
      3,30,363,8,30,1,31,1,31,1,32,1,32,1,32,1,32,1,32,3,32,372,8,32,1,33,
      1,33,1,33,1,33,1,34,1,34,1,34,1,34,1,34,1,34,1,34,1,34,1,34,1,34,1,
      34,1,34,1,34,1,34,1,34,1,34,1,34,1,34,1,34,1,34,3,34,398,8,34,1,35,
      1,35,1,35,1,35,1,35,1,35,1,36,1,36,1,36,1,36,1,36,1,36,1,36,1,37,1,
      37,1,37,1,37,1,37,1,37,1,37,1,37,1,37,1,38,1,38,1,38,1,38,1,38,1,38,
      3,38,428,8,38,1,38,1,38,3,38,432,8,38,1,39,1,39,1,40,1,40,1,40,5,40,
      439,8,40,10,40,12,40,442,9,40,1,41,1,41,1,41,5,41,447,8,41,10,41,12,
      41,450,9,41,1,42,1,42,1,42,5,42,455,8,42,10,42,12,42,458,9,42,1,43,
      1,43,1,43,5,43,463,8,43,10,43,12,43,466,9,43,1,44,1,44,1,44,5,44,471,
      8,44,10,44,12,44,474,9,44,1,45,1,45,1,45,5,45,479,8,45,10,45,12,45,
      482,9,45,1,46,1,46,1,46,3,46,487,8,46,1,47,1,47,3,47,491,8,47,1,48,
      1,48,1,48,1,48,1,48,1,48,1,48,1,48,3,48,501,8,48,1,49,1,49,1,49,1,
      49,1,50,1,50,1,50,3,50,510,8,50,1,50,1,50,1,51,1,51,1,51,5,51,517,
      8,51,10,51,12,51,520,9,51,1,51,1,51,1,51,5,51,525,8,51,10,51,12,51,
      528,9,51,1,51,1,51,1,51,5,51,533,8,51,10,51,12,51,536,9,51,1,51,1,
      51,1,51,1,51,5,51,542,8,51,10,51,12,51,545,9,51,3,51,547,8,51,1,52,
      1,52,1,52,1,52,1,53,1,53,1,54,1,54,1,54,1,54,1,54,1,54,1,54,1,54,3,
      54,563,8,54,1,55,1,55,1,55,1,55,1,55,1,55,1,55,1,55,1,55,1,55,1,55,
      1,55,1,55,1,55,1,55,1,55,1,55,3,55,582,8,55,1,55,1,55,3,55,586,8,55,
      1,55,1,55,1,55,1,55,1,55,1,55,1,55,1,55,1,55,3,55,597,8,55,5,55,599,
      8,55,10,55,12,55,602,9,55,1,56,1,56,1,56,1,56,5,56,608,8,56,10,56,
      12,56,611,9,56,3,56,613,8,56,1,56,1,56,1,57,1,57,1,57,1,57,1,57,1,
      57,5,57,623,8,57,10,57,12,57,626,9,57,3,57,628,8,57,1,57,1,57,1,58,
      1,58,1,58,1,58,1,59,1,59,1,59,1,59,5,59,640,8,59,10,59,12,59,643,9,
      59,3,59,645,8,59,1,59,1,59,1,60,1,60,1,60,1,60,1,61,1,61,5,61,655,
      8,61,10,61,12,61,658,9,61,1,61,1,61,1,61,1,61,1,61,1,61,3,61,666,8,
      61,1,61,0,1,110,62,0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,
      36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,
      80,82,84,86,88,90,92,94,96,98,100,102,104,106,108,110,112,114,116,
      118,120,122,0,9,1,0,74,76,1,0,23,24,2,0,12,14,16,18,1,0,26,28,1,0,
      30,31,1,0,1,2,1,0,3,5,3,0,1,2,25,25,29,29,1,0,40,41,713,0,125,1,0,
      0,0,2,149,1,0,0,0,4,151,1,0,0,0,6,155,1,0,0,0,8,159,1,0,0,0,10,163,
      1,0,0,0,12,167,1,0,0,0,14,171,1,0,0,0,16,175,1,0,0,0,18,179,1,0,0,
      0,20,183,1,0,0,0,22,194,1,0,0,0,24,198,1,0,0,0,26,219,1,0,0,0,28,228,
      1,0,0,0,30,239,1,0,0,0,32,250,1,0,0,0,34,258,1,0,0,0,36,281,1,0,0,
      0,38,293,1,0,0,0,40,295,1,0,0,0,42,298,1,0,0,0,44,306,1,0,0,0,46,311,
      1,0,0,0,48,317,1,0,0,0,50,337,1,0,0,0,52,341,1,0,0,0,54,343,1,0,0,
      0,56,345,1,0,0,0,58,349,1,0,0,0,60,362,1,0,0,0,62,364,1,0,0,0,64,371,
      1,0,0,0,66,373,1,0,0,0,68,397,1,0,0,0,70,399,1,0,0,0,72,405,1,0,0,
      0,74,412,1,0,0,0,76,431,1,0,0,0,78,433,1,0,0,0,80,435,1,0,0,0,82,443,
      1,0,0,0,84,451,1,0,0,0,86,459,1,0,0,0,88,467,1,0,0,0,90,475,1,0,0,
      0,92,486,1,0,0,0,94,488,1,0,0,0,96,500,1,0,0,0,98,502,1,0,0,0,100,
      506,1,0,0,0,102,546,1,0,0,0,104,548,1,0,0,0,106,552,1,0,0,0,108,562,
      1,0,0,0,110,564,1,0,0,0,112,603,1,0,0,0,114,616,1,0,0,0,116,631,1,
      0,0,0,118,635,1,0,0,0,120,648,1,0,0,0,122,665,1,0,0,0,124,126,3,4,
      2,0,125,124,1,0,0,0,125,126,1,0,0,0,126,130,1,0,0,0,127,129,3,2,1,
      0,128,127,1,0,0,0,129,132,1,0,0,0,130,128,1,0,0,0,130,131,1,0,0,0,
      131,136,1,0,0,0,132,130,1,0,0,0,133,135,3,20,10,0,134,133,1,0,0,0,
      135,138,1,0,0,0,136,134,1,0,0,0,136,137,1,0,0,0,137,139,1,0,0,0,138,
      136,1,0,0,0,139,140,3,24,12,0,140,141,5,0,0,1,141,1,1,0,0,0,142,150,
      3,18,9,0,143,150,3,8,4,0,144,150,3,6,3,0,145,150,3,10,5,0,146,150,
      3,12,6,0,147,150,3,14,7,0,148,150,3,16,8,0,149,142,1,0,0,0,149,143,
      1,0,0,0,149,144,1,0,0,0,149,145,1,0,0,0,149,146,1,0,0,0,149,147,1,
      0,0,0,149,148,1,0,0,0,150,3,1,0,0,0,151,152,5,44,0,0,152,153,5,83,
      0,0,153,154,5,22,0,0,154,5,1,0,0,0,155,156,5,45,0,0,156,157,5,83,0,
      0,157,158,5,22,0,0,158,7,1,0,0,0,159,160,5,46,0,0,160,161,5,83,0,0,
      161,162,5,22,0,0,162,9,1,0,0,0,163,164,5,47,0,0,164,165,5,77,0,0,165,
      166,5,22,0,0,166,11,1,0,0,0,167,168,5,48,0,0,168,169,5,83,0,0,169,
      170,5,22,0,0,170,13,1,0,0,0,171,172,5,49,0,0,172,173,5,83,0,0,173,
      174,5,22,0,0,174,15,1,0,0,0,175,176,5,50,0,0,176,177,5,83,0,0,177,
      178,5,22,0,0,178,17,1,0,0,0,179,180,5,51,0,0,180,181,5,83,0,0,181,
      182,5,22,0,0,182,19,1,0,0,0,183,184,5,52,0,0,184,189,3,22,11,0,185,
      186,5,21,0,0,186,188,3,22,11,0,187,185,1,0,0,0,188,191,1,0,0,0,189,
      187,1,0,0,0,189,190,1,0,0,0,190,192,1,0,0,0,191,189,1,0,0,0,192,193,
      5,22,0,0,193,21,1,0,0,0,194,195,3,110,55,0,195,196,5,20,0,0,196,197,
      3,110,55,0,197,23,1,0,0,0,198,199,5,53,0,0,199,200,3,110,55,0,200,
      206,5,8,0,0,201,202,3,76,38,0,202,203,5,22,0,0,203,205,1,0,0,0,204,
      201,1,0,0,0,205,208,1,0,0,0,206,204,1,0,0,0,206,207,1,0,0,0,207,214,
      1,0,0,0,208,206,1,0,0,0,209,213,3,26,13,0,210,213,3,28,14,0,211,213,
      3,30,15,0,212,209,1,0,0,0,212,210,1,0,0,0,212,211,1,0,0,0,213,216,
      1,0,0,0,214,212,1,0,0,0,214,215,1,0,0,0,215,217,1,0,0,0,216,214,1,
      0,0,0,217,218,5,9,0,0,218,25,1,0,0,0,219,220,5,55,0,0,220,221,3,110,
      55,0,221,223,5,6,0,0,222,224,3,32,16,0,223,222,1,0,0,0,223,224,1,0,
      0,0,224,225,1,0,0,0,225,226,5,7,0,0,226,227,3,122,61,0,227,27,1,0,
      0,0,228,229,5,54,0,0,229,230,3,110,55,0,230,232,5,6,0,0,231,233,3,
      32,16,0,232,231,1,0,0,0,232,233,1,0,0,0,233,234,1,0,0,0,234,235,5,
      7,0,0,235,236,5,32,0,0,236,237,3,36,18,0,237,238,3,122,61,0,238,29,
      1,0,0,0,239,240,5,56,0,0,240,241,3,110,55,0,241,243,5,6,0,0,242,244,
      3,32,16,0,243,242,1,0,0,0,243,244,1,0,0,0,244,245,1,0,0,0,245,246,
      5,7,0,0,246,247,5,32,0,0,247,248,3,36,18,0,248,249,3,122,61,0,249,
      31,1,0,0,0,250,255,3,34,17,0,251,252,5,21,0,0,252,254,3,34,17,0,253,
      251,1,0,0,0,254,257,1,0,0,0,255,253,1,0,0,0,255,256,1,0,0,0,256,33,
      1,0,0,0,257,255,1,0,0,0,258,259,3,36,18,0,259,260,3,110,55,0,260,35,
      1,0,0,0,261,263,3,110,55,0,262,264,5,33,0,0,263,262,1,0,0,0,263,264,
      1,0,0,0,264,282,1,0,0,0,265,266,5,57,0,0,266,267,5,13,0,0,267,268,
      3,36,18,0,268,270,5,12,0,0,269,271,5,33,0,0,270,269,1,0,0,0,270,271,
      1,0,0,0,271,282,1,0,0,0,272,273,5,58,0,0,273,274,5,13,0,0,274,275,
      3,36,18,0,275,276,5,21,0,0,276,277,3,36,18,0,277,279,5,12,0,0,278,
      280,5,33,0,0,279,278,1,0,0,0,279,280,1,0,0,0,280,282,1,0,0,0,281,261,
      1,0,0,0,281,265,1,0,0,0,281,272,1,0,0,0,282,37,1,0,0,0,283,294,3,76,
      38,0,284,294,3,64,32,0,285,294,3,50,25,0,286,294,3,52,26,0,287,294,
      3,54,27,0,288,294,3,40,20,0,289,294,3,42,21,0,290,294,3,46,23,0,291,
      294,3,48,24,0,292,294,3,56,28,0,293,283,1,0,0,0,293,284,1,0,0,0,293,
      285,1,0,0,0,293,286,1,0,0,0,293,287,1,0,0,0,293,288,1,0,0,0,293,289,
      1,0,0,0,293,290,1,0,0,0,293,291,1,0,0,0,293,292,1,0,0,0,294,39,1,0,
      0,0,295,296,5,73,0,0,296,297,3,78,39,0,297,41,1,0,0,0,298,299,5,59,
      0,0,299,300,5,6,0,0,300,301,3,78,39,0,301,302,5,7,0,0,302,304,3,122,
      61,0,303,305,3,44,22,0,304,303,1,0,0,0,304,305,1,0,0,0,305,43,1,0,
      0,0,306,309,5,60,0,0,307,310,3,42,21,0,308,310,3,122,61,0,309,307,
      1,0,0,0,309,308,1,0,0,0,310,45,1,0,0,0,311,312,5,61,0,0,312,313,5,
      6,0,0,313,314,3,78,39,0,314,315,5,7,0,0,315,316,3,122,61,0,316,47,
      1,0,0,0,317,318,5,62,0,0,318,332,5,6,0,0,319,322,3,76,38,0,320,322,
      5,82,0,0,321,319,1,0,0,0,321,320,1,0,0,0,322,323,1,0,0,0,323,324,5,
      22,0,0,324,325,3,78,39,0,325,326,5,22,0,0,326,327,3,64,32,0,327,333,
      1,0,0,0,328,329,3,76,38,0,329,330,5,63,0,0,330,331,3,78,39,0,331,333,
      1,0,0,0,332,321,1,0,0,0,332,328,1,0,0,0,333,334,1,0,0,0,334,335,5,
      7,0,0,335,336,3,122,61,0,336,49,1,0,0,0,337,339,5,65,0,0,338,340,3,
      78,39,0,339,338,1,0,0,0,339,340,1,0,0,0,340,51,1,0,0,0,341,342,5,66,
      0,0,342,53,1,0,0,0,343,344,5,67,0,0,344,55,1,0,0,0,345,346,5,71,0,
      0,346,347,3,122,61,0,347,348,3,58,29,0,348,57,1,0,0,0,349,350,5,72,
      0,0,350,351,5,6,0,0,351,352,3,110,55,0,352,353,5,7,0,0,353,354,3,122,
      61,0,354,59,1,0,0,0,355,358,3,38,19,0,356,358,3,78,39,0,357,355,1,
      0,0,0,357,356,1,0,0,0,358,359,1,0,0,0,359,360,5,22,0,0,360,363,1,0,
      0,0,361,363,3,122,61,0,362,357,1,0,0,0,362,361,1,0,0,0,363,61,1,0,
      0,0,364,365,7,0,0,0,365,63,1,0,0,0,366,372,3,66,33,0,367,372,3,68,
      34,0,368,372,3,70,35,0,369,372,3,72,36,0,370,372,3,74,37,0,371,366,
      1,0,0,0,371,367,1,0,0,0,371,368,1,0,0,0,371,369,1,0,0,0,371,370,1,
      0,0,0,372,65,1,0,0,0,373,374,3,110,55,0,374,375,5,15,0,0,375,376,3,
      78,39,0,376,67,1,0,0,0,377,378,3,110,55,0,378,379,5,35,0,0,379,380,
      3,78,39,0,380,398,1,0,0,0,381,382,3,110,55,0,382,383,5,36,0,0,383,
      384,3,78,39,0,384,398,1,0,0,0,385,386,3,110,55,0,386,387,5,37,0,0,
      387,388,3,78,39,0,388,398,1,0,0,0,389,390,3,110,55,0,390,391,5,38,
      0,0,391,392,3,78,39,0,392,398,1,0,0,0,393,394,3,110,55,0,394,395,5,
      39,0,0,395,396,3,78,39,0,396,398,1,0,0,0,397,377,1,0,0,0,397,381,1,
      0,0,0,397,385,1,0,0,0,397,389,1,0,0,0,397,393,1,0,0,0,398,69,1,0,0,
      0,399,400,3,110,55,0,400,401,5,34,0,0,401,402,3,110,55,0,402,403,5,
      15,0,0,403,404,3,78,39,0,404,71,1,0,0,0,405,406,3,110,55,0,406,407,
      5,10,0,0,407,408,3,78,39,0,408,409,5,11,0,0,409,410,5,15,0,0,410,411,
      3,78,39,0,411,73,1,0,0,0,412,413,3,110,55,0,413,414,5,10,0,0,414,415,
      3,78,39,0,415,416,5,11,0,0,416,417,5,34,0,0,417,418,3,110,55,0,418,
      419,5,15,0,0,419,420,3,78,39,0,420,75,1,0,0,0,421,422,3,62,31,0,422,
      423,3,36,18,0,423,424,3,110,55,0,424,432,1,0,0,0,425,427,3,62,31,0,
      426,428,3,36,18,0,427,426,1,0,0,0,427,428,1,0,0,0,428,429,1,0,0,0,
      429,430,3,64,32,0,430,432,1,0,0,0,431,421,1,0,0,0,431,425,1,0,0,0,
      432,77,1,0,0,0,433,434,3,80,40,0,434,79,1,0,0,0,435,440,3,82,41,0,
      436,437,7,1,0,0,437,439,3,82,41,0,438,436,1,0,0,0,439,442,1,0,0,0,
      440,438,1,0,0,0,440,441,1,0,0,0,441,81,1,0,0,0,442,440,1,0,0,0,443,
      448,3,84,42,0,444,445,7,2,0,0,445,447,3,84,42,0,446,444,1,0,0,0,447,
      450,1,0,0,0,448,446,1,0,0,0,448,449,1,0,0,0,449,83,1,0,0,0,450,448,
      1,0,0,0,451,456,3,86,43,0,452,453,7,3,0,0,453,455,3,86,43,0,454,452,
      1,0,0,0,455,458,1,0,0,0,456,454,1,0,0,0,456,457,1,0,0,0,457,85,1,0,
      0,0,458,456,1,0,0,0,459,464,3,88,44,0,460,461,7,4,0,0,461,463,3,88,
      44,0,462,460,1,0,0,0,463,466,1,0,0,0,464,462,1,0,0,0,464,465,1,0,0,
      0,465,87,1,0,0,0,466,464,1,0,0,0,467,472,3,90,45,0,468,469,7,5,0,0,
      469,471,3,90,45,0,470,468,1,0,0,0,471,474,1,0,0,0,472,470,1,0,0,0,
      472,473,1,0,0,0,473,89,1,0,0,0,474,472,1,0,0,0,475,480,3,92,46,0,476,
      477,7,6,0,0,477,479,3,92,46,0,478,476,1,0,0,0,479,482,1,0,0,0,480,
      478,1,0,0,0,480,481,1,0,0,0,481,91,1,0,0,0,482,480,1,0,0,0,483,484,
      7,7,0,0,484,487,3,92,46,0,485,487,3,94,47,0,486,483,1,0,0,0,486,485,
      1,0,0,0,487,93,1,0,0,0,488,490,3,96,48,0,489,491,7,8,0,0,490,489,1,
      0,0,0,490,491,1,0,0,0,491,95,1,0,0,0,492,493,5,6,0,0,493,494,3,78,
      39,0,494,495,5,7,0,0,495,501,1,0,0,0,496,501,3,100,50,0,497,501,3,
      98,49,0,498,501,3,108,54,0,499,501,3,110,55,0,500,492,1,0,0,0,500,
      496,1,0,0,0,500,497,1,0,0,0,500,498,1,0,0,0,500,499,1,0,0,0,501,97,
      1,0,0,0,502,503,3,110,55,0,503,504,5,20,0,0,504,505,3,100,50,0,505,
      99,1,0,0,0,506,507,3,110,55,0,507,509,5,6,0,0,508,510,3,102,51,0,509,
      508,1,0,0,0,509,510,1,0,0,0,510,511,1,0,0,0,511,512,5,7,0,0,512,101,
      1,0,0,0,513,518,3,106,53,0,514,515,5,21,0,0,515,517,3,106,53,0,516,
      514,1,0,0,0,517,520,1,0,0,0,518,516,1,0,0,0,518,519,1,0,0,0,519,547,
      1,0,0,0,520,518,1,0,0,0,521,526,3,104,52,0,522,523,5,21,0,0,523,525,
      3,104,52,0,524,522,1,0,0,0,525,528,1,0,0,0,526,524,1,0,0,0,526,527,
      1,0,0,0,527,547,1,0,0,0,528,526,1,0,0,0,529,534,3,106,53,0,530,531,
      5,21,0,0,531,533,3,106,53,0,532,530,1,0,0,0,533,536,1,0,0,0,534,532,
      1,0,0,0,534,535,1,0,0,0,535,537,1,0,0,0,536,534,1,0,0,0,537,538,5,
      21,0,0,538,543,3,104,52,0,539,540,5,21,0,0,540,542,3,104,52,0,541,
      539,1,0,0,0,542,545,1,0,0,0,543,541,1,0,0,0,543,544,1,0,0,0,544,547,
      1,0,0,0,545,543,1,0,0,0,546,513,1,0,0,0,546,521,1,0,0,0,546,529,1,
      0,0,0,547,103,1,0,0,0,548,549,3,110,55,0,549,550,5,19,0,0,550,551,
      3,78,39,0,551,105,1,0,0,0,552,553,3,78,39,0,553,107,1,0,0,0,554,563,
      5,80,0,0,555,563,5,81,0,0,556,563,5,78,0,0,557,563,5,83,0,0,558,563,
      5,79,0,0,559,563,3,112,56,0,560,563,3,118,59,0,561,563,3,114,57,0,
      562,554,1,0,0,0,562,555,1,0,0,0,562,556,1,0,0,0,562,557,1,0,0,0,562,
      558,1,0,0,0,562,559,1,0,0,0,562,560,1,0,0,0,562,561,1,0,0,0,563,109,
      1,0,0,0,564,581,6,55,-1,0,565,582,5,82,0,0,566,582,5,45,0,0,567,582,
      5,51,0,0,568,582,5,46,0,0,569,582,5,47,0,0,570,582,5,48,0,0,571,582,
      5,49,0,0,572,582,5,50,0,0,573,582,5,52,0,0,574,582,5,53,0,0,575,582,
      5,54,0,0,576,582,5,55,0,0,577,582,5,56,0,0,578,582,5,57,0,0,579,582,
      5,58,0,0,580,582,5,44,0,0,581,565,1,0,0,0,581,566,1,0,0,0,581,567,
      1,0,0,0,581,568,1,0,0,0,581,569,1,0,0,0,581,570,1,0,0,0,581,571,1,
      0,0,0,581,572,1,0,0,0,581,573,1,0,0,0,581,574,1,0,0,0,581,575,1,0,
      0,0,581,576,1,0,0,0,581,577,1,0,0,0,581,578,1,0,0,0,581,579,1,0,0,
      0,581,580,1,0,0,0,582,585,1,0,0,0,583,586,5,25,0,0,584,586,5,33,0,
      0,585,583,1,0,0,0,585,584,1,0,0,0,585,586,1,0,0,0,586,600,1,0,0,0,
      587,588,10,1,0,0,588,589,5,34,0,0,589,599,3,110,55,2,590,591,10,2,
      0,0,591,592,5,10,0,0,592,593,3,78,39,0,593,596,5,11,0,0,594,597,5,
      25,0,0,595,597,5,33,0,0,596,594,1,0,0,0,596,595,1,0,0,0,596,597,1,
      0,0,0,597,599,1,0,0,0,598,587,1,0,0,0,598,590,1,0,0,0,599,602,1,0,
      0,0,600,598,1,0,0,0,600,601,1,0,0,0,601,111,1,0,0,0,602,600,1,0,0,
      0,603,612,5,10,0,0,604,609,3,78,39,0,605,606,5,21,0,0,606,608,3,78,
      39,0,607,605,1,0,0,0,608,611,1,0,0,0,609,607,1,0,0,0,609,610,1,0,0,
      0,610,613,1,0,0,0,611,609,1,0,0,0,612,604,1,0,0,0,612,613,1,0,0,0,
      613,614,1,0,0,0,614,615,5,11,0,0,615,113,1,0,0,0,616,617,5,42,0,0,
      617,618,3,110,55,0,618,627,5,8,0,0,619,624,3,116,58,0,620,621,5,21,
      0,0,621,623,3,116,58,0,622,620,1,0,0,0,623,626,1,0,0,0,624,622,1,0,
      0,0,624,625,1,0,0,0,625,628,1,0,0,0,626,624,1,0,0,0,627,619,1,0,0,
      0,627,628,1,0,0,0,628,629,1,0,0,0,629,630,5,9,0,0,630,115,1,0,0,0,
      631,632,3,110,55,0,632,633,5,19,0,0,633,634,3,78,39,0,634,117,1,0,
      0,0,635,644,5,8,0,0,636,641,3,120,60,0,637,638,5,21,0,0,638,640,3,
      120,60,0,639,637,1,0,0,0,640,643,1,0,0,0,641,639,1,0,0,0,641,642,1,
      0,0,0,642,645,1,0,0,0,643,641,1,0,0,0,644,636,1,0,0,0,644,645,1,0,
      0,0,645,646,1,0,0,0,646,647,5,9,0,0,647,119,1,0,0,0,648,649,3,78,39,
      0,649,650,5,19,0,0,650,651,3,78,39,0,651,121,1,0,0,0,652,656,5,8,0,
      0,653,655,3,60,30,0,654,653,1,0,0,0,655,658,1,0,0,0,656,654,1,0,0,
      0,656,657,1,0,0,0,657,659,1,0,0,0,658,656,1,0,0,0,659,666,5,9,0,0,
      660,666,3,42,21,0,661,666,3,46,23,0,662,666,3,48,24,0,663,666,3,56,
      28,0,664,666,3,58,29,0,665,652,1,0,0,0,665,660,1,0,0,0,665,661,1,0,
      0,0,665,662,1,0,0,0,665,663,1,0,0,0,665,664,1,0,0,0,666,123,1,0,0,
      0,57,125,130,136,149,189,206,212,214,223,232,243,255,263,270,279,281,
      293,304,309,321,332,339,357,362,371,397,427,431,440,448,456,464,472,
      480,486,490,500,509,518,526,534,543,546,562,581,585,596,598,600,609,
      612,624,627,641,644,656,665
  ];

  static final ATN _ATN =
      ATNDeserializer().deserialize(_serializedATN);
}
class ScriptContext extends ParserRuleContext {
  ContractContext? contract() => getRuleContext<ContractContext>(0);
  TerminalNode? EOF() => getToken(dscriptParser.TOKEN_EOF, 0);
  SchemaContext? schema() => getRuleContext<SchemaContext>(0);
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
  List<VarDeclContext> varDecls() => getRuleContexts<VarDeclContext>();
  VarDeclContext? varDecl(int i) => getRuleContext<VarDeclContext>(i);
  List<TerminalNode> SEMIs() => getTokens(dscriptParser.TOKEN_SEMI);
  TerminalNode? SEMI(int i) => getToken(dscriptParser.TOKEN_SEMI, i);
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

