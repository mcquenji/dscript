import 'package:dscript_dart/dscript_dart.dart';

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
  structs: const [
    Struct(name: 'User', fields: {
      'name': PrimitiveType.STRING,
      'id': PrimitiveType.INT,
    }),
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
