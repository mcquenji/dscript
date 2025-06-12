import 'package:test/test.dart';
import 'package:antlr4/antlr4.dart';
import 'package:dscript/dscript.dart';

import 'shared.dart';

void main() {
  test('vm executes simple function', () async {
    final script = baseRandomScript('return foo * 2.0;');
    final result = analyze(InputStream.fromString(script), [randomContract]);
    expect(result.isSuccess(), isTrue);

    final compiled = compile(result.getOrThrow());
    final runtime = Runtime(compiled, []);

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
    final runtime = Runtime(compiled, []);

    final value = await runtime.run('randomNumber', args: {'foo': 21});
    expect(value, 441.0);
  });

  test('vm executes external call', () async {
    final script = baseRandomScript('return math::floor(foo * 2.5) * 1.0;');
    final result = analyze(InputStream.fromString(script), [randomContract]);
    expect(result.isSuccess(), isTrue);

    final compiled = compile(result.getOrThrow());
    final runtime = Runtime(compiled, []);

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
    final runtime = Runtime(compiled, []);

    final value = await runtime.run(
      'diff',
      args: {'b': 2, 'a': 5},
    );
    expect(value, 50);
  });
}
