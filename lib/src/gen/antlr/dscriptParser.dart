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
      state = 247;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 10, context)) {
      case 1:
        state = 236;
        _localctx.pos = params();
        state = 237;
        match(TOKEN_COMMA);

        state = 238;
        match(TOKEN_OPEN_BRACE);
        state = 239;
        _localctx.named = params();
        state = 240;
        match(TOKEN_CLOSE_BRACE);
        break;
      case 2:
        state = 242;
        _localctx.pos = params();
        break;
      case 3:
        state = 243;
        match(TOKEN_OPEN_BRACE);
        state = 244;
        _localctx.named = params();
        state = 245;
        match(TOKEN_CLOSE_BRACE);
        break;
      }
      state = 249;
      match(TOKEN_CLOSE_PAREN);
      state = 252;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_ARROW) {
        state = 250;
        match(TOKEN_ARROW);
        state = 251;
        dataType();
      }

      state = 254;
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
    try {
      int _alt;
      enterOuterAlt(_localctx, 1);
      state = 256;
      param();
      state = 261;
      errorHandler.sync(this);
      _alt = interpreter!.adaptivePredict(tokenStream, 12, context);
      while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
        if (_alt == 1) {
          state = 257;
          match(TOKEN_COMMA);
          state = 258;
          param(); 
        }
        state = 263;
        errorHandler.sync(this);
        _alt = interpreter!.adaptivePredict(tokenStream, 12, context);
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
      state = 264;
      dataType();
      state = 265;
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
      state = 287;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 16, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 267;
        identifier(0);
        state = 269;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_Q) {
          state = 268;
          match(TOKEN_Q);
        }

        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 271;
        match(TOKEN_LIST);
        state = 272;
        match(TOKEN_LT);
        state = 273;
        dataType();
        state = 274;
        match(TOKEN_GT);
        state = 276;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_Q) {
          state = 275;
          match(TOKEN_Q);
        }

        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 278;
        match(TOKEN_MAP);
        state = 279;
        match(TOKEN_LT);
        state = 280;
        dataType();
        state = 281;
        match(TOKEN_COMMA);
        state = 282;
        dataType();
        state = 283;
        match(TOKEN_GT);
        state = 285;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_Q) {
          state = 284;
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
      state = 299;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_FINAL:
      case TOKEN_CONST:
      case TOKEN_VAR:
        enterOuterAlt(_localctx, 1);
        state = 289;
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
        state = 290;
        assignment();
        break;
      case TOKEN_RETURN:
        enterOuterAlt(_localctx, 3);
        state = 291;
        returnStmt();
        break;
      case TOKEN_BREAK:
        enterOuterAlt(_localctx, 4);
        state = 292;
        breakStmt();
        break;
      case TOKEN_CONTINUE:
        enterOuterAlt(_localctx, 5);
        state = 293;
        continueStmt();
        break;
      case TOKEN_THROW:
        enterOuterAlt(_localctx, 6);
        state = 294;
        throwStmt();
        break;
      case TOKEN_IF:
        enterOuterAlt(_localctx, 7);
        state = 295;
        ifStmt();
        break;
      case TOKEN_WHILE:
        enterOuterAlt(_localctx, 8);
        state = 296;
        whileStmt();
        break;
      case TOKEN_FOR:
        enterOuterAlt(_localctx, 9);
        state = 297;
        forStmt();
        break;
      case TOKEN_TRY:
        enterOuterAlt(_localctx, 10);
        state = 298;
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
      state = 301;
      match(TOKEN_THROW);
      state = 302;
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
      state = 304;
      match(TOKEN_IF);
      state = 305;
      match(TOKEN_OPEN_PAREN);
      state = 306;
      expr();
      state = 307;
      match(TOKEN_CLOSE_PAREN);
      state = 308;
      block();
      state = 310;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 18, context)) {
      case 1:
        state = 309;
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
      state = 312;
      match(TOKEN_ELSE);
      state = 315;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 19, context)) {
      case 1:
        state = 313;
        ifStmt();
        break;
      case 2:
        state = 314;
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
      state = 317;
      match(TOKEN_WHILE);
      state = 318;
      match(TOKEN_OPEN_PAREN);
      state = 319;
      expr();
      state = 320;
      match(TOKEN_CLOSE_PAREN);
      state = 321;
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
      state = 323;
      match(TOKEN_FOR);
      state = 324;
      match(TOKEN_OPEN_PAREN);
      state = 338;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 21, context)) {
      case 1:
        state = 327;
        errorHandler.sync(this);
        switch (tokenStream.LA(1)!) {
        case TOKEN_FINAL:
        case TOKEN_CONST:
        case TOKEN_VAR:
          state = 325;
          varDecl();
          break;
        case TOKEN_IDENT:
          state = 326;
          match(TOKEN_IDENT);
          break;
        default:
          throw NoViableAltException(this);
        }
        state = 329;
        match(TOKEN_SEMI);
        state = 330;
        expr();
        state = 331;
        match(TOKEN_SEMI);
        state = 332;
        assignment();
        break;
      case 2:
        state = 334;
        varDecl();
        state = 335;
        match(TOKEN_IN);
        state = 336;
        expr();
        break;
      }
      state = 340;
      match(TOKEN_CLOSE_PAREN);
      state = 341;
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
      state = 343;
      match(TOKEN_RETURN);
      state = 345;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 576447558734316870) != 0) || ((((_la - 78)) & ~0x3f) == 0 && ((1 << (_la - 78)) & 63) != 0)) {
        state = 344;
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
      state = 347;
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
      state = 349;
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
      state = 351;
      match(TOKEN_TRY);
      state = 352;
      block();
      state = 353;
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
      state = 355;
      match(TOKEN_CATCH);
      state = 356;
      match(TOKEN_OPEN_PAREN);
      state = 357;
      identifier(0);
      state = 358;
      match(TOKEN_CLOSE_PAREN);
      state = 359;
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
      state = 368;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 24, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 363;
        errorHandler.sync(this);
        switch (interpreter!.adaptivePredict(tokenStream, 23, context)) {
        case 1:
          state = 361;
          stmt();
          break;
        case 2:
          state = 362;
          expr();
          break;
        }
        state = 365;
        match(TOKEN_SEMI);
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 367;
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
      state = 370;
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
      state = 374;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 25, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 372;
        simpleAssignment();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 373;
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
      state = 376;
      identifier(0);
      state = 377;
      match(TOKEN_ASSIGN);
      state = 378;
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
      state = 400;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 26, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 380;
        identifier(0);
        state = 381;
        _localctx.op = match(TOKEN_PLUS_ASSIGN);
        state = 382;
        expr();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 384;
        identifier(0);
        state = 385;
        _localctx.op = match(TOKEN_MINUS_ASSIGN);
        state = 386;
        expr();
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 388;
        identifier(0);
        state = 389;
        _localctx.op = match(TOKEN_MULTIPLY_ASSIGN);
        state = 390;
        expr();
        break;
      case 4:
        enterOuterAlt(_localctx, 4);
        state = 392;
        identifier(0);
        state = 393;
        _localctx.op = match(TOKEN_DIVIDE_ASSIGN);
        state = 394;
        expr();
        break;
      case 5:
        enterOuterAlt(_localctx, 5);
        state = 396;
        identifier(0);
        state = 397;
        _localctx.op = match(TOKEN_MOD_ASSIGN);
        state = 398;
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
      state = 412;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 28, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 402;
        varType();
        state = 403;
        dataType();
        state = 404;
        identifier(0);
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 406;
        varType();
        state = 408;
        errorHandler.sync(this);
        switch (interpreter!.adaptivePredict(tokenStream, 27, context)) {
        case 1:
          state = 407;
          dataType();
          break;
        }
        state = 410;
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
      state = 414;
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
      state = 416;
      _localctx.left = relationalExpr();
      state = 421;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_AND || _la == TOKEN_OR) {
        state = 417;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!(_la == TOKEN_AND || _la == TOKEN_OR)) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 418;
        _localctx.right = relationalExpr();
        state = 423;
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
      state = 424;
      _localctx.left = bitwiseExpr();
      state = 429;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 487424) != 0)) {
        state = 425;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!((((_la) & ~0x3f) == 0 && ((1 << _la) & 487424) != 0))) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 426;
        _localctx.right = bitwiseExpr();
        state = 431;
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
      state = 432;
      _localctx.left = shiftExpr();
      state = 437;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 469762048) != 0)) {
        state = 433;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!((((_la) & ~0x3f) == 0 && ((1 << _la) & 469762048) != 0))) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 434;
        _localctx.right = shiftExpr();
        state = 439;
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
      state = 440;
      _localctx.left = additiveExpr();
      state = 445;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_BIT_LEFT_SHIFT || _la == TOKEN_BIT_RIGHT_SHIFT) {
        state = 441;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!(_la == TOKEN_BIT_LEFT_SHIFT || _la == TOKEN_BIT_RIGHT_SHIFT)) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 442;
        _localctx.right = additiveExpr();
        state = 447;
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
      state = 448;
      _localctx.left = multiplicativeExpr();
      state = 453;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_PLUS || _la == TOKEN_MINUS) {
        state = 449;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!(_la == TOKEN_PLUS || _la == TOKEN_MINUS)) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 450;
        _localctx.right = multiplicativeExpr();
        state = 455;
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
      state = 456;
      _localctx.left = unaryExpr();
      state = 461;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 56) != 0)) {
        state = 457;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!((((_la) & ~0x3f) == 0 && ((1 << _la) & 56) != 0))) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 458;
        _localctx.right = unaryExpr();
        state = 463;
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
      state = 467;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_PLUS:
      case TOKEN_MINUS:
      case TOKEN_NOT:
      case TOKEN_BIT_NOT:
        enterOuterAlt(_localctx, 1);
        state = 464;
        _localctx.op = tokenStream.LT(1);
        _la = tokenStream.LA(1)!;
        if (!((((_la) & ~0x3f) == 0 && ((1 << _la) & 570425350) != 0))) {
          _localctx.op = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 465;
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
        state = 466;
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
      state = 469;
      primaryExpr();
      state = 471;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_PLUS_PLUS || _la == TOKEN_MINUS_MINUS) {
        state = 470;
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
      state = 481;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 37, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 473;
        match(TOKEN_OPEN_PAREN);
        state = 474;
        expr();
        state = 475;
        match(TOKEN_CLOSE_PAREN);
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 477;
        functionCall();
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 478;
        externalFunctionCall();
        break;
      case 4:
        enterOuterAlt(_localctx, 4);
        state = 479;
        literal();
        break;
      case 5:
        enterOuterAlt(_localctx, 5);
        state = 480;
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
      state = 483;
      _localctx.namespace = identifier(0);
      state = 484;
      match(TOKEN_DOUBLE_COLON);
      state = 485;
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
      state = 487;
      _localctx.method = identifier(0);
      state = 488;
      match(TOKEN_OPEN_PAREN);
      state = 490;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 576447558734316870) != 0) || ((((_la - 78)) & ~0x3f) == 0 && ((1 << (_la - 78)) & 63) != 0)) {
        state = 489;
        args();
      }

      state = 492;
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
      state = 527;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 43, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 494;
        positionalArg();
        state = 499;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 495;
          match(TOKEN_COMMA);
          state = 496;
          positionalArg();
          state = 501;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 502;
        namedArg();
        state = 507;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 503;
          match(TOKEN_COMMA);
          state = 504;
          namedArg();
          state = 509;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 510;
        positionalArg();
        state = 515;
        errorHandler.sync(this);
        _alt = interpreter!.adaptivePredict(tokenStream, 41, context);
        while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
          if (_alt == 1) {
            state = 511;
            match(TOKEN_COMMA);
            state = 512;
            positionalArg(); 
          }
          state = 517;
          errorHandler.sync(this);
          _alt = interpreter!.adaptivePredict(tokenStream, 41, context);
        }
        state = 518;
        match(TOKEN_COMMA);
        state = 519;
        namedArg();
        state = 524;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 520;
          match(TOKEN_COMMA);
          state = 521;
          namedArg();
          state = 526;
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
      state = 529;
      identifier(0);
      state = 530;
      match(TOKEN_COLON);
      state = 531;
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
      state = 533;
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
      state = 543;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_INT:
        enterOuterAlt(_localctx, 1);
        state = 535;
        match(TOKEN_INT);
        break;
      case TOKEN_DOUBLE:
        enterOuterAlt(_localctx, 2);
        state = 536;
        match(TOKEN_DOUBLE);
        break;
      case TOKEN_BOOL:
        enterOuterAlt(_localctx, 3);
        state = 537;
        match(TOKEN_BOOL);
        break;
      case TOKEN_STRING:
        enterOuterAlt(_localctx, 4);
        state = 538;
        match(TOKEN_STRING);
        break;
      case TOKEN_NULL:
        enterOuterAlt(_localctx, 5);
        state = 539;
        match(TOKEN_NULL);
        break;
      case TOKEN_OPEN_BRACKET:
        enterOuterAlt(_localctx, 6);
        state = 540;
        arrayLiteral();
        break;
      case TOKEN_OPEN_BRACE:
        enterOuterAlt(_localctx, 7);
        state = 541;
        mapLiteral();
        break;
      case TOKEN_AT:
        enterOuterAlt(_localctx, 8);
        state = 542;
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
      state = 562;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_IDENT:
        state = 546;
        _localctx.ident = match(TOKEN_IDENT);
        break;
      case TOKEN_AUTHOR:
        state = 547;
        _localctx.ident = match(TOKEN_AUTHOR);
        break;
      case TOKEN_NAME:
        state = 548;
        _localctx.ident = match(TOKEN_NAME);
        break;
      case TOKEN_DESCRIPTION:
        state = 549;
        _localctx.ident = match(TOKEN_DESCRIPTION);
        break;
      case TOKEN_VERSION:
        state = 550;
        _localctx.ident = match(TOKEN_VERSION);
        break;
      case TOKEN_LICENSE:
        state = 551;
        _localctx.ident = match(TOKEN_LICENSE);
        break;
      case TOKEN_REPO:
        state = 552;
        _localctx.ident = match(TOKEN_REPO);
        break;
      case TOKEN_WEBSITE:
        state = 553;
        _localctx.ident = match(TOKEN_WEBSITE);
        break;
      case TOKEN_PERMISSIONS:
        state = 554;
        _localctx.ident = match(TOKEN_PERMISSIONS);
        break;
      case TOKEN_CONTRACT:
        state = 555;
        _localctx.ident = match(TOKEN_CONTRACT);
        break;
      case TOKEN_IMPL:
        state = 556;
        _localctx.ident = match(TOKEN_IMPL);
        break;
      case TOKEN_HOOK:
        state = 557;
        _localctx.ident = match(TOKEN_HOOK);
        break;
      case TOKEN_FUNC:
        state = 558;
        _localctx.ident = match(TOKEN_FUNC);
        break;
      case TOKEN_LIST:
        state = 559;
        _localctx.ident = match(TOKEN_LIST);
        break;
      case TOKEN_MAP:
        state = 560;
        _localctx.ident = match(TOKEN_MAP);
        break;
      case TOKEN_SCHEMA:
        state = 561;
        _localctx.ident = match(TOKEN_SCHEMA);
        break;
      default:
        throw NoViableAltException(this);
      }
      state = 566;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 46, context)) {
      case 1:
        state = 564;
        _localctx.nullAware = match(TOKEN_NOT);
        break;
      case 2:
        state = 565;
        _localctx.allowNull = match(TOKEN_Q);
        break;
      }
      context!.stop = tokenStream.LT(-1);
      state = 581;
      errorHandler.sync(this);
      _alt = interpreter!.adaptivePredict(tokenStream, 49, context);
      while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
        if (_alt == 1) {
          if (parseListeners != null) triggerExitRuleEvent();
          _prevctx = _localctx;
          state = 579;
          errorHandler.sync(this);
          switch (interpreter!.adaptivePredict(tokenStream, 48, context)) {
          case 1:
            _localctx = IdentifierContext(_parentctx, _parentState);
            _localctx.objIdent = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_identifier);
            state = 568;
            if (!(precpred(context, 1))) {
              throw FailedPredicateException(this, "precpred(context, 1)");
            }
            state = 569;
            match(TOKEN_DOT);
            state = 570;
            _localctx.property = identifier(2);
            break;
          case 2:
            _localctx = IdentifierContext(_parentctx, _parentState);
            _localctx.indexIdent = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_identifier);
            state = 571;
            if (!(precpred(context, 2))) {
              throw FailedPredicateException(this, "precpred(context, 2)");
            }
            state = 572;
            match(TOKEN_OPEN_BRACKET);
            state = 573;
            _localctx.index = expr();
            state = 574;
            match(TOKEN_CLOSE_BRACKET);
            state = 577;
            errorHandler.sync(this);
            switch (interpreter!.adaptivePredict(tokenStream, 47, context)) {
            case 1:
              state = 575;
              _localctx.nullAware = match(TOKEN_NOT);
              break;
            case 2:
              state = 576;
              _localctx.allowNull = match(TOKEN_Q);
              break;
            }
            break;
          } 
        }
        state = 583;
        errorHandler.sync(this);
        _alt = interpreter!.adaptivePredict(tokenStream, 49, context);
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
      state = 584;
      match(TOKEN_OPEN_BRACKET);
      state = 593;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 576447558734316870) != 0) || ((((_la - 78)) & ~0x3f) == 0 && ((1 << (_la - 78)) & 63) != 0)) {
        state = 585;
        expr();
        state = 590;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 586;
          match(TOKEN_COMMA);
          state = 587;
          expr();
          state = 592;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
      }

      state = 595;
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
      state = 597;
      match(TOKEN_AT);
      state = 598;
      identifier(0);
      state = 599;
      match(TOKEN_OPEN_BRACE);
      state = 608;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (((((_la - 44)) & ~0x3f) == 0 && ((1 << (_la - 44)) & 274877939711) != 0)) {
        state = 600;
        objectProperty();
        state = 605;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 601;
          match(TOKEN_COMMA);
          state = 602;
          objectProperty();
          state = 607;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
      }

      state = 610;
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
      state = 612;
      identifier(0);
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

  MapLiteralContext mapLiteral() {
    dynamic _localctx = MapLiteralContext(context, state);
    enterRule(_localctx, 112, RULE_mapLiteral);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 616;
      match(TOKEN_OPEN_BRACE);
      state = 625;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 576447558734316870) != 0) || ((((_la - 78)) & ~0x3f) == 0 && ((1 << (_la - 78)) & 63) != 0)) {
        state = 617;
        mapEntry();
        state = 622;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 618;
          match(TOKEN_COMMA);
          state = 619;
          mapEntry();
          state = 624;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
      }

      state = 627;
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
      state = 629;
      _localctx.key = expr();
      state = 630;
      match(TOKEN_COLON);
      state = 631;
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
      state = 646;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_OPEN_BRACE:
        enterOuterAlt(_localctx, 1);
        state = 633;
        match(TOKEN_OPEN_BRACE);
        state = 637;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 8070437338678822214) != 0) || ((((_la - 65)) & ~0x3f) == 0 && ((1 << (_la - 65)) & 520135) != 0)) {
          state = 634;
          line();
          state = 639;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        state = 640;
        match(TOKEN_CLOSE_BRACE);
        break;
      case TOKEN_IF:
        enterOuterAlt(_localctx, 2);
        state = 641;
        ifStmt();
        break;
      case TOKEN_WHILE:
        enterOuterAlt(_localctx, 3);
        state = 642;
        whileStmt();
        break;
      case TOKEN_FOR:
        enterOuterAlt(_localctx, 4);
        state = 643;
        forStmt();
        break;
      case TOKEN_TRY:
        enterOuterAlt(_localctx, 5);
        state = 644;
        tryStmt();
        break;
      case TOKEN_CATCH:
        enterOuterAlt(_localctx, 6);
        state = 645;
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
      4,1,86,649,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,
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
      1,14,1,14,1,14,1,14,1,14,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,
      15,1,15,1,15,1,15,1,15,1,15,3,15,248,8,15,1,15,1,15,1,15,3,15,253,
      8,15,1,15,1,15,1,16,1,16,1,16,5,16,260,8,16,10,16,12,16,263,9,16,1,
      17,1,17,1,17,1,18,1,18,3,18,270,8,18,1,18,1,18,1,18,1,18,1,18,3,18,
      277,8,18,1,18,1,18,1,18,1,18,1,18,1,18,1,18,3,18,286,8,18,3,18,288,
      8,18,1,19,1,19,1,19,1,19,1,19,1,19,1,19,1,19,1,19,1,19,3,19,300,8,
      19,1,20,1,20,1,20,1,21,1,21,1,21,1,21,1,21,1,21,3,21,311,8,21,1,22,
      1,22,1,22,3,22,316,8,22,1,23,1,23,1,23,1,23,1,23,1,23,1,24,1,24,1,
      24,1,24,3,24,328,8,24,1,24,1,24,1,24,1,24,1,24,1,24,1,24,1,24,1,24,
      3,24,339,8,24,1,24,1,24,1,24,1,25,1,25,3,25,346,8,25,1,26,1,26,1,27,
      1,27,1,28,1,28,1,28,1,28,1,29,1,29,1,29,1,29,1,29,1,29,1,30,1,30,3,
      30,364,8,30,1,30,1,30,1,30,3,30,369,8,30,1,31,1,31,1,32,1,32,3,32,
      375,8,32,1,33,1,33,1,33,1,33,1,34,1,34,1,34,1,34,1,34,1,34,1,34,1,
      34,1,34,1,34,1,34,1,34,1,34,1,34,1,34,1,34,1,34,1,34,1,34,1,34,3,34,
      401,8,34,1,35,1,35,1,35,1,35,1,35,1,35,3,35,409,8,35,1,35,1,35,3,35,
      413,8,35,1,36,1,36,1,37,1,37,1,37,5,37,420,8,37,10,37,12,37,423,9,
      37,1,38,1,38,1,38,5,38,428,8,38,10,38,12,38,431,9,38,1,39,1,39,1,39,
      5,39,436,8,39,10,39,12,39,439,9,39,1,40,1,40,1,40,5,40,444,8,40,10,
      40,12,40,447,9,40,1,41,1,41,1,41,5,41,452,8,41,10,41,12,41,455,9,41,
      1,42,1,42,1,42,5,42,460,8,42,10,42,12,42,463,9,42,1,43,1,43,1,43,3,
      43,468,8,43,1,44,1,44,3,44,472,8,44,1,45,1,45,1,45,1,45,1,45,1,45,
      1,45,1,45,3,45,482,8,45,1,46,1,46,1,46,1,46,1,47,1,47,1,47,3,47,491,
      8,47,1,47,1,47,1,48,1,48,1,48,5,48,498,8,48,10,48,12,48,501,9,48,1,
      48,1,48,1,48,5,48,506,8,48,10,48,12,48,509,9,48,1,48,1,48,1,48,5,48,
      514,8,48,10,48,12,48,517,9,48,1,48,1,48,1,48,1,48,5,48,523,8,48,10,
      48,12,48,526,9,48,3,48,528,8,48,1,49,1,49,1,49,1,49,1,50,1,50,1,51,
      1,51,1,51,1,51,1,51,1,51,1,51,1,51,3,51,544,8,51,1,52,1,52,1,52,1,
      52,1,52,1,52,1,52,1,52,1,52,1,52,1,52,1,52,1,52,1,52,1,52,1,52,1,52,
      3,52,563,8,52,1,52,1,52,3,52,567,8,52,1,52,1,52,1,52,1,52,1,52,1,52,
      1,52,1,52,1,52,3,52,578,8,52,5,52,580,8,52,10,52,12,52,583,9,52,1,
      53,1,53,1,53,1,53,5,53,589,8,53,10,53,12,53,592,9,53,3,53,594,8,53,
      1,53,1,53,1,54,1,54,1,54,1,54,1,54,1,54,5,54,604,8,54,10,54,12,54,
      607,9,54,3,54,609,8,54,1,54,1,54,1,55,1,55,1,55,1,55,1,56,1,56,1,56,
      1,56,5,56,621,8,56,10,56,12,56,624,9,56,3,56,626,8,56,1,56,1,56,1,
      57,1,57,1,57,1,57,1,58,1,58,5,58,636,8,58,10,58,12,58,639,9,58,1,58,
      1,58,1,58,1,58,1,58,1,58,3,58,647,8,58,1,58,0,1,104,59,0,2,4,6,8,10,
      12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,
      56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,
      100,102,104,106,108,110,112,114,116,0,9,1,0,74,76,1,0,23,24,2,0,12,
      14,16,18,1,0,26,28,1,0,30,31,1,0,1,2,1,0,3,5,3,0,1,2,25,25,29,29,1,
      0,40,41,697,0,119,1,0,0,0,2,143,1,0,0,0,4,145,1,0,0,0,6,149,1,0,0,
      0,8,153,1,0,0,0,10,157,1,0,0,0,12,161,1,0,0,0,14,165,1,0,0,0,16,169,
      1,0,0,0,18,173,1,0,0,0,20,177,1,0,0,0,22,188,1,0,0,0,24,192,1,0,0,
      0,26,213,1,0,0,0,28,222,1,0,0,0,30,233,1,0,0,0,32,256,1,0,0,0,34,264,
      1,0,0,0,36,287,1,0,0,0,38,299,1,0,0,0,40,301,1,0,0,0,42,304,1,0,0,
      0,44,312,1,0,0,0,46,317,1,0,0,0,48,323,1,0,0,0,50,343,1,0,0,0,52,347,
      1,0,0,0,54,349,1,0,0,0,56,351,1,0,0,0,58,355,1,0,0,0,60,368,1,0,0,
      0,62,370,1,0,0,0,64,374,1,0,0,0,66,376,1,0,0,0,68,400,1,0,0,0,70,412,
      1,0,0,0,72,414,1,0,0,0,74,416,1,0,0,0,76,424,1,0,0,0,78,432,1,0,0,
      0,80,440,1,0,0,0,82,448,1,0,0,0,84,456,1,0,0,0,86,467,1,0,0,0,88,469,
      1,0,0,0,90,481,1,0,0,0,92,483,1,0,0,0,94,487,1,0,0,0,96,527,1,0,0,
      0,98,529,1,0,0,0,100,533,1,0,0,0,102,543,1,0,0,0,104,545,1,0,0,0,106,
      584,1,0,0,0,108,597,1,0,0,0,110,612,1,0,0,0,112,616,1,0,0,0,114,629,
      1,0,0,0,116,646,1,0,0,0,118,120,3,4,2,0,119,118,1,0,0,0,119,120,1,
      0,0,0,120,124,1,0,0,0,121,123,3,2,1,0,122,121,1,0,0,0,123,126,1,0,
      0,0,124,122,1,0,0,0,124,125,1,0,0,0,125,130,1,0,0,0,126,124,1,0,0,
      0,127,129,3,20,10,0,128,127,1,0,0,0,129,132,1,0,0,0,130,128,1,0,0,
      0,130,131,1,0,0,0,131,133,1,0,0,0,132,130,1,0,0,0,133,134,3,24,12,
      0,134,135,5,0,0,1,135,1,1,0,0,0,136,144,3,18,9,0,137,144,3,8,4,0,138,
      144,3,6,3,0,139,144,3,10,5,0,140,144,3,12,6,0,141,144,3,14,7,0,142,
      144,3,16,8,0,143,136,1,0,0,0,143,137,1,0,0,0,143,138,1,0,0,0,143,139,
      1,0,0,0,143,140,1,0,0,0,143,141,1,0,0,0,143,142,1,0,0,0,144,3,1,0,
      0,0,145,146,5,44,0,0,146,147,5,83,0,0,147,148,5,22,0,0,148,5,1,0,0,
      0,149,150,5,45,0,0,150,151,5,83,0,0,151,152,5,22,0,0,152,7,1,0,0,0,
      153,154,5,46,0,0,154,155,5,83,0,0,155,156,5,22,0,0,156,9,1,0,0,0,157,
      158,5,47,0,0,158,159,5,77,0,0,159,160,5,22,0,0,160,11,1,0,0,0,161,
      162,5,48,0,0,162,163,5,83,0,0,163,164,5,22,0,0,164,13,1,0,0,0,165,
      166,5,49,0,0,166,167,5,83,0,0,167,168,5,22,0,0,168,15,1,0,0,0,169,
      170,5,50,0,0,170,171,5,83,0,0,171,172,5,22,0,0,172,17,1,0,0,0,173,
      174,5,51,0,0,174,175,5,83,0,0,175,176,5,22,0,0,176,19,1,0,0,0,177,
      178,5,52,0,0,178,183,3,22,11,0,179,180,5,21,0,0,180,182,3,22,11,0,
      181,179,1,0,0,0,182,185,1,0,0,0,183,181,1,0,0,0,183,184,1,0,0,0,184,
      186,1,0,0,0,185,183,1,0,0,0,186,187,5,22,0,0,187,21,1,0,0,0,188,189,
      3,104,52,0,189,190,5,20,0,0,190,191,3,104,52,0,191,23,1,0,0,0,192,
      193,5,53,0,0,193,194,3,104,52,0,194,200,5,8,0,0,195,196,3,70,35,0,
      196,197,5,22,0,0,197,199,1,0,0,0,198,195,1,0,0,0,199,202,1,0,0,0,200,
      198,1,0,0,0,200,201,1,0,0,0,201,208,1,0,0,0,202,200,1,0,0,0,203,207,
      3,26,13,0,204,207,3,28,14,0,205,207,3,30,15,0,206,203,1,0,0,0,206,
      204,1,0,0,0,206,205,1,0,0,0,207,210,1,0,0,0,208,206,1,0,0,0,208,209,
      1,0,0,0,209,211,1,0,0,0,210,208,1,0,0,0,211,212,5,9,0,0,212,25,1,0,
      0,0,213,214,5,55,0,0,214,215,3,104,52,0,215,217,5,6,0,0,216,218,3,
      32,16,0,217,216,1,0,0,0,217,218,1,0,0,0,218,219,1,0,0,0,219,220,5,
      7,0,0,220,221,3,116,58,0,221,27,1,0,0,0,222,223,5,54,0,0,223,224,3,
      104,52,0,224,226,5,6,0,0,225,227,3,32,16,0,226,225,1,0,0,0,226,227,
      1,0,0,0,227,228,1,0,0,0,228,229,5,7,0,0,229,230,5,32,0,0,230,231,3,
      36,18,0,231,232,3,116,58,0,232,29,1,0,0,0,233,234,5,56,0,0,234,235,
      3,104,52,0,235,247,5,6,0,0,236,237,3,32,16,0,237,238,5,21,0,0,238,
      239,5,8,0,0,239,240,3,32,16,0,240,241,5,9,0,0,241,248,1,0,0,0,242,
      248,3,32,16,0,243,244,5,8,0,0,244,245,3,32,16,0,245,246,5,9,0,0,246,
      248,1,0,0,0,247,236,1,0,0,0,247,242,1,0,0,0,247,243,1,0,0,0,247,248,
      1,0,0,0,248,249,1,0,0,0,249,252,5,7,0,0,250,251,5,32,0,0,251,253,3,
      36,18,0,252,250,1,0,0,0,252,253,1,0,0,0,253,254,1,0,0,0,254,255,3,
      116,58,0,255,31,1,0,0,0,256,261,3,34,17,0,257,258,5,21,0,0,258,260,
      3,34,17,0,259,257,1,0,0,0,260,263,1,0,0,0,261,259,1,0,0,0,261,262,
      1,0,0,0,262,33,1,0,0,0,263,261,1,0,0,0,264,265,3,36,18,0,265,266,3,
      104,52,0,266,35,1,0,0,0,267,269,3,104,52,0,268,270,5,33,0,0,269,268,
      1,0,0,0,269,270,1,0,0,0,270,288,1,0,0,0,271,272,5,57,0,0,272,273,5,
      13,0,0,273,274,3,36,18,0,274,276,5,12,0,0,275,277,5,33,0,0,276,275,
      1,0,0,0,276,277,1,0,0,0,277,288,1,0,0,0,278,279,5,58,0,0,279,280,5,
      13,0,0,280,281,3,36,18,0,281,282,5,21,0,0,282,283,3,36,18,0,283,285,
      5,12,0,0,284,286,5,33,0,0,285,284,1,0,0,0,285,286,1,0,0,0,286,288,
      1,0,0,0,287,267,1,0,0,0,287,271,1,0,0,0,287,278,1,0,0,0,288,37,1,0,
      0,0,289,300,3,70,35,0,290,300,3,64,32,0,291,300,3,50,25,0,292,300,
      3,52,26,0,293,300,3,54,27,0,294,300,3,40,20,0,295,300,3,42,21,0,296,
      300,3,46,23,0,297,300,3,48,24,0,298,300,3,56,28,0,299,289,1,0,0,0,
      299,290,1,0,0,0,299,291,1,0,0,0,299,292,1,0,0,0,299,293,1,0,0,0,299,
      294,1,0,0,0,299,295,1,0,0,0,299,296,1,0,0,0,299,297,1,0,0,0,299,298,
      1,0,0,0,300,39,1,0,0,0,301,302,5,73,0,0,302,303,3,72,36,0,303,41,1,
      0,0,0,304,305,5,59,0,0,305,306,5,6,0,0,306,307,3,72,36,0,307,308,5,
      7,0,0,308,310,3,116,58,0,309,311,3,44,22,0,310,309,1,0,0,0,310,311,
      1,0,0,0,311,43,1,0,0,0,312,315,5,60,0,0,313,316,3,42,21,0,314,316,
      3,116,58,0,315,313,1,0,0,0,315,314,1,0,0,0,316,45,1,0,0,0,317,318,
      5,61,0,0,318,319,5,6,0,0,319,320,3,72,36,0,320,321,5,7,0,0,321,322,
      3,116,58,0,322,47,1,0,0,0,323,324,5,62,0,0,324,338,5,6,0,0,325,328,
      3,70,35,0,326,328,5,82,0,0,327,325,1,0,0,0,327,326,1,0,0,0,328,329,
      1,0,0,0,329,330,5,22,0,0,330,331,3,72,36,0,331,332,5,22,0,0,332,333,
      3,64,32,0,333,339,1,0,0,0,334,335,3,70,35,0,335,336,5,63,0,0,336,337,
      3,72,36,0,337,339,1,0,0,0,338,327,1,0,0,0,338,334,1,0,0,0,339,340,
      1,0,0,0,340,341,5,7,0,0,341,342,3,116,58,0,342,49,1,0,0,0,343,345,
      5,65,0,0,344,346,3,72,36,0,345,344,1,0,0,0,345,346,1,0,0,0,346,51,
      1,0,0,0,347,348,5,66,0,0,348,53,1,0,0,0,349,350,5,67,0,0,350,55,1,
      0,0,0,351,352,5,71,0,0,352,353,3,116,58,0,353,354,3,58,29,0,354,57,
      1,0,0,0,355,356,5,72,0,0,356,357,5,6,0,0,357,358,3,104,52,0,358,359,
      5,7,0,0,359,360,3,116,58,0,360,59,1,0,0,0,361,364,3,38,19,0,362,364,
      3,72,36,0,363,361,1,0,0,0,363,362,1,0,0,0,364,365,1,0,0,0,365,366,
      5,22,0,0,366,369,1,0,0,0,367,369,3,116,58,0,368,363,1,0,0,0,368,367,
      1,0,0,0,369,61,1,0,0,0,370,371,7,0,0,0,371,63,1,0,0,0,372,375,3,66,
      33,0,373,375,3,68,34,0,374,372,1,0,0,0,374,373,1,0,0,0,375,65,1,0,
      0,0,376,377,3,104,52,0,377,378,5,15,0,0,378,379,3,72,36,0,379,67,1,
      0,0,0,380,381,3,104,52,0,381,382,5,35,0,0,382,383,3,72,36,0,383,401,
      1,0,0,0,384,385,3,104,52,0,385,386,5,36,0,0,386,387,3,72,36,0,387,
      401,1,0,0,0,388,389,3,104,52,0,389,390,5,37,0,0,390,391,3,72,36,0,
      391,401,1,0,0,0,392,393,3,104,52,0,393,394,5,38,0,0,394,395,3,72,36,
      0,395,401,1,0,0,0,396,397,3,104,52,0,397,398,5,39,0,0,398,399,3,72,
      36,0,399,401,1,0,0,0,400,380,1,0,0,0,400,384,1,0,0,0,400,388,1,0,0,
      0,400,392,1,0,0,0,400,396,1,0,0,0,401,69,1,0,0,0,402,403,3,62,31,0,
      403,404,3,36,18,0,404,405,3,104,52,0,405,413,1,0,0,0,406,408,3,62,
      31,0,407,409,3,36,18,0,408,407,1,0,0,0,408,409,1,0,0,0,409,410,1,0,
      0,0,410,411,3,64,32,0,411,413,1,0,0,0,412,402,1,0,0,0,412,406,1,0,
      0,0,413,71,1,0,0,0,414,415,3,74,37,0,415,73,1,0,0,0,416,421,3,76,38,
      0,417,418,7,1,0,0,418,420,3,76,38,0,419,417,1,0,0,0,420,423,1,0,0,
      0,421,419,1,0,0,0,421,422,1,0,0,0,422,75,1,0,0,0,423,421,1,0,0,0,424,
      429,3,78,39,0,425,426,7,2,0,0,426,428,3,78,39,0,427,425,1,0,0,0,428,
      431,1,0,0,0,429,427,1,0,0,0,429,430,1,0,0,0,430,77,1,0,0,0,431,429,
      1,0,0,0,432,437,3,80,40,0,433,434,7,3,0,0,434,436,3,80,40,0,435,433,
      1,0,0,0,436,439,1,0,0,0,437,435,1,0,0,0,437,438,1,0,0,0,438,79,1,0,
      0,0,439,437,1,0,0,0,440,445,3,82,41,0,441,442,7,4,0,0,442,444,3,82,
      41,0,443,441,1,0,0,0,444,447,1,0,0,0,445,443,1,0,0,0,445,446,1,0,0,
      0,446,81,1,0,0,0,447,445,1,0,0,0,448,453,3,84,42,0,449,450,7,5,0,0,
      450,452,3,84,42,0,451,449,1,0,0,0,452,455,1,0,0,0,453,451,1,0,0,0,
      453,454,1,0,0,0,454,83,1,0,0,0,455,453,1,0,0,0,456,461,3,86,43,0,457,
      458,7,6,0,0,458,460,3,86,43,0,459,457,1,0,0,0,460,463,1,0,0,0,461,
      459,1,0,0,0,461,462,1,0,0,0,462,85,1,0,0,0,463,461,1,0,0,0,464,465,
      7,7,0,0,465,468,3,86,43,0,466,468,3,88,44,0,467,464,1,0,0,0,467,466,
      1,0,0,0,468,87,1,0,0,0,469,471,3,90,45,0,470,472,7,8,0,0,471,470,1,
      0,0,0,471,472,1,0,0,0,472,89,1,0,0,0,473,474,5,6,0,0,474,475,3,72,
      36,0,475,476,5,7,0,0,476,482,1,0,0,0,477,482,3,94,47,0,478,482,3,92,
      46,0,479,482,3,102,51,0,480,482,3,104,52,0,481,473,1,0,0,0,481,477,
      1,0,0,0,481,478,1,0,0,0,481,479,1,0,0,0,481,480,1,0,0,0,482,91,1,0,
      0,0,483,484,3,104,52,0,484,485,5,20,0,0,485,486,3,94,47,0,486,93,1,
      0,0,0,487,488,3,104,52,0,488,490,5,6,0,0,489,491,3,96,48,0,490,489,
      1,0,0,0,490,491,1,0,0,0,491,492,1,0,0,0,492,493,5,7,0,0,493,95,1,0,
      0,0,494,499,3,100,50,0,495,496,5,21,0,0,496,498,3,100,50,0,497,495,
      1,0,0,0,498,501,1,0,0,0,499,497,1,0,0,0,499,500,1,0,0,0,500,528,1,
      0,0,0,501,499,1,0,0,0,502,507,3,98,49,0,503,504,5,21,0,0,504,506,3,
      98,49,0,505,503,1,0,0,0,506,509,1,0,0,0,507,505,1,0,0,0,507,508,1,
      0,0,0,508,528,1,0,0,0,509,507,1,0,0,0,510,515,3,100,50,0,511,512,5,
      21,0,0,512,514,3,100,50,0,513,511,1,0,0,0,514,517,1,0,0,0,515,513,
      1,0,0,0,515,516,1,0,0,0,516,518,1,0,0,0,517,515,1,0,0,0,518,519,5,
      21,0,0,519,524,3,98,49,0,520,521,5,21,0,0,521,523,3,98,49,0,522,520,
      1,0,0,0,523,526,1,0,0,0,524,522,1,0,0,0,524,525,1,0,0,0,525,528,1,
      0,0,0,526,524,1,0,0,0,527,494,1,0,0,0,527,502,1,0,0,0,527,510,1,0,
      0,0,528,97,1,0,0,0,529,530,3,104,52,0,530,531,5,19,0,0,531,532,3,72,
      36,0,532,99,1,0,0,0,533,534,3,72,36,0,534,101,1,0,0,0,535,544,5,80,
      0,0,536,544,5,81,0,0,537,544,5,78,0,0,538,544,5,83,0,0,539,544,5,79,
      0,0,540,544,3,106,53,0,541,544,3,112,56,0,542,544,3,108,54,0,543,535,
      1,0,0,0,543,536,1,0,0,0,543,537,1,0,0,0,543,538,1,0,0,0,543,539,1,
      0,0,0,543,540,1,0,0,0,543,541,1,0,0,0,543,542,1,0,0,0,544,103,1,0,
      0,0,545,562,6,52,-1,0,546,563,5,82,0,0,547,563,5,45,0,0,548,563,5,
      51,0,0,549,563,5,46,0,0,550,563,5,47,0,0,551,563,5,48,0,0,552,563,
      5,49,0,0,553,563,5,50,0,0,554,563,5,52,0,0,555,563,5,53,0,0,556,563,
      5,54,0,0,557,563,5,55,0,0,558,563,5,56,0,0,559,563,5,57,0,0,560,563,
      5,58,0,0,561,563,5,44,0,0,562,546,1,0,0,0,562,547,1,0,0,0,562,548,
      1,0,0,0,562,549,1,0,0,0,562,550,1,0,0,0,562,551,1,0,0,0,562,552,1,
      0,0,0,562,553,1,0,0,0,562,554,1,0,0,0,562,555,1,0,0,0,562,556,1,0,
      0,0,562,557,1,0,0,0,562,558,1,0,0,0,562,559,1,0,0,0,562,560,1,0,0,
      0,562,561,1,0,0,0,563,566,1,0,0,0,564,567,5,25,0,0,565,567,5,33,0,
      0,566,564,1,0,0,0,566,565,1,0,0,0,566,567,1,0,0,0,567,581,1,0,0,0,
      568,569,10,1,0,0,569,570,5,34,0,0,570,580,3,104,52,2,571,572,10,2,
      0,0,572,573,5,10,0,0,573,574,3,72,36,0,574,577,5,11,0,0,575,578,5,
      25,0,0,576,578,5,33,0,0,577,575,1,0,0,0,577,576,1,0,0,0,577,578,1,
      0,0,0,578,580,1,0,0,0,579,568,1,0,0,0,579,571,1,0,0,0,580,583,1,0,
      0,0,581,579,1,0,0,0,581,582,1,0,0,0,582,105,1,0,0,0,583,581,1,0,0,
      0,584,593,5,10,0,0,585,590,3,72,36,0,586,587,5,21,0,0,587,589,3,72,
      36,0,588,586,1,0,0,0,589,592,1,0,0,0,590,588,1,0,0,0,590,591,1,0,0,
      0,591,594,1,0,0,0,592,590,1,0,0,0,593,585,1,0,0,0,593,594,1,0,0,0,
      594,595,1,0,0,0,595,596,5,11,0,0,596,107,1,0,0,0,597,598,5,42,0,0,
      598,599,3,104,52,0,599,608,5,8,0,0,600,605,3,110,55,0,601,602,5,21,
      0,0,602,604,3,110,55,0,603,601,1,0,0,0,604,607,1,0,0,0,605,603,1,0,
      0,0,605,606,1,0,0,0,606,609,1,0,0,0,607,605,1,0,0,0,608,600,1,0,0,
      0,608,609,1,0,0,0,609,610,1,0,0,0,610,611,5,9,0,0,611,109,1,0,0,0,
      612,613,3,104,52,0,613,614,5,19,0,0,614,615,3,72,36,0,615,111,1,0,
      0,0,616,625,5,8,0,0,617,622,3,114,57,0,618,619,5,21,0,0,619,621,3,
      114,57,0,620,618,1,0,0,0,621,624,1,0,0,0,622,620,1,0,0,0,622,623,1,
      0,0,0,623,626,1,0,0,0,624,622,1,0,0,0,625,617,1,0,0,0,625,626,1,0,
      0,0,626,627,1,0,0,0,627,628,5,9,0,0,628,113,1,0,0,0,629,630,3,72,36,
      0,630,631,5,19,0,0,631,632,3,72,36,0,632,115,1,0,0,0,633,637,5,8,0,
      0,634,636,3,60,30,0,635,634,1,0,0,0,636,639,1,0,0,0,637,635,1,0,0,
      0,637,638,1,0,0,0,638,640,1,0,0,0,639,637,1,0,0,0,640,647,5,9,0,0,
      641,647,3,42,21,0,642,647,3,46,23,0,643,647,3,48,24,0,644,647,3,56,
      28,0,645,647,3,58,29,0,646,633,1,0,0,0,646,641,1,0,0,0,646,642,1,0,
      0,0,646,643,1,0,0,0,646,644,1,0,0,0,646,645,1,0,0,0,647,117,1,0,0,
      0,58,119,124,130,143,183,200,206,208,217,226,247,252,261,269,276,285,
      287,299,310,315,327,338,345,363,368,374,400,408,412,421,429,437,445,
      453,461,467,471,481,490,499,507,515,524,527,543,562,566,577,579,581,
      590,593,605,608,622,625,637,646
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
  ParamsContext? pos;
  ParamsContext? named;
  TerminalNode? FUNC() => getToken(dscriptParser.TOKEN_FUNC, 0);
  IdentifierContext? identifier() => getRuleContext<IdentifierContext>(0);
  TerminalNode? OPEN_PAREN() => getToken(dscriptParser.TOKEN_OPEN_PAREN, 0);
  TerminalNode? CLOSE_PAREN() => getToken(dscriptParser.TOKEN_CLOSE_PAREN, 0);
  BlockContext? block() => getRuleContext<BlockContext>(0);
  TerminalNode? COMMA() => getToken(dscriptParser.TOKEN_COMMA, 0);
  TerminalNode? OPEN_BRACE() => getToken(dscriptParser.TOKEN_OPEN_BRACE, 0);
  TerminalNode? CLOSE_BRACE() => getToken(dscriptParser.TOKEN_CLOSE_BRACE, 0);
  TerminalNode? ARROW() => getToken(dscriptParser.TOKEN_ARROW, 0);
  DataTypeContext? dataType() => getRuleContext<DataTypeContext>(0);
  List<ParamsContext> paramss() => getRuleContexts<ParamsContext>();
  ParamsContext? params(int i) => getRuleContext<ParamsContext>(i);
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

