// Printing for testing purposes
// ignore_for_file: avoid_print

import 'package:antlr4/antlr4.dart';
import 'package:dscript_dart/dscript_dart.dart';
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

  HttpBindings.getBinding.addPreMiddleware(({
    required RuntimeBinding binding,
    required List<dynamic> positionalArgs,
    required Map<Symbol, dynamic> namedArgs,
  }) {
    print('Sending GET request to ${positionalArgs[0]}');
  });

  final code = await InputStream.fromPath('./bin/test.dscript');

  final script = analyze(
    code,
    [
      contract('Random')
          .impl('randomNumber', returnType: PrimitiveType.DOUBLE)
          .param('foo', PrimitiveType.INT)
          .describe('Generates a random number using [foo] as a seed.')
          .end()
          .impl('randomString', returnType: PrimitiveType.STRING)
          .describe('Generates a random string.')
          .end()
          .impl('test', returnType: PrimitiveType.VOID)
          .describe('A test implementation that does nothing.')
          .end()
          .hook('onLogin')
          .param(
            'user',
            const Struct(name: 'User'),
          )
          .describe(
            'Event emitted when a user logs in.',
          )
          .end()
          .hook('onLogout')
          .describe(
            'Event emitted when a user logs out.',
          )
          .end()
          .bind<double>('double', (int x) => x * 2)
          .param('x', PrimitiveType.INT)
          .describe(
            'A simple function that doubles an integer.',
          )
          .permission('math')
          .end()
          .struct('User')
          .field('name', PrimitiveType.STRING)
          .field('id', PrimitiveType.INT)
          .end()
          .build(),
    ],
    ignoreWarnings: true,
  ).getOrThrow();

  final bytecode = compile(script);

  final runtime = Runtime(
    bytecode,
  );

  runtime.grantAll();

  print(await runtime.run(
    'randomNumber',
    args: {'foo': 5},
  ));

  print(await runtime.run(
    'randomNumber',
    args: {'foo': 6},
  ));

  print(await runtime.run(
    'randomNumber',
    args: {'foo': 42},
  ));

  print(await runtime.run(
    'randomString',
  ));
}
