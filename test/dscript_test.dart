import 'package:test/test.dart';
import 'package:dscript/dscript.dart';

void main() {
  group('Parser', () {
    final parser = Parser();

    test('parses a minimal valid script', () {
      final code = '''
author "Alice";
version "1.2.3";
name "MyScript";
contract MyContract {
  impl foo(int x) -> double {
    return x * 2.0;
  }
  hook onLogin(string username) {
    // no-op
  }
}
''';
      final script = parser.parse(SourceCode(code));
      expect(script.author, equals('Alice'));
      expect(script.version.toString(), equals('1.2.3'));
      expect(script.name, equals('MyScript'));
      expect(script.contract.name, equals('MyContract'));
      expect(script.contract.implementations, hasLength(1));
      expect(script.contract.hooks, hasLength(1));
    });

    test('throws on missing author', () {
      final code = '''
version "1.0.0";
name "NoAuthor";
contract C { impl foo() -> void { return; } }
''';
      expect(
        () => parser.parse(SourceCode(code)),
        throwsA(isA<ParseException>().having((e) => e.message, 'message',
            contains('No author declaration found'))),
      );
    });

    test('throws on nested contracts', () {
      final code = '''
author "A";
version "1.0.0";
name "Nested";
contract A {
  contract B { }
}
''';
      expect(
        () => parser.parse(SourceCode(code)),
        throwsA(isA<ParseException>().having((e) => e.message, 'message',
            contains("Can't declare nested contracts"))),
      );
    });

    test('throws on invalid version format', () {
      final code = '''
author "A";
version "notsemver";
name "X";
contract C { 
  impl foo() -> void { 
    return;  
  } 
}
''';
      expect(
        () => parser.parse(SourceCode(code)),
        throwsA(isA<ParseException>().having(
            (e) => e.message, 'message', contains('Invalid version format'))),
      );
    });
  });

  group('Runtime', () {
    late Script script;
    setUp(() {
      final code = '''
permissions fs::read, http::client;
author "Bob";
version "2.0.0";
name "RT";
contract C {
  impl foo() -> void { return; }
}
''';
      script = Parser().parse(SourceCode(code));
    });

    test('missingPermissions reflects required permissions', () {
      final runtime = Runtime(
        script,
        implementations: script.contract.implementations,
      );
      expect(runtime.missingPermissions, contains(ScriptPermission.readFiles));
      expect(
          runtime.missingPermissions, contains(ScriptPermission.networkClient));
    });

    test('allow grants permission and run succeeds', () {
      final runtime = Runtime(
        script,
        implementations: script.contract.implementations,
      );
      runtime.allow(ScriptPermission.readFiles);
      runtime.allow(ScriptPermission.networkClient);
      expect(runtime.missingPermissions, isEmpty);
      expect(runtime.run('foo', {}), isNull);
    });

    test('run without granting all permissions throws', () {
      final runtime = Runtime(
        script,
        implementations: script.contract.implementations,
      );
      runtime.allow(ScriptPermission.readFiles);
      expect(
        () => runtime.run('foo', {}),
        throwsA(isA<RuntimeException>().having(
            (e) => e.message, 'message', contains('Missing permissions'))),
      );
    });

    test('constructor throws if implementation missing', () {
      expect(
        () => Runtime(script, implementations: []),
        throwsA(isA<RuntimeException>().having((e) => e.message, 'message',
            contains('Script is referencing undefined implementation foo'))),
      );
    });
  });
}
