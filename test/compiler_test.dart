import 'package:test/test.dart';
import 'package:antlr4/antlr4.dart';
import 'package:dscript/dscript.dart';

import 'shared.dart';

void main() {
  test('compile simple expression', () {
    final script = baseRandomScript('return foo * 2.0;');
    final result = analyze(InputStream.fromString(script), [randomContract]);
    expect(result.isSuccess(), isTrue);
    final compiled = compile(result.getOrThrow());
    final fn = compiled.implementations['randomNumber']!;
    expect(fn.buffer.toList(), [
      Instruction.read,
      1,
      0,
      Instruction.pushConstant,
      0,
      Instruction.mul,
      Instruction.ret,
    ]);
    expect(fn.constants[0], 2.0);
    expect(compiled.permissions, isEmpty);
  });
}
