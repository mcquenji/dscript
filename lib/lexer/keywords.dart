part of 'lexer.dart';

sealed class KeywordToken extends Token {
  const KeywordToken(super.value, {super.line, super.column});
}

class FinalToken extends KeywordToken {
  const FinalToken({super.line, super.column}) : super('final');
}

class VarToken extends KeywordToken {
  const VarToken({super.line, super.column}) : super('var');
}

class ImplToken extends KeywordToken {
  const ImplToken({super.line, super.column}) : super('impl');
}

class ContractToken extends KeywordToken {
  const ContractToken({super.line, super.column}) : super('contract');
}

class PermissionToken extends KeywordToken {
  const PermissionToken({super.line, super.column}) : super('permissions');
}

class ReturnToken extends KeywordToken {
  const ReturnToken({super.line, super.column}) : super('return');
}

class IfToken extends KeywordToken {
  const IfToken({super.line, super.column}) : super('if');
}

class ElseToken extends KeywordToken {
  const ElseToken({super.line, super.column}) : super('else');
}

class ForToken extends KeywordToken {
  const ForToken({super.line, super.column}) : super('for');
}

class WhileToken extends KeywordToken {
  const WhileToken({super.line, super.column}) : super('while');
}

class BreakToken extends KeywordToken {
  const BreakToken({super.line, super.column}) : super('break');
}

class ContinueToken extends KeywordToken {
  const ContinueToken({super.line, super.column}) : super('continue');
}

class NullToken extends KeywordToken {
  const NullToken({super.line, super.column}) : super('null');
}

class HookToken extends KeywordToken {
  const HookToken({super.line, super.column}) : super('hook');
}
