import 'package:test/test.dart';
import 'package:antlr4/antlr4.dart';
import 'package:dscript_dart/dscript_dart.dart';

import 'shared.dart';

void main() {
  test('runtime enforces permissions', () async {
    final script = '''
author "A";
version 1.0.0;
name "S";
description "D";
permissions fs::read;
contract Random {
  impl randomNumber(int foo) -> double { return foo * 1.0; }
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

    expect(() => runtime.run('randomNumber'), throwsStateError);
  });

  test('runtime.grantAll allows execution', () async {
    final script = '''
author "A";
version 1.0.0;
name "S";
description "D";
permissions fs::read;
contract Random {
  impl randomNumber(int foo) -> double { return foo * 2.0; }
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
    runtime.grantAll();
    final value = await runtime.run('randomNumber', args: {'foo': 2});
    expect(value, 4.0);
  });

  test('emit is a no-op when hook not implemented', () async {
    final script = '''
author "A";
version 1.0.0;
name "S";
description "D";
contract Random {
  impl randomNumber(int foo) -> double { return foo * 1.0; }
  impl randomString() -> string { return ""; }
  impl test() -> void { return; }
}
''';
    final result = analyze(InputStream.fromString(script), [randomContract]);
    expect(result.isSuccess(), isTrue);

    final compiled = compile(result.getOrThrow());
    final runtime = Runtime(compiled);

    await runtime.emit('onLogin', args: {'username': 'bob'});
  });

  test('unknown implementation throws', () async {
    final script = baseRandomScript('return foo * 1.0;');
    final result = analyze(InputStream.fromString(script), [randomContract]);
    expect(result.isSuccess(), isTrue);

    final compiled = compile(result.getOrThrow());
    final runtime = Runtime(compiled);

    expect(() => runtime.run('nope'), throwsArgumentError);
  });

  test('unknown hook throws', () async {
    final script = baseRandomScript('return foo * 1.0;');
    final result = analyze(InputStream.fromString(script), [randomContract]);
    expect(result.isSuccess(), isTrue);

    final compiled = compile(result.getOrThrow());
    final runtime = Runtime(compiled);

    expect(() => runtime.emit('nope'), throwsArgumentError);
  });
}
