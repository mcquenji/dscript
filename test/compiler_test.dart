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
  group('if statements', () {
    test('if-else compiles to conditional jump', () {
      final script = baseRandomScript(
          'if (foo > 0) { return foo * 2.0; } else { return 0.0; }');
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isSuccess(), isTrue);
      final compiled = compile(result.getOrThrow());
      final fn = compiled.implementations['randomNumber']!;
      expect(fn.buffer.contains(Instruction.jumpIfFalse), isTrue);
      // Should emit two return instructions for both branches
      final retCount = fn.buffer.where((e) => e == Instruction.ret).length;
      expect(retCount, 2);
    });

    test('else-if chain emits multiple conditional jumps', () {
      final script = baseRandomScript(
          'if (foo > 0) { return 1.0; } else if (foo == 0) { return 0.0; } else { return -1.0; }');
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isSuccess(), isTrue);
      final compiled = compile(result.getOrThrow());
      final fn = compiled.implementations['randomNumber']!;
      final jumpCount =
          fn.buffer.where((e) => e == Instruction.jumpIfFalse).length;
      expect(jumpCount, 2);
      final retCount = fn.buffer.where((e) => e == Instruction.ret).length;
      expect(retCount, 3);
    });
  });

  group('external calls', () {
    test('calls to stdlib emit externalCall instruction', () {
      final script = baseRandomScript('math::floor(3.7); return foo * 2.0;');
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isSuccess(), isTrue);
      final compiled = compile(result.getOrThrow());
      final fn = compiled.implementations['randomNumber']!;
      expect(fn.buffer.contains(Instruction.externalCall), isTrue);
      expect(fn.constants.contains('math'), isTrue);
      expect(fn.constants.contains('floor'), isTrue);
    });

    test('multiple external calls are compiled', () {
      final script = baseRandomScript(
          'math::floor(3.7); log::info("x"); return foo * 2.0;');
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isSuccess(), isTrue);
      final compiled = compile(result.getOrThrow());
      final fn = compiled.implementations['randomNumber']!;
      final callCount =
          fn.buffer.where((e) => e == Instruction.externalCall).length;
      expect(callCount, 2);
      expect(fn.constants.contains('log'), isTrue);
      expect(fn.constants.contains('info'), isTrue);
    });
  });

  group('object literals', () {
    test('struct instantiation emits structFromMap', () {
      final script = baseRandomScript(
          'final User u = @User { name: "Alice", id: 1 }; return foo * 1.0;');
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isSuccess(), isTrue);
      final compiled = compile(result.getOrThrow());
      final fn = compiled.implementations['randomNumber']!;
      expect(fn.buffer.contains(Instruction.structFromMap), isTrue);
    });

    test('multiple struct instantiations emit correct instructions', () {
      final script = baseRandomScript(
          'final User a = @User { name: "Bob", id: 2 }; final User b = @User { name: "Carol", id: 3 }; return foo * 1.0;');
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isSuccess(), isTrue);
      final compiled = compile(result.getOrThrow());
      final fn = compiled.implementations['randomNumber']!;
      final count =
          fn.buffer.where((e) => e == Instruction.structFromMap).length;
      expect(count, 2);
    });
  });

  group('loops', () {
    test('while loop supports break and continue', () {
      final script = baseRandomScript(
          'var int i = 0; while (i < 3) { i = i + 1; if (i == 1) { continue; } break; } return foo * 1.0;');
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isSuccess(), isTrue);
      final compiled = compile(result.getOrThrow());
      final fn = compiled.implementations['randomNumber']!;
      final jumpCount = fn.buffer.where((e) => e == Instruction.jump).length;
      expect(jumpCount >= 3, isTrue);
      final condCount =
          fn.buffer.where((e) => e == Instruction.jumpIfFalse).length;
      expect(condCount, 2);
    });

    test('for loop with break and continue emits jumps', () {
      final script = baseRandomScript(
          'for (var int i; i < 3; i = i + 1) { if (i == 1) { continue; } break; } return foo * 1.0;');
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isSuccess(), isTrue);
      final compiled = compile(result.getOrThrow());
      final fn = compiled.implementations['randomNumber']!;
      final jumpCount = fn.buffer.where((e) => e == Instruction.jump).length;
      expect(jumpCount >= 3, isTrue);
      final condCount =
          fn.buffer.where((e) => e == Instruction.jumpIfFalse).length;
      expect(condCount, 2);
    });
  });

  group('function calls', () {
    test('internal function call emits call instruction', () {
      final script = '''
author "A";
version 1.0.0;
name "S";
description "D";
contract Random {
  func bar() -> void { return; }
  impl randomNumber(int foo) -> double {
    bar();
    return foo * 2.0;
  }
  impl randomString() -> string { return ""; }
  impl test() -> void { return; }
  hook onLogin(string username) { return; }
  hook onLogout() { return; }
}
''';
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isSuccess(), isTrue);
      final compiled = compile(result.getOrThrow());
      final fn = compiled.implementations['randomNumber']!;
      expect(fn.buffer.contains(Instruction.call), isTrue);
      expect(fn.constants.contains('bar'), isTrue);
    });

    test('internal call with argument compiles correctly', () {
      final script = '''
author "A";
version 1.0.0;
name "S";
description "D";
contract Random {
  func square(int x) -> int { return x * x; }
  impl randomNumber(int foo) -> double {
    final int y = square(foo);
    return y * 2.0;
  }
  impl randomString() -> string { return ""; }
  impl test() -> void { return; }
  hook onLogin(string username) { return; }
  hook onLogout() { return; }
}
''';
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isSuccess(), isTrue);
      final compiled = compile(result.getOrThrow());
      final fn = compiled.implementations['randomNumber']!;
      expect(fn.buffer.contains(Instruction.call), isTrue);
      expect(fn.constants.contains('square'), isTrue);
    });
  });
}
