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

    final expected = [
      Instruction.pushConstant,
      fn.constants.length - 1,
      Instruction.read,
      1,
      0,
      Instruction.mul,
      Instruction.ret,
    ];

    final actual = fn.buffer.toList();

    final expectedIndex = actual.length - expected.length;

    expect(actual.sublist(expectedIndex), expected);
    expect(fn.constants.last, 2.0);
    expect(compiled.permissions, isEmpty);
  });

  group('loops', () {
    test('for loop compiles', () {
      final script = baseRandomScript(
          'for (var int i; i < 2; i = i + 1) { } return foo * 1.0;');
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isSuccess(), isTrue);
      final compiled = compile(result.getOrThrow());
      final fn = compiled.implementations['randomNumber']!;
      expect(fn.buffer.contains(Instruction.jump), isTrue);
      expect(fn.buffer.contains(Instruction.jumpIfFalse), isTrue);
    });

    test('for-in loop compiles', () {
      final script =
          baseRandomScript('for (var int x in [1, 2]) { } return foo * 1.0;');
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isSuccess(), isTrue);
      final compiled = compile(result.getOrThrow());
      final fn = compiled.implementations['randomNumber']!;
      expect(fn.constants.contains('length'), isTrue);
    });
  });
}
