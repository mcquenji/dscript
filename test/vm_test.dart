import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:antlr4/antlr4.dart';
import 'package:dscript_dart/dscript_dart.dart';

import 'shared.dart';

void main() {
  test('vm executes simple function', () async {
    final script = baseRandomScript('return foo * 2.0;');
    final result = analyze(InputStream.fromString(script), [randomContract]);
    expect(result.isSuccess(), isTrue);

    final compiled = compile(result.getOrThrow());
    final runtime = Runtime(compiled);

    final value = await runtime.run('randomNumber', args: {'foo': 21});
    expect(value, 42.0);
  });

  test('vm executes internal function call', () async {
    final script = '''
author "A";
version 1.0.0;
name "S";
description "D";
contract Random {
  func square(int x) -> int { return x * x; }
  impl randomNumber(int foo) -> double {
    final int y = square(foo);
    return y * 1.0;
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
    final runtime = Runtime(compiled);

    final value = await runtime.run('randomNumber', args: {'foo': 21});
    expect(value, 441.0);
  });

  test('vm executes external call', () async {
    final script = baseRandomScript('return math::floor(foo * 2.5) * 1.0;');
    final result = analyze(InputStream.fromString(script), [randomContract]);
    expect(result.isSuccess(), isTrue);

    final compiled = compile(result.getOrThrow());
    final runtime = Runtime(compiled);

    final value = await runtime.run('randomNumber', args: {'foo': 21});
    expect(value, 52.0);
  });

  test('named arguments work regardless of order', () async {
    final script = '''
author "A";
version 1.0.0;
name "S";
description "D";
contract Pair {
  impl diff(int a, int b) -> int {
    return a *10;
  }
}
''';

    final contract = ContractSignature(
      name: 'Pair',
      implementations: [
        ImplementationSignature(
          name: 'diff',
          namedParameters: [
            const ParameterSignature(name: 'a', type: PrimitiveType.INT),
            const ParameterSignature(name: 'b', type: PrimitiveType.INT),
          ],
          returnType: PrimitiveType.INT,
        ),
      ],
      hooks: const [],
      bindings: ExternalBindings(),
    );

    final result = analyze(InputStream.fromString(script), [contract]);
    expect(result.isSuccess(), isTrue);

    final compiled = compile(result.getOrThrow());
    final runtime = Runtime(compiled);

    final value = await runtime.run(
      'diff',
      args: {'b': 2, 'a': 5},
    );
    expect(value, 50);
  });

  test('vm handles map property read and write', () async {
    final fn = BytecodeFunction(
      Uint64List.fromList([
        Instruction.pushConstant,
        0,
        Instruction.pushConstant,
        1,
        Instruction.map,
        1,
        Instruction.store,
        1,
        0,
        Instruction.pushConstant,
        2,
        Instruction.read,
        1,
        0,
        Instruction.writeProperty,
        0,
        Instruction.read,
        1,
        0,
        Instruction.readProperty,
        0,
        Instruction.ret,
      ]),
      ['x', 1, 2],
    );

    final vm = DefaultVM(fn);
    final value = await vm.exec();
    expect(value, 2);
  });

  test('vm handles list element operations', () async {
    final fn = BytecodeFunction(
      Uint64List.fromList([
        Instruction.pushConstant,
        0,
        Instruction.pushConstant,
        1,
        Instruction.pushConstant,
        2,
        Instruction.array,
        3,
        Instruction.store,
        1,
        0,
        Instruction.read,
        1,
        0,
        Instruction.pushConstant,
        1,
        Instruction.pushConstant,
        3,
        Instruction.writeElement,
        Instruction.read,
        1,
        0,
        Instruction.pushConstant,
        1,
        Instruction.readElement,
        Instruction.pushConstant,
        4,
        Instruction.mul,
        Instruction.ret,
      ]),
      [1, 2, 3, 5, 1.0],
    );

    final vm = DefaultVM(fn);
    final value = await vm.exec();
    expect(value, 5.0);
  });

  test('vm executes bitwise operations', () async {
    final fn = BytecodeFunction(
      Uint64List.fromList([
        Instruction.pushConstant,
        0,
        Instruction.pushConstant,
        1,
        Instruction.shl,
        Instruction.pushConstant,
        1,
        Instruction.shr,
        Instruction.pushConstant,
        2,
        Instruction.bitwiseAnd,
        Instruction.pushConstant,
        3,
        Instruction.bitwiseOr,
        Instruction.pushConstant,
        1,
        Instruction.bitwiseXor,
        Instruction.inc,
        Instruction.dec,
        Instruction.ret,
      ]),
      [5, 1, 3, 8],
    );

    final vm = DefaultVM(fn);
    final value = await vm.exec();
    expect(value, 9);
  });

  test('vm handles try-catch blocks', () async {
    final script = baseRandomScript(
        'try { throw "err"; return foo * 2.0; } catch (e) { return foo * 3.0; }');
    final result = analyze(InputStream.fromString(script), [randomContract]);
    expect(result.isSuccess(), isTrue);

    final compiled = compile(result.getOrThrow());
    final runtime = Runtime(compiled);

    final value = await runtime.run('randomNumber', args: {'foo': 21});
    expect(value, 63.0);
  });
}
