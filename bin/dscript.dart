// Printing for testing purposes
// ignore_for_file: avoid_print

import 'package:antlr4/antlr4.dart';
import 'package:dscript/dscript.dart';
import 'package:logging/logging.dart';

void main(List<String> arguments) async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    final errorstr = record.error != null ? record.error.toString() : '';
    final stackTracestr = record.stackTrace != null
        ? record.stackTrace.toString().replaceAll('\n', '\n\t')
        : '';

    final msg = record.toString();

    print(
      '${record.time.toIso8601String()}: $msg${errorstr.isEmpty ? '' : ' '}$errorstr${stackTracestr.isEmpty ? '' : '\n\t'}$stackTracestr',
    );
  });

  final code = await InputStream.fromPath('./bin/test.dscript');

  final script = analyze(
    code,
    [
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
  ).getOrThrow();

  print('Author: ${script.author}');
  print('Name: ${script.name}');
  print('Version: ${script.version}');
  print('Description: ${script.description}');

  // final runtime = Runtime(
  //   script,
  //   contracts: [
  //     ContractSignature(
  //       name: 'Random',
  //       implementations: [
  //         ImplementationSignature(
  //           name: 'randomNumber',
  //           namedParameters: [
  //             const ParameterSignature(name: 'foo', type: PrimitiveType.INT)
  //           ],
  //           returnType: PrimitiveType.DOUBLE,
  //         ),
  //         ImplementationSignature(
  //           name: 'randomString',
  //           namedParameters: [],
  //           returnType: PrimitiveType.STRING,
  //         ),
  //         ImplementationSignature(
  //           name: 'test',
  //           namedParameters: [],
  //           returnType: PrimitiveType.VOID,
  //         ),
  //       ],
  //       hooks: [
  //         HookSignature(
  //           name: 'onLogin',
  //           namedParameters: [
  //             const ParameterSignature(
  //               name: 'username',
  //               type: PrimitiveType.STRING,
  //             )
  //           ],
  //         ),
  //         HookSignature(
  //           name: 'onLogout',
  //           namedParameters: [],
  //         ),
  //       ],
  //       bindings: ExternalBindings(),
  //     ),
  //   ],
  // );
  // runtime.allow(ScriptPermission.readFiles);
  // runtime.allow(ScriptPermission.writeFiles);
  // runtime.allow(ScriptPermission.networkClient);
  // runtime.allow(ScriptPermission.networkServer);

  // print(script.version);
  // print(script.author);
  // print(script.name);
  // print(script.description);
  // print(script.license);
  // print(script.website);
  // print(script.repo);

  // print(runtime.run('randomNumber', {'foo': 10}));
}
