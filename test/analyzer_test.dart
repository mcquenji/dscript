import 'package:test/test.dart';
import 'package:antlr4/antlr4.dart';
import 'package:dscript/dscript.dart';

void main() {
  final contract = ContractSignature(
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
              name: 'username', type: PrimitiveType.STRING),
        ],
      ),
      HookSignature(
        name: 'onLogout',
        namedParameters: [],
      ),
    ],
    bindings: ExternalBindings(),
  );

  group('metadata', () {
    test('Valid script parses correctly', () async {
      final stream = InputStream.fromString('''
      author "McQuenji";
      version 0.0.1;
      name "TestScript";
      description "Random number generator.";
      license "MIT";
      website "https://example.com";
      repo "https://github.com/mcquenji/dscript";

      permissions fs::read, fs::write;
      permissions http::client, http::server;

      contract Random {
        impl randomNumber(int foo) -> double {
          return foo * pi;
        }

        impl randomString() -> string {
          return "Random String";
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
    ''');

      final result = analyze(stream, [contract]);
      expect(result.isSuccess(), isTrue);

      final script = result.getOrThrow();
      expect(script.name, equals('TestScript'));
      expect(script.author, equals('McQuenji'));
      expect(script.permissions, isNotEmpty);
    });

    test('Fails if contract is missing', () async {
      final stream = InputStream.fromString('''
      author "McQuenji";
      version 0.0.1;
      name "TestScript";
      description "Testing missing contract";

      contract Missing {
        impl test() -> void {
          return;
        }
      }
    ''');

      final result = analyze(stream, [contract]);
      expect(result.isError(), isTrue);
      final errors = result.exceptionOrNull();
      expect(errors.toString(), isNotEmpty);
      expect(errors.toString(), contains(isA<ContractDeclarationError>()));
    });

    test('Fails if metadata is missing', () async {
      final stream = InputStream.fromString('''
      contract Random {
        impl test() -> void {
          return;
        }
      }
    ''');

      final result = analyze(stream, [contract]);
      expect(result.isError(), isTrue);
      final errors = result.exceptionOrNull()!.errors;
      expect(errors, contains(isA<RequiredMetadataError>()));
    });
  });

  group('signatures', () {
    test('Fails on impl with missing parameters', () async {
      final stream = InputStream.fromString('''
    author "McQuenji";
    version 0.0.1;
    name "TestScript";
    description "Impl param test";

    contract Random {
      impl randomNumber() -> double {
        return 3.14;
      }

      impl randomString() -> string {
        return "abc";
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
  ''');

      final result = analyze(stream, [contract]);
      expect(result.isError(), isTrue);
      final errors = result.exceptionOrNull();
      expect(errors!.errors, contains(isA<ImplentationDeclarationError>()));
    });

    test('Fails on hook with incorrect parameter type', () async {
      final stream = InputStream.fromString('''
    author "McQuenji";
    version 0.0.1;
    name "TestScript";
    description "Hook param test";

    contract Random {
      impl randomNumber(int foo) -> double {
        return 3.14;
      }

      impl randomString() -> string {
        return "abc";
      }

      impl test() -> void {
        return;
      }

      hook onLogin(int username) {
        return;
      }

      hook onLogout() {
        return;
      }
    }
  ''');

      final result = analyze(stream, [contract]);
      expect(result.isError(), isTrue);
      final errors = result.exceptionOrNull();
      expect(errors!.errors, contains(isA<ArgumentTypeMismatchError>()));
    });
  });

  group('syntax', () {
    test('Fails on missing semicolon', () async {
      final stream = InputStream.fromString('''
    author "McQuenji"
    version 0.0.1;
    name "TestScript";
    description "Missing semicolon";

    contract Random {
      impl test() -> void {
        return;
      }

      hook onLogout() {
        return;
      }
    }
  ''');

      final result = analyze(stream, [contract]);
      expect(result.isError(), isTrue);
      final errors = result.exceptionOrNull();
      expect(errors?.errors ?? [], contains(isA<SyntaxError>()));
    });

    test('Fails on unexpected token', () async {
      final stream = InputStream.fromString('''
    author "McQuenji";
    version 0.0.1;
    name "TestScript";
    description "Unexpected token";

    contract Random {
      impl test() -> void {
        final int x = 5
        return;
      }

      hook onLogout() {
        return;
      }
    }
  ''');

      final result = analyze(stream, [contract]);
      expect(result.isError(), isTrue);
      final errors = result.exceptionOrNull();
      expect(errors?.errors ?? [], contains(isA<SyntaxError>()));
    });

    test('Fails on unterminated block', () async {
      final stream = InputStream.fromString('''
    author "McQuenji";
    version 0.0.1;
    name "TestScript";
    description "Unterminated block";

    contract Random {
      impl test() -> void {
        var int x = 1;
        if (x > 0) {
          x = x + 1;
      }

      hook onLogout() {
        return;
      }
    }
  ''');

      final result = analyze(stream, [contract]);
      expect(result.isError(), isTrue);
      final errors = result.exceptionOrNull();
      expect(errors?.errors ?? [], contains(isA<SyntaxError>()));
    });
  });
}
