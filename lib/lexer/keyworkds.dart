part of 'lexer.dart';

sealed class KeywordToken extends Token {
  const KeywordToken(super.value);
}

class FinalToken extends KeywordToken {
  const FinalToken() : super('final');
}

class VarToken extends KeywordToken {
  const VarToken() : super('var');
}

class ImplToken extends KeywordToken {
  const ImplToken() : super('impl');
}

class ContractToken extends KeywordToken {
  const ContractToken() : super('contract');
}

class PermissionToken extends KeywordToken {
  const PermissionToken() : super('permissions');
}

class ReturnToken extends KeywordToken {
  const ReturnToken() : super('return');
}

class IfToken extends KeywordToken {
  const IfToken() : super('if');
}

class ElseToken extends KeywordToken {
  const ElseToken() : super('else');
}

class ForToken extends KeywordToken {
  const ForToken() : super('for');
}

class WhileToken extends KeywordToken {
  const WhileToken() : super('while');
}

class BreakToken extends KeywordToken {
  const BreakToken() : super('break');
}

class ContinueToken extends KeywordToken {
  const ContinueToken() : super('continue');
}

class NullToken extends KeywordToken {
  const NullToken() : super('null');
}

class HookToken extends KeywordToken {
  const HookToken() : super('hook');
}
