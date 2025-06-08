import 'package:test/test.dart';
import 'package:antlr4/antlr4.dart';
import 'package:dscript/dscript.dart';

import 'shared.dart';

void main() {
  test('compile simple expression', () {
    final script = baseRandomScript('return foo * 2.0;');
    final result = analyze(InputStream.fromString(script), [randomContract]);
    expect(result.isSuccess(), isTrue);
    final compiled = compileScript(result.getOrThrow());
    final fn = compiled.implementations['randomNumber']!;
    expect(fn.buffer.toList(), [
      INSTRUCTION_READ,
      0,
      0,
      INSTRUCTION_PUSH_CONSTANT,
      0,
      INSTRUCTION_MUL,
      INSTRUCTION_RETURN,
    ]);
    expect(fn.constants[0], 2.0);
    expect(compiled.permissions, isEmpty);
  });
}
