import 'package:test/test.dart';
import 'package:antlr4/antlr4.dart';
import 'package:dscript_dart/dscript_dart.dart';

import 'shared.dart';

void main() {
  test('runtime executes under 200ms', () async {
    final script = baseRandomScript('return foo * 2.0;');
    final analysis = analyze(InputStream.fromString(script), [randomContract]);
    expect(analysis.isSuccess(), isTrue);

    final sw = Stopwatch()..start();
    final compiled = compile(analysis.getOrThrow());
    final runtime = Runtime(compiled)..grantAll();

    final value = await runtime.run('randomNumber', args: {'foo': 21});
    sw.stop();

    expect(value, 42.0);
    print('compile + run took ${sw.elapsedMilliseconds}ms');
    expect(sw.elapsedMilliseconds, lessThan(200));
  });

  test('heavy script executes under 500ms', () async {
    final script = heavyRandomScript();
    final analysis = analyze(InputStream.fromString(script), [randomContract]);
    if (!analysis.isSuccess()) {
      print(analysis.exceptionOrNull()?.errors);
    }
    expect(analysis.isSuccess(), isTrue);

    final sw = Stopwatch()..start();
    final compiled = compile(analysis.getOrThrow());
    final runtime = Runtime(compiled)..grantAll();

    final value = await runtime.run('randomNumber', args: {'foo': 0});
    sw.stop();

    expect(value, isA<double>());
    print('heavy run took ${sw.elapsedMilliseconds}ms');
    expect(sw.elapsedMilliseconds, lessThan(500));
  });
}
