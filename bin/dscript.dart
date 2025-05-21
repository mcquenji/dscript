// Printing for testing purposes
// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dscript/analyzer/analyzer.dart';
import 'package:dscript/dscript.dart';
import 'package:logging/logging.dart';

void main(List<String> arguments) {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print(record);
  });

  final code = File('./bin/test.dscript').readAsStringSync();

  final src = SourceCode(code);

  final parser = Parser();

  final script = parser.parse(src);

  final runtime = Runtime(
    script,
    contracts: [
      ContractSignature(
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
              const ParameterSignature(
                name: 'username',
                type: PrimitiveType.STRING,
              )
            ],
          ),
          HookSignature(
            name: 'onLogout',
            namedParameters: [],
          ),
        ],
        bindings: ExternalBindings(),
      ),
    ],
  );
  runtime.allow(ScriptPermission.readFiles);
  runtime.allow(ScriptPermission.writeFiles);
  runtime.allow(ScriptPermission.networkClient);
  runtime.allow(ScriptPermission.networkServer);

  print(script.version);
  print(script.author);
  print(script.name);
  print(script.description);
  print(script.license);
  print(script.website);
  print(script.repo);

  print(runtime.run('randomNumber', {'foo': 10}));
}
