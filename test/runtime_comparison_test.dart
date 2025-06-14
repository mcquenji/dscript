import 'package:test/test.dart';
import 'package:antlr4/antlr4.dart';
import 'package:dscript_dart/dscript_dart.dart';

import 'shared.dart';

void main() {
  test('default runtime faster than isolate runtime', () async {
    final script = heavyRandomScript();
    final analysis = analyze(InputStream.fromString(script), [randomContract]);
    expect(analysis.isSuccess(), isTrue);

    final compiled = compile(analysis.getOrThrow());

    final stopwatchDefault = Stopwatch()..start();
    final runtime = Runtime(compiled)..grantAll();
    final valueDefault = await runtime.run('randomNumber', args: {'foo': 0});
    stopwatchDefault.stop();

    final stopwatchIsolate = Stopwatch()..start();
    final isoRuntime = IsolateRuntime(compiled)..grantAll();
    final valueIso = await isoRuntime.run('randomNumber', args: {'foo': 0});
    stopwatchIsolate.stop();

    expect(valueDefault, valueIso);
    print('default runtime: ${stopwatchDefault.elapsedMilliseconds}ms');
    print('isolate runtime: ${stopwatchIsolate.elapsedMilliseconds}ms');
    expect(stopwatchDefault.elapsedMilliseconds, lessThan(500));
    expect(stopwatchIsolate.elapsedMilliseconds, lessThan(500));
  });
}
