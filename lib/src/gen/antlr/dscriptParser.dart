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
          RULE_compoundAssignment = 34, RULE_varDecl = 35, RULE_expr = 36, 
          RULE_logicalExpr = 37, RULE_relationalExpr = 38, RULE_bitwiseExpr = 39, 
          RULE_shiftExpr = 40, RULE_additiveExpr = 41, RULE_multiplicativeExpr = 42, 
          RULE_unaryExpr = 43, RULE_suffixExpr = 44, RULE_primaryExpr = 45, 
          RULE_externalFunctionCall = 46, RULE_functionCall = 47, RULE_args = 48, 
          RULE_namedArg = 49, RULE_positionalArg = 50, RULE_literal = 51, 
          RULE_identifier = 52, RULE_arrayLiteral = 53, RULE_objectLiteral = 54, 
          RULE_objectProperty = 55, RULE_mapLiteral = 56, RULE_mapEntry = 57, 
          RULE_block = 58;
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
    'simpleAssignment', 'compoundAssignment', 'varDecl', 'expr', 'logicalExpr', 
    'relationalExpr', 'bitwiseExpr', 'shiftExpr', 'additiveExpr', 'multiplicativeExpr', 
    'unaryExpr', 'suffixExpr', 'primaryExpr', 'externalFunctionCall', 'functionCall', 
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
      state = 119;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_SCHEMA) {
        state = 118;
        schema();
      }

      state = 124;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 4468415255281664) != 0)) {
        state = 121;
        metadata();
        state = 126;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 130;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_PERMISSIONS) {
        state = 127;
        permissions();
        state = 132;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 133;
      contract();
      state = 134;
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
      state = 143;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_NAME:
        enterOuterAlt(_localctx, 1);
        state = 136;
        name();
        break;
      case TOKEN_DESCRIPTION:
        enterOuterAlt(_localctx, 2);
        state = 137;
        description();
        break;
      case TOKEN_AUTHOR:
        enterOuterAlt(_localctx, 3);
        state = 138;
        author();
        break;
      case TOKEN_VERSION:
        enterOuterAlt(_localctx, 4);
        state = 139;
        version();
        break;
      case TOKEN_LICENSE:
        enterOuterAlt(_localctx, 5);
        state = 140;
        license();
        break;
      case TOKEN_REPO:
        enterOuterAlt(_localctx, 6);
        state = 141;
        repo();
        break;
      case TOKEN_WEBSITE:
        enterOuterAlt(_localctx, 7);
        state = 142;
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
      state = 145;
      match(TOKEN_SCHEMA);
      state = 146;
      match(TOKEN_STRING);
      state = 147;
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
      state = 149;
      match(TOKEN_AUTHOR);
      state = 150;
      match(TOKEN_STRING);
      state = 151;
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
      state = 153;
      match(TOKEN_DESCRIPTION);
      state = 154;
      match(TOKEN_STRING);
      state = 155;
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
      state = 157;
      match(TOKEN_VERSION);
      state = 158;
      match(TOKEN_SEMVER);
      state = 159;
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
      state = 161;
      match(TOKEN_LICENSE);
      state = 162;
      match(TOKEN_STRING);
      state = 163;
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
      state = 165;
      match(TOKEN_REPO);
      state = 166;
      match(TOKEN_STRING);
      state = 167;
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
      state = 169;
      match(TOKEN_WEBSITE);
      state = 170;
      match(TOKEN_STRING);
      state = 171;
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
      state = 173;
      match(TOKEN_NAME);
      state = 174;
      match(TOKEN_STRING);
      state = 175;
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
      state = 177;
      match(TOKEN_PERMISSIONS);
      state = 178;
      permission();
      state = 183;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_COMMA) {
        state = 179;
        match(TOKEN_COMMA);
        state = 180;
        permission();
        state = 185;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 186;
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
      state = 188;
      _localctx.namespace = identifier(0);
      state = 189;
      match(TOKEN_DOUBLE_COLON);
      state = 190;
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
      state = 192;
      match(TOKEN_CONTRACT);
      state = 193;
      identifier(0);
      state = 194;
      match(TOKEN_OPEN_BRACE);
      state = 200;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (((((_la - 74)) & ~0x3f) == 0 && ((1 << (_la - 74)) & 7) != 0)) {
        state = 195;
        varDecl();
        state = 196;
        match(TOKEN_SEMI);
        state = 202;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 208;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 126100789566373888) != 0)) {
        state = 206;
        errorHandler.sync(this);
        switch (tokenStream.LA(1)!) {
        case TOKEN_HOOK:
          state = 203;
          hook();
          break;
        case TOKEN_IMPL:
          state = 204;
          impl();
          break;
        case TOKEN_FUNC:
          state = 205;
          func();
          break;
        default:
          throw NoViableAltException(this);
        }
        state = 210;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 211;
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
      state = 213;
      match(TOKEN_HOOK);
      state = 214;
      identifier(0);
      state = 215;
      match(TOKEN_OPEN_PAREN);
      state = 217;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (((((_la - 44)) & ~0x3f) == 0 && ((1 << (_la - 44)) & 274877939711) != 0)) {
        state = 216;
        params();
      }

      state = 219;
      match(TOKEN_CLOSE_PAREN);
      state = 220;
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
      state = 222;
      match(TOKEN_IMPL);
      state = 223;
      identifier(0);
      state = 224;
      match(TOKEN_OPEN_PAREN);
      state = 226;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (((((_la - 44)) & ~0x3f) == 0 && ((1 << (_la - 44)) & 274877939711) != 0)) {
        state = 225;
        params();
      }

      state = 228;
      match(TOKEN_CLOSE_PAREN);
      state = 229;
      match(TOKEN_ARROW);
      state = 230;
      dataType();
      state = 231;
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
      state = 233;
      match(TOKEN_FUNC);
      state = 234;
      identifier(0);
      state = 235;
      match(TOKEN_OPEN_PAREN);
      state = 237;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (((((_la - 44)) & ~0x3f) == 0 && ((1 << (_la - 44)) & 274877939711) != 0)) {
        state = 236;
        params();
      }

      state = 239;
      match(TOKEN_CLOSE_PAREN);
      state = 240;
      match(TOKEN_ARROW);
      state = 241;
      dataType();
      state = 242;
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
      state = 244;
      param();
      state = 249;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_COMMA) {
        state = 245;
        match(TOKEN_COMMA);
        state = 246;
        param();
        state = 251;
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
      state = 252;
      dataType();
      state = 253;
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
      state = 275;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 15, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 255;
        identifier(0);
        state = 257;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_Q) {
          state = 256;
          match(TOKEN_Q);
        }

        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 259;
        match(TOKEN_LIST);
        state = 260;
        match(TOKEN_LT);
        state = 261;
        dataType();
        state = 262;
        match(TOKEN_GT);
        state = 264;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_Q) {
          state = 263;
          match(TOKEN_Q);
        }

        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 266;
        match(TOKEN_MAP);
        state = 267;
        match(TOKEN_LT);
        state = 268;
        dataType();
        state = 269;
        match(TOKEN_COMMA);
        state = 270;
        dataType();
        state = 271;
        match(TOKEN_GT);
        state = 273;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_Q) {
          state = 272;
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
      state = 287;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_FINAL:
      case TOKEN_CONST:
      case TOKEN_VAR:
        enterOuterAlt(_localctx, 1);
        state = 277;
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
        state = 278;
        assignment();
        break;
      case TOKEN_RETURN:
        enterOuterAlt(_localctx, 3);
        state = 279;
        returnStmt();
        break;
      case TOKEN_BREAK:
        enterOuterAlt(_localctx, 4);
        state = 280;
        breakStmt();
        break;
      case TOKEN_CONTINUE:
        enterOuterAlt(_localctx, 5);
        state = 281;
        continueStmt();
        break;
      case TOKEN_THROW:
        enterOuterAlt(_localctx, 6);
        state = 282;
        throwStmt();
        break;
      case TOKEN_IF:
        enterOuterAlt(_localctx, 7);
        state = 283;
        ifStmt();
        break;
      case TOKEN_WHILE:
        enterOuterAlt(_localctx, 8);
        state = 284;
        whileStmt();
        break;
      case TOKEN_FOR:
        enterOuterAlt(_localctx, 9);
        state = 285;
        forStmt();
        break;
      case TOKEN_TRY:
        enterOuterAlt(_localctx, 10);
        state = 286;
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
      state = 289;
      match(TOKEN_THROW);
      state = 290;
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
      state = 292;
      match(TOKEN_IF);
      state = 293;
      match(TOKEN_OPEN_PAREN);
      state = 294;
      expr();
      state = 295;
      match(TOKEN_CLOSE_PAREN);
      state = 296;
      block();
      state = 298;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 17, context)) {
      case 1:
        state = 297;
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
      state = 300;
      match(TOKEN_ELSE);
      state = 303;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 18, context)) {
      case 1:
        state = 301;
        ifStmt();
        break;
      case 2:
        state = 302;
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
      state = 305;
      match(TOKEN_WHILE);
      state = 306;
      match(TOKEN_OPEN_PAREN);
      state = 307;
      expr();
      state = 308;
      match(TOKEN_CLOSE_PAREN);
      state = 309;
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
      state = 311;
      match(TOKEN_FOR);
      state = 312;
      match(TOKEN_OPEN_PAREN);
      state = 326;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 20, context)) {
      case 1:
        state = 315;
        errorHandler.sync(this);
        switch (tokenStream.LA(1)!) {
        case TOKEN_FINAL:
        case TOKEN_CONST:
        case TOKEN_VAR:
          state = 313;
          varDecl();
          break;
        case TOKEN_IDENT:
          state = 314;
          match(TOKEN_IDENT);
          break;
        default:
          throw NoViableAltException(this);
        }
        state = 317;
        match(TOKEN_SEMI);
        state = 318;
        expr();
        state = 319;
        match(TOKEN_SEMI);
        state = 320;
        assignment();
        break;
      case 2:
        state = 322;
        varDecl();
        state = 323;
        match(TOKEN_IN);
        state = 324;
        expr();
        break;
      }
      state = 328;
      match(TOKEN_CLOSE_PAREN);
      state = 329;
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
      state = 331;
      match(TOKEN_RETURN);
      state = 333;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 576447558734316870) != 0) || ((((_la - 78)) & ~0x3f) == 0 && ((1 << (_la - 78)) & 63) != 0)) {
        state = 332;
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
      state = 335;
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
      state = 337;
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
      state = 339;
      match(TOKEN_TRY);
      state = 340;
      block();
      state = 341;
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
      state = 343;
      match(TOKEN_CATCH);
      state = 344;
      match(TOKEN_OPEN_PAREN);
      state = 345;
      identifier(0);
      state = 346;
      match(TOKEN_CLOSE_PAREN);
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

  LineContext line() {
    dynamic _localctx = LineContext(context, state);
    enterRule(_localctx, 60, RULE_line);
    try {
      state = 356;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 23, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 351;
        errorHandler.sync(this);
        switch (interpreter!.adaptivePredict(tokenStream, 22, context)) {
        case 1:
          state = 349;
          stmt();
          break;
        case 2:
          state = 350;
          expr();
          break;
        }
        state = 353;
        match(TOKEN_SEMI);
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 355;
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
      state = 358;
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
      state = 362;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 24, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 360;
        simpleAssignment();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 361;
        compoundAssignment();
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
      state = 364;
      identifier(0);
      state = 365;
      match(TOKEN_ASSIGN);
      state = 366;
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
      state = 388;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 25, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 368;
        identifier(0);
        state = 369;
        _localctx.op = match(TOKEN_PLUS_ASSIGN);
        state = 370;
        expr();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 372;
        identifier(0);
        state = 373;
        _localctx.op = match(TOKEN_MINUS_ASSIGN);
        state = 374;
        expr();
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 376;
        identifier(0);
        state = 377;
        _localctx.op = match(TOKEN_MULTIPLY_ASSIGN);
        state = 378;
        expr();
        break;
      case 4:
        enterOuterAlt(_localctx, 4);
        state = 380;
        identifier(0);
        state = 381;
        _localctx.op = match(TOKEN_DIVIDE_ASSIGN);
        state = 382;
        expr();
        break;
      case 5:
        enterOuterAlt(_localctx, 5);
        state = 384;
        identifier(0);
        state = 385;
        _localctx.op = match(TOKEN_MOD_ASSIGN);
        state = 386;
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

  VarDeclContext varDecl() {
    dynamic _localctx = VarDeclContext(context, state);
    enterRule(_localctx, 70, RULE_varDecl);
    try {
      state = 400;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 27, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 390;
        varType();
        state = 391;
        dataType();
        state = 392;
        identifier(0);
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 394;
        varType();
        state = 396;
        errorHandler.sync(this);
        switch (interpreter!.adaptivePredict(tokenStream, 26, context)) {
        case 1:
          state = 395;
          dataType();
          break;
        }
        state = 398;
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
    enterRule(_localctx, 72, RULE_expr);
    try {
      enterOuterAlt(_localctx, 1);
      state = 402;
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
    enterRule(_localctx, 74, RULE_logicalExpr);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 404;
      _localctx.left = relationalExpr();
      state = 409;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_AND || _la == TOKEN_OR) {
        state = 405;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!(_la == TOKEN_AND || _la == TOKEN_OR)) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 406;
        _localctx.right = relationalExpr();
        state = 411;
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
    enterRule(_localctx, 76, RULE_relationalExpr);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 412;
      _localctx.left = bitwiseExpr();
      state = 417;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 487424) != 0)) {
        state = 413;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!((((_la) & ~0x3f) == 0 && ((1 << _la) & 487424) != 0))) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 414;
        _localctx.right = bitwiseExpr();
        state = 419;
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
    enterRule(_localctx, 78, RULE_bitwiseExpr);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 420;
      _localctx.left = shiftExpr();
      state = 425;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 469762048) != 0)) {
        state = 421;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!((((_la) & ~0x3f) == 0 && ((1 << _la) & 469762048) != 0))) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 422;
        _localctx.right = shiftExpr();
        state = 427;
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
    enterRule(_localctx, 80, RULE_shiftExpr);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 428;
      _localctx.left = additiveExpr();
      state = 433;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_BIT_LEFT_SHIFT || _la == TOKEN_BIT_RIGHT_SHIFT) {
        state = 429;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!(_la == TOKEN_BIT_LEFT_SHIFT || _la == TOKEN_BIT_RIGHT_SHIFT)) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 430;
        _localctx.right = additiveExpr();
        state = 435;
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
    enterRule(_localctx, 82, RULE_additiveExpr);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 436;
      _localctx.left = multiplicativeExpr();
      state = 441;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_PLUS || _la == TOKEN_MINUS) {
        state = 437;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!(_la == TOKEN_PLUS || _la == TOKEN_MINUS)) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 438;
        _localctx.right = multiplicativeExpr();
        state = 443;
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
    enterRule(_localctx, 84, RULE_multiplicativeExpr);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 444;
      _localctx.left = unaryExpr();
      state = 449;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 56) != 0)) {
        state = 445;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!((((_la) & ~0x3f) == 0 && ((1 << _la) & 56) != 0))) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 446;
        _localctx.right = unaryExpr();
        state = 451;
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
    enterRule(_localctx, 86, RULE_unaryExpr);
    int _la;
    try {
      state = 455;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_PLUS:
      case TOKEN_MINUS:
      case TOKEN_NOT:
      case TOKEN_BIT_NOT:
        enterOuterAlt(_localctx, 1);
        state = 452;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!((((_la) & ~0x3f) == 0 && ((1 << _la) & 570425350) != 0))) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 453;
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
        state = 454;
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
    enterRule(_localctx, 88, RULE_suffixExpr);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 457;
      primaryExpr();
      state = 459;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_PLUS_PLUS || _la == TOKEN_MINUS_MINUS) {
        state = 458;
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
    enterRule(_localctx, 90, RULE_primaryExpr);
    try {
      state = 469;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 36, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 461;
        match(TOKEN_OPEN_PAREN);
        state = 462;
        expr();
        state = 463;
        match(TOKEN_CLOSE_PAREN);
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 465;
        functionCall();
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 466;
        externalFunctionCall();
        break;
      case 4:
        enterOuterAlt(_localctx, 4);
        state = 467;
        literal();
        break;
      case 5:
        enterOuterAlt(_localctx, 5);
        state = 468;
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
    enterRule(_localctx, 92, RULE_externalFunctionCall);
    try {
      enterOuterAlt(_localctx, 1);
      state = 471;
      _localctx.namespace = identifier(0);
      state = 472;
      match(TOKEN_DOUBLE_COLON);
      state = 473;
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
    enterRule(_localctx, 94, RULE_functionCall);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 475;
      _localctx.method = identifier(0);
      state = 476;
      match(TOKEN_OPEN_PAREN);
      state = 478;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 576447558734316870) != 0) || ((((_la - 78)) & ~0x3f) == 0 && ((1 << (_la - 78)) & 63) != 0)) {
        state = 477;
        args();
      }

      state = 480;
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
    enterRule(_localctx, 96, RULE_args);
    int _la;
    try {
      int _alt;
      state = 515;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 42, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 482;
        positionalArg();
        state = 487;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 483;
          match(TOKEN_COMMA);
          state = 484;
          positionalArg();
          state = 489;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 490;
        namedArg();
        state = 495;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 491;
          match(TOKEN_COMMA);
          state = 492;
          namedArg();
          state = 497;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 498;
        positionalArg();
        state = 503;
        errorHandler.sync(this);
        _alt = interpreter!.adaptivePredict(tokenStream, 40, context);
        while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
          if (_alt == 1) {
            state = 499;
            match(TOKEN_COMMA);
            state = 500;
            positionalArg(); 
          }
          state = 505;
          errorHandler.sync(this);
          _alt = interpreter!.adaptivePredict(tokenStream, 40, context);
        }
        state = 506;
        match(TOKEN_COMMA);
        state = 507;
        namedArg();
        state = 512;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 508;
          match(TOKEN_COMMA);
          state = 509;
          namedArg();
          state = 514;
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
    enterRule(_localctx, 98, RULE_namedArg);
    try {
      enterOuterAlt(_localctx, 1);
      state = 517;
      identifier(0);
      state = 518;
      match(TOKEN_COLON);
      state = 519;
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
    enterRule(_localctx, 100, RULE_positionalArg);
    try {
      enterOuterAlt(_localctx, 1);
      state = 521;
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
    enterRule(_localctx, 102, RULE_literal);
    try {
      state = 531;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_INT:
        enterOuterAlt(_localctx, 1);
        state = 523;
        match(TOKEN_INT);
        break;
      case TOKEN_DOUBLE:
        enterOuterAlt(_localctx, 2);
        state = 524;
        match(TOKEN_DOUBLE);
        break;
      case TOKEN_BOOL:
        enterOuterAlt(_localctx, 3);
        state = 525;
        match(TOKEN_BOOL);
        break;
      case TOKEN_STRING:
        enterOuterAlt(_localctx, 4);
        state = 526;
        match(TOKEN_STRING);
        break;
      case TOKEN_NULL:
        enterOuterAlt(_localctx, 5);
        state = 527;
        match(TOKEN_NULL);
        break;
      case TOKEN_OPEN_BRACKET:
        enterOuterAlt(_localctx, 6);
        state = 528;
        arrayLiteral();
        break;
      case TOKEN_OPEN_BRACE:
        enterOuterAlt(_localctx, 7);
        state = 529;
        mapLiteral();
        break;
      case TOKEN_AT:
        enterOuterAlt(_localctx, 8);
        state = 530;
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
    var _startState = 104;
    enterRecursionRule(_localctx, 104, RULE_identifier, _p);
    try {
      int _alt;
      enterOuterAlt(_localctx, 1);
      state = 550;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_IDENT:
        state = 534;
        _localctx.ident = match(TOKEN_IDENT);
        break;
      case TOKEN_AUTHOR:
        state = 535;
        _localctx.ident = match(TOKEN_AUTHOR);
        break;
      case TOKEN_NAME:
        state = 536;
        _localctx.ident = match(TOKEN_NAME);
        break;
      case TOKEN_DESCRIPTION:
        state = 537;
        _localctx.ident = match(TOKEN_DESCRIPTION);
        break;
      case TOKEN_VERSION:
        state = 538;
        _localctx.ident = match(TOKEN_VERSION);
        break;
      case TOKEN_LICENSE:
        state = 539;
        _localctx.ident = match(TOKEN_LICENSE);
        break;
      case TOKEN_REPO:
        state = 540;
        _localctx.ident = match(TOKEN_REPO);
        break;
      case TOKEN_WEBSITE:
        state = 541;
        _localctx.ident = match(TOKEN_WEBSITE);
        break;
      case TOKEN_PERMISSIONS:
        state = 542;
        _localctx.ident = match(TOKEN_PERMISSIONS);
        break;
      case TOKEN_CONTRACT:
        state = 543;
        _localctx.ident = match(TOKEN_CONTRACT);
        break;
      case TOKEN_IMPL:
        state = 544;
        _localctx.ident = match(TOKEN_IMPL);
        break;
      case TOKEN_HOOK:
        state = 545;
        _localctx.ident = match(TOKEN_HOOK);
        break;
      case TOKEN_FUNC:
        state = 546;
        _localctx.ident = match(TOKEN_FUNC);
        break;
      case TOKEN_LIST:
        state = 547;
        _localctx.ident = match(TOKEN_LIST);
        break;
      case TOKEN_MAP:
        state = 548;
        _localctx.ident = match(TOKEN_MAP);
        break;
      case TOKEN_SCHEMA:
        state = 549;
        _localctx.ident = match(TOKEN_SCHEMA);
        break;
      default:
        throw NoViableAltException(this);
      }
      state = 554;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 45, context)) {
      case 1:
        state = 552;
        _localctx.nullAware = match(TOKEN_NOT);
        break;
      case 2:
        state = 553;
        _localctx.allowNull = match(TOKEN_Q);
        break;
      }
      context!.stop = tokenStream.LT(-1);
      state = 569;
      errorHandler.sync(this);
      _alt = interpreter!.adaptivePredict(tokenStream, 48, context);
      while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
        if (_alt == 1) {
          if (parseListeners != null) triggerExitRuleEvent();
          _prevctx = _localctx;
          state = 567;
          errorHandler.sync(this);
          switch (interpreter!.adaptivePredict(tokenStream, 47, context)) {
          case 1:
            _localctx = IdentifierContext(_parentctx, _parentState);
            _localctx.objIdent = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_identifier);
            state = 556;
            if (!(precpred(context, 1))) {
              throw FailedPredicateException(this, "precpred(context, 1)");
            }
            state = 557;
            match(TOKEN_DOT);
            state = 558;
            _localctx.property = identifier(2);
            break;
          case 2:
            _localctx = IdentifierContext(_parentctx, _parentState);
            _localctx.indexIdent = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_identifier);
            state = 559;
            if (!(precpred(context, 2))) {
              throw FailedPredicateException(this, "precpred(context, 2)");
            }
            state = 560;
            match(TOKEN_OPEN_BRACKET);
            state = 561;
            _localctx.index = expr();
            state = 562;
            match(TOKEN_CLOSE_BRACKET);
            state = 565;
            errorHandler.sync(this);
            switch (interpreter!.adaptivePredict(tokenStream, 46, context)) {
            case 1:
              state = 563;
              _localctx.nullAware = match(TOKEN_NOT);
              break;
            case 2:
              state = 564;
              _localctx.allowNull = match(TOKEN_Q);
              break;
            }
            break;
          } 
        }
        state = 571;
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
    enterRule(_localctx, 106, RULE_arrayLiteral);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 572;
      match(TOKEN_OPEN_BRACKET);
      state = 581;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 576447558734316870) != 0) || ((((_la - 78)) & ~0x3f) == 0 && ((1 << (_la - 78)) & 63) != 0)) {
        state = 573;
        expr();
        state = 578;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 574;
          match(TOKEN_COMMA);
          state = 575;
          expr();
          state = 580;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
      }

      state = 583;
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
    enterRule(_localctx, 108, RULE_objectLiteral);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 585;
      match(TOKEN_AT);
      state = 586;
      identifier(0);
      state = 587;
      match(TOKEN_OPEN_BRACE);
      state = 596;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (((((_la - 44)) & ~0x3f) == 0 && ((1 << (_la - 44)) & 274877939711) != 0)) {
        state = 588;
        objectProperty();
        state = 593;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 589;
          match(TOKEN_COMMA);
          state = 590;
          objectProperty();
          state = 595;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
      }

      state = 598;
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
    enterRule(_localctx, 110, RULE_objectProperty);
    try {
      enterOuterAlt(_localctx, 1);
      state = 600;
      identifier(0);
      state = 601;
      match(TOKEN_COLON);
      state = 602;
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
    enterRule(_localctx, 112, RULE_mapLiteral);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 604;
      match(TOKEN_OPEN_BRACE);
      state = 613;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 576447558734316870) != 0) || ((((_la - 78)) & ~0x3f) == 0 && ((1 << (_la - 78)) & 63) != 0)) {
        state = 605;
        mapEntry();
        state = 610;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 606;
          match(TOKEN_COMMA);
          state = 607;
          mapEntry();
          state = 612;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
      }

      state = 615;
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
    enterRule(_localctx, 114, RULE_mapEntry);
    try {
      enterOuterAlt(_localctx, 1);
      state = 617;
      _localctx.key = expr();
      state = 618;
      match(TOKEN_COLON);
      state = 619;
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
    enterRule(_localctx, 116, RULE_block);
    int _la;
    try {
      state = 634;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_OPEN_BRACE:
        enterOuterAlt(_localctx, 1);
        state = 621;
        match(TOKEN_OPEN_BRACE);
        state = 625;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 8070437338678822214) != 0) || ((((_la - 65)) & ~0x3f) == 0 && ((1 << (_la - 65)) & 520135) != 0)) {
          state = 622;
          line();
          state = 627;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        state = 628;
        match(TOKEN_CLOSE_BRACE);
        break;
      case TOKEN_IF:
        enterOuterAlt(_localctx, 2);
        state = 629;
        ifStmt();
        break;
      case TOKEN_WHILE:
        enterOuterAlt(_localctx, 3);
        state = 630;
        whileStmt();
        break;
      case TOKEN_FOR:
        enterOuterAlt(_localctx, 4);
        state = 631;
        forStmt();
        break;
      case TOKEN_TRY:
        enterOuterAlt(_localctx, 5);
        state = 632;
        tryStmt();
        break;
      case TOKEN_CATCH:
        enterOuterAlt(_localctx, 6);
        state = 633;
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
    case 52:
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
      4,1,86,637,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,
      2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,2,
      14,7,14,2,15,7,15,2,16,7,16,2,17,7,17,2,18,7,18,2,19,7,19,2,20,7,20,
      2,21,7,21,2,22,7,22,2,23,7,23,2,24,7,24,2,25,7,25,2,26,7,26,2,27,7,
      27,2,28,7,28,2,29,7,29,2,30,7,30,2,31,7,31,2,32,7,32,2,33,7,33,2,34,
      7,34,2,35,7,35,2,36,7,36,2,37,7,37,2,38,7,38,2,39,7,39,2,40,7,40,2,
      41,7,41,2,42,7,42,2,43,7,43,2,44,7,44,2,45,7,45,2,46,7,46,2,47,7,47,
      2,48,7,48,2,49,7,49,2,50,7,50,2,51,7,51,2,52,7,52,2,53,7,53,2,54,7,
      54,2,55,7,55,2,56,7,56,2,57,7,57,2,58,7,58,1,0,3,0,120,8,0,1,0,5,0,
      123,8,0,10,0,12,0,126,9,0,1,0,5,0,129,8,0,10,0,12,0,132,9,0,1,0,1,
      0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,1,144,8,1,1,2,1,2,1,2,1,2,1,3,
      1,3,1,3,1,3,1,4,1,4,1,4,1,4,1,5,1,5,1,5,1,5,1,6,1,6,1,6,1,6,1,7,1,
      7,1,7,1,7,1,8,1,8,1,8,1,8,1,9,1,9,1,9,1,9,1,10,1,10,1,10,1,10,5,10,
      182,8,10,10,10,12,10,185,9,10,1,10,1,10,1,11,1,11,1,11,1,11,1,12,1,
      12,1,12,1,12,1,12,1,12,5,12,199,8,12,10,12,12,12,202,9,12,1,12,1,12,
      1,12,5,12,207,8,12,10,12,12,12,210,9,12,1,12,1,12,1,13,1,13,1,13,1,
      13,3,13,218,8,13,1,13,1,13,1,13,1,14,1,14,1,14,1,14,3,14,227,8,14,
      1,14,1,14,1,14,1,14,1,14,1,15,1,15,1,15,1,15,3,15,238,8,15,1,15,1,
      15,1,15,1,15,1,15,1,16,1,16,1,16,5,16,248,8,16,10,16,12,16,251,9,16,
      1,17,1,17,1,17,1,18,1,18,3,18,258,8,18,1,18,1,18,1,18,1,18,1,18,3,
      18,265,8,18,1,18,1,18,1,18,1,18,1,18,1,18,1,18,3,18,274,8,18,3,18,
      276,8,18,1,19,1,19,1,19,1,19,1,19,1,19,1,19,1,19,1,19,1,19,3,19,288,
      8,19,1,20,1,20,1,20,1,21,1,21,1,21,1,21,1,21,1,21,3,21,299,8,21,1,
      22,1,22,1,22,3,22,304,8,22,1,23,1,23,1,23,1,23,1,23,1,23,1,24,1,24,
      1,24,1,24,3,24,316,8,24,1,24,1,24,1,24,1,24,1,24,1,24,1,24,1,24,1,
      24,3,24,327,8,24,1,24,1,24,1,24,1,25,1,25,3,25,334,8,25,1,26,1,26,
      1,27,1,27,1,28,1,28,1,28,1,28,1,29,1,29,1,29,1,29,1,29,1,29,1,30,1,
      30,3,30,352,8,30,1,30,1,30,1,30,3,30,357,8,30,1,31,1,31,1,32,1,32,
      3,32,363,8,32,1,33,1,33,1,33,1,33,1,34,1,34,1,34,1,34,1,34,1,34,1,
      34,1,34,1,34,1,34,1,34,1,34,1,34,1,34,1,34,1,34,1,34,1,34,1,34,1,34,
      3,34,389,8,34,1,35,1,35,1,35,1,35,1,35,1,35,3,35,397,8,35,1,35,1,35,
      3,35,401,8,35,1,36,1,36,1,37,1,37,1,37,5,37,408,8,37,10,37,12,37,411,
      9,37,1,38,1,38,1,38,5,38,416,8,38,10,38,12,38,419,9,38,1,39,1,39,1,
      39,5,39,424,8,39,10,39,12,39,427,9,39,1,40,1,40,1,40,5,40,432,8,40,
      10,40,12,40,435,9,40,1,41,1,41,1,41,5,41,440,8,41,10,41,12,41,443,
      9,41,1,42,1,42,1,42,5,42,448,8,42,10,42,12,42,451,9,42,1,43,1,43,1,
      43,3,43,456,8,43,1,44,1,44,3,44,460,8,44,1,45,1,45,1,45,1,45,1,45,
      1,45,1,45,1,45,3,45,470,8,45,1,46,1,46,1,46,1,46,1,47,1,47,1,47,3,
      47,479,8,47,1,47,1,47,1,48,1,48,1,48,5,48,486,8,48,10,48,12,48,489,
      9,48,1,48,1,48,1,48,5,48,494,8,48,10,48,12,48,497,9,48,1,48,1,48,1,
      48,5,48,502,8,48,10,48,12,48,505,9,48,1,48,1,48,1,48,1,48,5,48,511,
      8,48,10,48,12,48,514,9,48,3,48,516,8,48,1,49,1,49,1,49,1,49,1,50,1,
      50,1,51,1,51,1,51,1,51,1,51,1,51,1,51,1,51,3,51,532,8,51,1,52,1,52,
      1,52,1,52,1,52,1,52,1,52,1,52,1,52,1,52,1,52,1,52,1,52,1,52,1,52,1,
      52,1,52,3,52,551,8,52,1,52,1,52,3,52,555,8,52,1,52,1,52,1,52,1,52,
      1,52,1,52,1,52,1,52,1,52,3,52,566,8,52,5,52,568,8,52,10,52,12,52,571,
      9,52,1,53,1,53,1,53,1,53,5,53,577,8,53,10,53,12,53,580,9,53,3,53,582,
      8,53,1,53,1,53,1,54,1,54,1,54,1,54,1,54,1,54,5,54,592,8,54,10,54,12,
      54,595,9,54,3,54,597,8,54,1,54,1,54,1,55,1,55,1,55,1,55,1,56,1,56,
      1,56,1,56,5,56,609,8,56,10,56,12,56,612,9,56,3,56,614,8,56,1,56,1,
      56,1,57,1,57,1,57,1,57,1,58,1,58,5,58,624,8,58,10,58,12,58,627,9,58,
      1,58,1,58,1,58,1,58,1,58,1,58,3,58,635,8,58,1,58,0,1,104,59,0,2,4,
      6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,
      52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,
      96,98,100,102,104,106,108,110,112,114,116,0,9,1,0,74,76,1,0,23,24,
      2,0,12,14,16,18,1,0,26,28,1,0,30,31,1,0,1,2,1,0,3,5,3,0,1,2,25,25,
      29,29,1,0,40,41,682,0,119,1,0,0,0,2,143,1,0,0,0,4,145,1,0,0,0,6,149,
      1,0,0,0,8,153,1,0,0,0,10,157,1,0,0,0,12,161,1,0,0,0,14,165,1,0,0,0,
      16,169,1,0,0,0,18,173,1,0,0,0,20,177,1,0,0,0,22,188,1,0,0,0,24,192,
      1,0,0,0,26,213,1,0,0,0,28,222,1,0,0,0,30,233,1,0,0,0,32,244,1,0,0,
      0,34,252,1,0,0,0,36,275,1,0,0,0,38,287,1,0,0,0,40,289,1,0,0,0,42,292,
      1,0,0,0,44,300,1,0,0,0,46,305,1,0,0,0,48,311,1,0,0,0,50,331,1,0,0,
      0,52,335,1,0,0,0,54,337,1,0,0,0,56,339,1,0,0,0,58,343,1,0,0,0,60,356,
      1,0,0,0,62,358,1,0,0,0,64,362,1,0,0,0,66,364,1,0,0,0,68,388,1,0,0,
      0,70,400,1,0,0,0,72,402,1,0,0,0,74,404,1,0,0,0,76,412,1,0,0,0,78,420,
      1,0,0,0,80,428,1,0,0,0,82,436,1,0,0,0,84,444,1,0,0,0,86,455,1,0,0,
      0,88,457,1,0,0,0,90,469,1,0,0,0,92,471,1,0,0,0,94,475,1,0,0,0,96,515,
      1,0,0,0,98,517,1,0,0,0,100,521,1,0,0,0,102,531,1,0,0,0,104,533,1,0,
      0,0,106,572,1,0,0,0,108,585,1,0,0,0,110,600,1,0,0,0,112,604,1,0,0,
      0,114,617,1,0,0,0,116,634,1,0,0,0,118,120,3,4,2,0,119,118,1,0,0,0,
      119,120,1,0,0,0,120,124,1,0,0,0,121,123,3,2,1,0,122,121,1,0,0,0,123,
      126,1,0,0,0,124,122,1,0,0,0,124,125,1,0,0,0,125,130,1,0,0,0,126,124,
      1,0,0,0,127,129,3,20,10,0,128,127,1,0,0,0,129,132,1,0,0,0,130,128,
      1,0,0,0,130,131,1,0,0,0,131,133,1,0,0,0,132,130,1,0,0,0,133,134,3,
      24,12,0,134,135,5,0,0,1,135,1,1,0,0,0,136,144,3,18,9,0,137,144,3,8,
      4,0,138,144,3,6,3,0,139,144,3,10,5,0,140,144,3,12,6,0,141,144,3,14,
      7,0,142,144,3,16,8,0,143,136,1,0,0,0,143,137,1,0,0,0,143,138,1,0,0,
      0,143,139,1,0,0,0,143,140,1,0,0,0,143,141,1,0,0,0,143,142,1,0,0,0,
      144,3,1,0,0,0,145,146,5,44,0,0,146,147,5,83,0,0,147,148,5,22,0,0,148,
      5,1,0,0,0,149,150,5,45,0,0,150,151,5,83,0,0,151,152,5,22,0,0,152,7,
      1,0,0,0,153,154,5,46,0,0,154,155,5,83,0,0,155,156,5,22,0,0,156,9,1,
      0,0,0,157,158,5,47,0,0,158,159,5,77,0,0,159,160,5,22,0,0,160,11,1,
      0,0,0,161,162,5,48,0,0,162,163,5,83,0,0,163,164,5,22,0,0,164,13,1,
      0,0,0,165,166,5,49,0,0,166,167,5,83,0,0,167,168,5,22,0,0,168,15,1,
      0,0,0,169,170,5,50,0,0,170,171,5,83,0,0,171,172,5,22,0,0,172,17,1,
      0,0,0,173,174,5,51,0,0,174,175,5,83,0,0,175,176,5,22,0,0,176,19,1,
      0,0,0,177,178,5,52,0,0,178,183,3,22,11,0,179,180,5,21,0,0,180,182,
      3,22,11,0,181,179,1,0,0,0,182,185,1,0,0,0,183,181,1,0,0,0,183,184,
      1,0,0,0,184,186,1,0,0,0,185,183,1,0,0,0,186,187,5,22,0,0,187,21,1,
      0,0,0,188,189,3,104,52,0,189,190,5,20,0,0,190,191,3,104,52,0,191,23,
      1,0,0,0,192,193,5,53,0,0,193,194,3,104,52,0,194,200,5,8,0,0,195,196,
      3,70,35,0,196,197,5,22,0,0,197,199,1,0,0,0,198,195,1,0,0,0,199,202,
      1,0,0,0,200,198,1,0,0,0,200,201,1,0,0,0,201,208,1,0,0,0,202,200,1,
      0,0,0,203,207,3,26,13,0,204,207,3,28,14,0,205,207,3,30,15,0,206,203,
      1,0,0,0,206,204,1,0,0,0,206,205,1,0,0,0,207,210,1,0,0,0,208,206,1,
      0,0,0,208,209,1,0,0,0,209,211,1,0,0,0,210,208,1,0,0,0,211,212,5,9,
      0,0,212,25,1,0,0,0,213,214,5,55,0,0,214,215,3,104,52,0,215,217,5,6,
      0,0,216,218,3,32,16,0,217,216,1,0,0,0,217,218,1,0,0,0,218,219,1,0,
      0,0,219,220,5,7,0,0,220,221,3,116,58,0,221,27,1,0,0,0,222,223,5,54,
      0,0,223,224,3,104,52,0,224,226,5,6,0,0,225,227,3,32,16,0,226,225,1,
      0,0,0,226,227,1,0,0,0,227,228,1,0,0,0,228,229,5,7,0,0,229,230,5,32,
      0,0,230,231,3,36,18,0,231,232,3,116,58,0,232,29,1,0,0,0,233,234,5,
      56,0,0,234,235,3,104,52,0,235,237,5,6,0,0,236,238,3,32,16,0,237,236,
      1,0,0,0,237,238,1,0,0,0,238,239,1,0,0,0,239,240,5,7,0,0,240,241,5,
      32,0,0,241,242,3,36,18,0,242,243,3,116,58,0,243,31,1,0,0,0,244,249,
      3,34,17,0,245,246,5,21,0,0,246,248,3,34,17,0,247,245,1,0,0,0,248,251,
      1,0,0,0,249,247,1,0,0,0,249,250,1,0,0,0,250,33,1,0,0,0,251,249,1,0,
      0,0,252,253,3,36,18,0,253,254,3,104,52,0,254,35,1,0,0,0,255,257,3,
      104,52,0,256,258,5,33,0,0,257,256,1,0,0,0,257,258,1,0,0,0,258,276,
      1,0,0,0,259,260,5,57,0,0,260,261,5,13,0,0,261,262,3,36,18,0,262,264,
      5,12,0,0,263,265,5,33,0,0,264,263,1,0,0,0,264,265,1,0,0,0,265,276,
      1,0,0,0,266,267,5,58,0,0,267,268,5,13,0,0,268,269,3,36,18,0,269,270,
      5,21,0,0,270,271,3,36,18,0,271,273,5,12,0,0,272,274,5,33,0,0,273,272,
      1,0,0,0,273,274,1,0,0,0,274,276,1,0,0,0,275,255,1,0,0,0,275,259,1,
      0,0,0,275,266,1,0,0,0,276,37,1,0,0,0,277,288,3,70,35,0,278,288,3,64,
      32,0,279,288,3,50,25,0,280,288,3,52,26,0,281,288,3,54,27,0,282,288,
      3,40,20,0,283,288,3,42,21,0,284,288,3,46,23,0,285,288,3,48,24,0,286,
      288,3,56,28,0,287,277,1,0,0,0,287,278,1,0,0,0,287,279,1,0,0,0,287,
      280,1,0,0,0,287,281,1,0,0,0,287,282,1,0,0,0,287,283,1,0,0,0,287,284,
      1,0,0,0,287,285,1,0,0,0,287,286,1,0,0,0,288,39,1,0,0,0,289,290,5,73,
      0,0,290,291,3,72,36,0,291,41,1,0,0,0,292,293,5,59,0,0,293,294,5,6,
      0,0,294,295,3,72,36,0,295,296,5,7,0,0,296,298,3,116,58,0,297,299,3,
      44,22,0,298,297,1,0,0,0,298,299,1,0,0,0,299,43,1,0,0,0,300,303,5,60,
      0,0,301,304,3,42,21,0,302,304,3,116,58,0,303,301,1,0,0,0,303,302,1,
      0,0,0,304,45,1,0,0,0,305,306,5,61,0,0,306,307,5,6,0,0,307,308,3,72,
      36,0,308,309,5,7,0,0,309,310,3,116,58,0,310,47,1,0,0,0,311,312,5,62,
      0,0,312,326,5,6,0,0,313,316,3,70,35,0,314,316,5,82,0,0,315,313,1,0,
      0,0,315,314,1,0,0,0,316,317,1,0,0,0,317,318,5,22,0,0,318,319,3,72,
      36,0,319,320,5,22,0,0,320,321,3,64,32,0,321,327,1,0,0,0,322,323,3,
      70,35,0,323,324,5,63,0,0,324,325,3,72,36,0,325,327,1,0,0,0,326,315,
      1,0,0,0,326,322,1,0,0,0,327,328,1,0,0,0,328,329,5,7,0,0,329,330,3,
      116,58,0,330,49,1,0,0,0,331,333,5,65,0,0,332,334,3,72,36,0,333,332,
      1,0,0,0,333,334,1,0,0,0,334,51,1,0,0,0,335,336,5,66,0,0,336,53,1,0,
      0,0,337,338,5,67,0,0,338,55,1,0,0,0,339,340,5,71,0,0,340,341,3,116,
      58,0,341,342,3,58,29,0,342,57,1,0,0,0,343,344,5,72,0,0,344,345,5,6,
      0,0,345,346,3,104,52,0,346,347,5,7,0,0,347,348,3,116,58,0,348,59,1,
      0,0,0,349,352,3,38,19,0,350,352,3,72,36,0,351,349,1,0,0,0,351,350,
      1,0,0,0,352,353,1,0,0,0,353,354,5,22,0,0,354,357,1,0,0,0,355,357,3,
      116,58,0,356,351,1,0,0,0,356,355,1,0,0,0,357,61,1,0,0,0,358,359,7,
      0,0,0,359,63,1,0,0,0,360,363,3,66,33,0,361,363,3,68,34,0,362,360,1,
      0,0,0,362,361,1,0,0,0,363,65,1,0,0,0,364,365,3,104,52,0,365,366,5,
      15,0,0,366,367,3,72,36,0,367,67,1,0,0,0,368,369,3,104,52,0,369,370,
      5,35,0,0,370,371,3,72,36,0,371,389,1,0,0,0,372,373,3,104,52,0,373,
      374,5,36,0,0,374,375,3,72,36,0,375,389,1,0,0,0,376,377,3,104,52,0,
      377,378,5,37,0,0,378,379,3,72,36,0,379,389,1,0,0,0,380,381,3,104,52,
      0,381,382,5,38,0,0,382,383,3,72,36,0,383,389,1,0,0,0,384,385,3,104,
      52,0,385,386,5,39,0,0,386,387,3,72,36,0,387,389,1,0,0,0,388,368,1,
      0,0,0,388,372,1,0,0,0,388,376,1,0,0,0,388,380,1,0,0,0,388,384,1,0,
      0,0,389,69,1,0,0,0,390,391,3,62,31,0,391,392,3,36,18,0,392,393,3,104,
      52,0,393,401,1,0,0,0,394,396,3,62,31,0,395,397,3,36,18,0,396,395,1,
      0,0,0,396,397,1,0,0,0,397,398,1,0,0,0,398,399,3,64,32,0,399,401,1,
      0,0,0,400,390,1,0,0,0,400,394,1,0,0,0,401,71,1,0,0,0,402,403,3,74,
      37,0,403,73,1,0,0,0,404,409,3,76,38,0,405,406,7,1,0,0,406,408,3,76,
      38,0,407,405,1,0,0,0,408,411,1,0,0,0,409,407,1,0,0,0,409,410,1,0,0,
      0,410,75,1,0,0,0,411,409,1,0,0,0,412,417,3,78,39,0,413,414,7,2,0,0,
      414,416,3,78,39,0,415,413,1,0,0,0,416,419,1,0,0,0,417,415,1,0,0,0,
      417,418,1,0,0,0,418,77,1,0,0,0,419,417,1,0,0,0,420,425,3,80,40,0,421,
      422,7,3,0,0,422,424,3,80,40,0,423,421,1,0,0,0,424,427,1,0,0,0,425,
      423,1,0,0,0,425,426,1,0,0,0,426,79,1,0,0,0,427,425,1,0,0,0,428,433,
      3,82,41,0,429,430,7,4,0,0,430,432,3,82,41,0,431,429,1,0,0,0,432,435,
      1,0,0,0,433,431,1,0,0,0,433,434,1,0,0,0,434,81,1,0,0,0,435,433,1,0,
      0,0,436,441,3,84,42,0,437,438,7,5,0,0,438,440,3,84,42,0,439,437,1,
      0,0,0,440,443,1,0,0,0,441,439,1,0,0,0,441,442,1,0,0,0,442,83,1,0,0,
      0,443,441,1,0,0,0,444,449,3,86,43,0,445,446,7,6,0,0,446,448,3,86,43,
      0,447,445,1,0,0,0,448,451,1,0,0,0,449,447,1,0,0,0,449,450,1,0,0,0,
      450,85,1,0,0,0,451,449,1,0,0,0,452,453,7,7,0,0,453,456,3,86,43,0,454,
      456,3,88,44,0,455,452,1,0,0,0,455,454,1,0,0,0,456,87,1,0,0,0,457,459,
      3,90,45,0,458,460,7,8,0,0,459,458,1,0,0,0,459,460,1,0,0,0,460,89,1,
      0,0,0,461,462,5,6,0,0,462,463,3,72,36,0,463,464,5,7,0,0,464,470,1,
      0,0,0,465,470,3,94,47,0,466,470,3,92,46,0,467,470,3,102,51,0,468,470,
      3,104,52,0,469,461,1,0,0,0,469,465,1,0,0,0,469,466,1,0,0,0,469,467,
      1,0,0,0,469,468,1,0,0,0,470,91,1,0,0,0,471,472,3,104,52,0,472,473,
      5,20,0,0,473,474,3,94,47,0,474,93,1,0,0,0,475,476,3,104,52,0,476,478,
      5,6,0,0,477,479,3,96,48,0,478,477,1,0,0,0,478,479,1,0,0,0,479,480,
      1,0,0,0,480,481,5,7,0,0,481,95,1,0,0,0,482,487,3,100,50,0,483,484,
      5,21,0,0,484,486,3,100,50,0,485,483,1,0,0,0,486,489,1,0,0,0,487,485,
      1,0,0,0,487,488,1,0,0,0,488,516,1,0,0,0,489,487,1,0,0,0,490,495,3,
      98,49,0,491,492,5,21,0,0,492,494,3,98,49,0,493,491,1,0,0,0,494,497,
      1,0,0,0,495,493,1,0,0,0,495,496,1,0,0,0,496,516,1,0,0,0,497,495,1,
      0,0,0,498,503,3,100,50,0,499,500,5,21,0,0,500,502,3,100,50,0,501,499,
      1,0,0,0,502,505,1,0,0,0,503,501,1,0,0,0,503,504,1,0,0,0,504,506,1,
      0,0,0,505,503,1,0,0,0,506,507,5,21,0,0,507,512,3,98,49,0,508,509,5,
      21,0,0,509,511,3,98,49,0,510,508,1,0,0,0,511,514,1,0,0,0,512,510,1,
      0,0,0,512,513,1,0,0,0,513,516,1,0,0,0,514,512,1,0,0,0,515,482,1,0,
      0,0,515,490,1,0,0,0,515,498,1,0,0,0,516,97,1,0,0,0,517,518,3,104,52,
      0,518,519,5,19,0,0,519,520,3,72,36,0,520,99,1,0,0,0,521,522,3,72,36,
      0,522,101,1,0,0,0,523,532,5,80,0,0,524,532,5,81,0,0,525,532,5,78,0,
      0,526,532,5,83,0,0,527,532,5,79,0,0,528,532,3,106,53,0,529,532,3,112,
      56,0,530,532,3,108,54,0,531,523,1,0,0,0,531,524,1,0,0,0,531,525,1,
      0,0,0,531,526,1,0,0,0,531,527,1,0,0,0,531,528,1,0,0,0,531,529,1,0,
      0,0,531,530,1,0,0,0,532,103,1,0,0,0,533,550,6,52,-1,0,534,551,5,82,
      0,0,535,551,5,45,0,0,536,551,5,51,0,0,537,551,5,46,0,0,538,551,5,47,
      0,0,539,551,5,48,0,0,540,551,5,49,0,0,541,551,5,50,0,0,542,551,5,52,
      0,0,543,551,5,53,0,0,544,551,5,54,0,0,545,551,5,55,0,0,546,551,5,56,
      0,0,547,551,5,57,0,0,548,551,5,58,0,0,549,551,5,44,0,0,550,534,1,0,
      0,0,550,535,1,0,0,0,550,536,1,0,0,0,550,537,1,0,0,0,550,538,1,0,0,
      0,550,539,1,0,0,0,550,540,1,0,0,0,550,541,1,0,0,0,550,542,1,0,0,0,
      550,543,1,0,0,0,550,544,1,0,0,0,550,545,1,0,0,0,550,546,1,0,0,0,550,
      547,1,0,0,0,550,548,1,0,0,0,550,549,1,0,0,0,551,554,1,0,0,0,552,555,
      5,25,0,0,553,555,5,33,0,0,554,552,1,0,0,0,554,553,1,0,0,0,554,555,
      1,0,0,0,555,569,1,0,0,0,556,557,10,1,0,0,557,558,5,34,0,0,558,568,
      3,104,52,2,559,560,10,2,0,0,560,561,5,10,0,0,561,562,3,72,36,0,562,
      565,5,11,0,0,563,566,5,25,0,0,564,566,5,33,0,0,565,563,1,0,0,0,565,
      564,1,0,0,0,565,566,1,0,0,0,566,568,1,0,0,0,567,556,1,0,0,0,567,559,
      1,0,0,0,568,571,1,0,0,0,569,567,1,0,0,0,569,570,1,0,0,0,570,105,1,
      0,0,0,571,569,1,0,0,0,572,581,5,10,0,0,573,578,3,72,36,0,574,575,5,
      21,0,0,575,577,3,72,36,0,576,574,1,0,0,0,577,580,1,0,0,0,578,576,1,
      0,0,0,578,579,1,0,0,0,579,582,1,0,0,0,580,578,1,0,0,0,581,573,1,0,
      0,0,581,582,1,0,0,0,582,583,1,0,0,0,583,584,5,11,0,0,584,107,1,0,0,
      0,585,586,5,42,0,0,586,587,3,104,52,0,587,596,5,8,0,0,588,593,3,110,
      55,0,589,590,5,21,0,0,590,592,3,110,55,0,591,589,1,0,0,0,592,595,1,
      0,0,0,593,591,1,0,0,0,593,594,1,0,0,0,594,597,1,0,0,0,595,593,1,0,
      0,0,596,588,1,0,0,0,596,597,1,0,0,0,597,598,1,0,0,0,598,599,5,9,0,
      0,599,109,1,0,0,0,600,601,3,104,52,0,601,602,5,19,0,0,602,603,3,72,
      36,0,603,111,1,0,0,0,604,613,5,8,0,0,605,610,3,114,57,0,606,607,5,
      21,0,0,607,609,3,114,57,0,608,606,1,0,0,0,609,612,1,0,0,0,610,608,
      1,0,0,0,610,611,1,0,0,0,611,614,1,0,0,0,612,610,1,0,0,0,613,605,1,
      0,0,0,613,614,1,0,0,0,614,615,1,0,0,0,615,616,5,9,0,0,616,113,1,0,
      0,0,617,618,3,72,36,0,618,619,5,19,0,0,619,620,3,72,36,0,620,115,1,
      0,0,0,621,625,5,8,0,0,622,624,3,60,30,0,623,622,1,0,0,0,624,627,1,
      0,0,0,625,623,1,0,0,0,625,626,1,0,0,0,626,628,1,0,0,0,627,625,1,0,
      0,0,628,635,5,9,0,0,629,635,3,42,21,0,630,635,3,46,23,0,631,635,3,
      48,24,0,632,635,3,56,28,0,633,635,3,58,29,0,634,621,1,0,0,0,634,629,
      1,0,0,0,634,630,1,0,0,0,634,631,1,0,0,0,634,632,1,0,0,0,634,633,1,
      0,0,0,635,117,1,0,0,0,57,119,124,130,143,183,200,206,208,217,226,237,
      249,257,264,273,275,287,298,303,315,326,333,351,356,362,388,396,400,
      409,417,425,433,441,449,455,459,469,478,487,495,503,512,515,531,550,
      554,565,567,569,578,581,593,596,610,613,625,634
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

