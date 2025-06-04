import 'package:test/test.dart';
import 'package:antlr4/antlr4.dart';
import 'package:dscript/dscript.dart';
import 'package:dscript/src/compiler/instruction.dart';

void main() {
  // Reuse the Random contract from analyzer tests.
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
    final instr = compiled.implementations['randomNumber']!;
    expect(instr.length, 4);
    expect(instr[0].op, OpCode.loadVar);
    expect(instr[1].op, OpCode.pushConst);
    expect(instr[2].op, OpCode.mul);
    expect(instr[3].op, OpCode.ret);
  });
}
