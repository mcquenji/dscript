import 'package:test/test.dart';
import 'package:antlr4/antlr4.dart';
import 'package:dscript/dscript.dart';
import 'package:dscript/src/compiler/instructions.dart';

void main() {
  final randomContract = ContractSignature(
    name: 'Random',
    implementations: [
      ImplementationSignature(
        name: 'randomNumber',
        namedParameters: [
          const ParameterSignature(name: 'foo', type: PrimitiveType.INT)
        ],
        returnType: PrimitiveType.DOUBLE,
      ),
      ImplementationSignature(
        name: 'randomString',
        namedParameters: [],
        returnType: PrimitiveType.STRING,
      ),
      ImplementationSignature(
        name: 'test',
        namedParameters: [],
        returnType: PrimitiveType.VOID,
      ),
    ],
    hooks: [
      HookSignature(
        name: 'onLogin',
        namedParameters: [
          const ParameterSignature(name: 'username', type: PrimitiveType.STRING)
        ],
      ),
      HookSignature(name: 'onLogout', namedParameters: []),
    ],
    bindings: ExternalBindings(),
  );

  String baseRandomScript(String body) => '''
author "A";
version 1.0.0;
name "S";
description "D";
contract Random {
  impl randomNumber(int foo) -> double {
    $body
  }
  impl randomString() -> string {
    return "STR";
  }
  impl test() -> void {
    return;
  }
  hook onLogin(string username) {
    return;
  }
  hook onLogout() {
    return;
  }
}
''';

  test('compile simple expression', () {
    final script = baseRandomScript('return foo * 2.0;');
    final result = analyze(InputStream.fromString(script), [randomContract]);
    expect(result.isSuccess(), isTrue);
    final compiled = compileScript(result.getOrThrow());
    final fn = compiled.implementations['randomNumber']!;
    expect(fn.buffer.toList(), [
      0,
      0,
      INSTRUCTION_READ,
      0,
      INSTRUCTION_PUSH_CONSTANT,
      INSTRUCTION_MUL,
      INSTRUCTION_RETURN,
    ]);
    expect(fn.constants[0], 2.0);
    expect(compiled.permissions, isEmpty);
  });
}
