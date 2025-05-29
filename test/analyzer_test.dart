import 'package:test/test.dart';
import 'package:antlr4/antlr4.dart';
import 'package:dscript/dscript.dart';

void main() {
  // The canonical Random contract signature used for most tests.
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

  // Helper to create a full script with a customized body for randomNumber.
  String baseRandomScript(String body) => '''
author "McQuenji";
version 0.0.1;
name "TestScript";
description "Test Script";
license "MIT";
website "https://example.com";
repo "https://github.com/mcquenji/dscript";
permissions fs::read, fs::write;
permissions http::client, http::server;

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

  group('bindings', () {
    test('valid stdlib call', () {
      final script = baseRandomScript('math::floor(3.7); return foo * 1.0;');
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isSuccess(), isTrue);
    });

    test('unknown namespace', () {
      final script = baseRandomScript('foo::bar(1); return foo * 1.0;');
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(
          isA<SemanticError>().having(
            (e) => e.message,
            'message',
            contains('No such namespace'),
          ),
        ),
      );
    });

    test('unknown function in a valid namespace', () {
      final script = baseRandomScript('math::unknown(1); return foo * 1.0;');
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(
          isA<SemanticError>().having(
            (e) => e.message,
            'message',
            contains('No such function'),
          ),
        ),
      );
    });

    test('invalid positional param type', () {
      final script = baseRandomScript('math::floor(true); return foo * 1.0;');
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(isA<ArgumentTypeMismatchError>()),
      );
    });

    test('missing custom permission for external binding', () {
      // A small contract that defines a custom external binding requiring
      // `external::custom` permission, but the script omits it.
      final bindContract = contract('BindTest')
          .bind<double>('testBind', (int x) => x * 2)
          .param(PrimitiveType.INT)
          .permission('custom')
          .end()
          .impl('useBind', returnType: PrimitiveType.DOUBLE)
          .param('x', PrimitiveType.INT)
          .end()
          .hook('onInit')
          .param('x', PrimitiveType.INT)
          .end()
          .build();

      final script = '''
author "Me";
version 1.0.0;
name "B";
description "Missing custom permission";
contract BindTest {
  impl useBind(int x) -> double {
    external::testBind(x);
  }
  hook onInit(int x) {}
}
''';
      final result = analyze(InputStream.fromString(script), [bindContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(
          isA<SemanticError>().having(
            (e) => e.message,
            'message',
            contains('Missing permission'),
          ),
        ),
      );
    });
  });

  group('syntax errors', () {
    test('missing semicolon after metadata', () {
      final script = '''
author "McQuenji"
version 0.0.1;
name "TestScript";
description "Oops missing semicolon";
contract Random {
  impl test() -> void {
    return;
  }
  hook onLogout() {}
}
''';
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(
          isA<SyntaxError>(),
        ),
      );
    });
  });

  group('unknown contract', () {
    test('script names a non-existent contract', () {
      final script = '''
author "McQuenji";
version 0.0.1;
name "TestScript";
description "Wrong contract";
contract NotRandom {
  impl test() -> void { return; }
  hook onLogout() {}
}
''';
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(
          isA<ContractDeclarationError>(),
        ),
      );
    });
  });

  group('valid contract', () {
    test('complete Random script parses cleanly', () {
      final script = baseRandomScript('return foo * 2.0;');
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isSuccess(), isTrue);
    });
  });

  group('impls', () {
    test('missing all impls', () {
      final script = '''
author "X";
version 1.0.0;
name "Y";
description "No impls";
contract Random {
  hook onLogin(string username) {}
  hook onLogout() {}
}
''';
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(
          isA<ContractDeclarationError>().having(
            (e) => e.message,
            'message',
            contains('missing implementations'),
          ),
        ),
      );
    });

    test('impl with wrong number of parameters', () {
      final script = '''
author "M";
version 2.0.0;
name "N";
description "Param count";
contract Random {
  impl randomNumber() -> double { return 0.0; }
  impl randomString() -> string { return ""; }
  impl test() -> void { return; }
  hook onLogin(string username) {}
  hook onLogout() {}
}
''';
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(
          isA<ImplentationDeclarationError>(),
        ),
      );
    });

    test('impl with invalid return declaration', () {
      final script = '''
author "M";
version 2.0.0;
name "N";
description "Return type mismatch";
contract Random {
  impl randomNumber(int foo) -> string { return ""; }
  impl randomString() -> string { return ""; }
  impl test() -> void { return; }
  hook onLogin(string username) {}
  hook onLogout() {}
}
''';
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(
          isA<ImplentationDeclarationError>(),
        ),
      );
    });
  });

  group('hooks', () {
    test('undefined hook', () {
      final script = '''
author "A";
version 1.0.0;
name "T";
description "Bad hook";
contract Random {
  impl randomNumber(int foo) -> double { return foo * 1.0; }
  impl randomString() -> string { return ""; }
  impl test() -> void { return; }
  hook onStart() {}
}
''';
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(
          isA<HookDeclarationError>(),
        ),
      );
    });

    test('hook with wrong parameter type', () {
      final script = '''
author "A";
version 1.0.0;
name "T";
description "Type mismatch";
contract Random {
  impl randomNumber(int foo) -> double { return foo * 1.0; }
  impl randomString() -> string { return ""; }
  impl test() -> void { return; }
  hook onLogin(int username) {}
  hook onLogout() {}
}
''';
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(
          isA<ArgumentTypeMismatchError>(),
        ),
      );
    });
  });

  group('function return types', () {
    test('missing return in non-void impl', () {
      final script = '''
author "A";
version 1.0.0;
name "T";
description "No return";
contract Random {
  impl randomNumber(int foo) -> double {}
  impl randomString() -> string { return ""; }
  impl test() -> void { return; }
  hook onLogin(string username) {}
  hook onLogout() {}
}
''';
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(
          isA<SemanticError>().having(
            (e) => e.message,
            'message',
            contains('does not return a value'),
          ),
        ),
      );
    });

    test('returning value from void impl', () {
      final script = '''
author "A";
version 1.0.0;
name "T";
description "Extra return";
contract Random {
  impl randomNumber(int foo) -> double { return foo * 1.0; }
  impl randomString() -> string { return ""; }
  impl test() -> void { return 42; }
  hook onLogin(string username) {}
  hook onLogout() {}
}
''';
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(
          isA<SemanticError>().having(
            (e) => e.message,
            'message',
            contains('Cannot return a value from a void function'),
          ),
        ),
      );
    });
  });

  group('variables', () {
    test('type mismatch in declaration', () {
      final script = '''
author "A";
version 1.0.0;
name "T";
description "Bad var";
contract Random {
  impl randomNumber(int foo) -> double {
    final int x = "oops";
    return foo * 1.0;
  }
  impl randomString() -> string { return ""; }
  impl test() -> void { return; }
  hook onLogin(string username) {}
  hook onLogout() {}
}
''';
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(
          isA<SemanticError>(),
        ),
      );
    });

    test('immutable non-nullable without initializer', () {
      final script = '''
author "A";
version 1.0.0;
name "T";
description "No init";
contract Random {
  impl randomNumber(int foo) -> double {
    final int? x;
    return foo * 1.0;
  }
  impl randomString() -> string { return ""; }
  impl test() -> void { return; }
  hook onLogin(string username) {}
  hook onLogout() {}
}
''';
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(
          isA<SemanticWarning>().having(
            (e) => e.message,
            'message',
            contains('should have an initializer'),
          ),
        ),
      );
    });
  });

  group('external calls', () {
    test('calling undefined external function', () {
      final ecContract = contract('EC')
          .bind<double>('foo', (int x) => x.toDouble())
          .param(PrimitiveType.INT)
          .permission('fooPerm')
          .end()
          .impl('ecImpl', returnType: PrimitiveType.DOUBLE)
          .param('x', PrimitiveType.INT)
          .end()
          .hook('onEC')
          .end()
          .build();

      final script = '''
author "Me";
version 1.0.0;
name "EC";
description "Bad external";
contract EC {
  impl ecImpl(int x) -> double {
    external::bar(x);
    return x;
  }
  hook onEC() {}
}
''';
      final result = analyze(InputStream.fromString(script), [ecContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(
          isA<SemanticError>().having(
            (e) => e.message,
            'message',
            contains('No such function'),
          ),
        ),
      );
    });

    test('calling external function with invalid parameter types', () {
      final ecContract = contract('EC')
          .bind<double>('foo', (int x) => x.toDouble())
          .param(PrimitiveType.INT)
          .end()
          .impl('ecImpl', returnType: PrimitiveType.DOUBLE)
          .param('x', PrimitiveType.INT)
          .end()
          .hook('onEC')
          .end()
          .build();

      final script = '''
author "Me";
version 1.0.0;
name "EC";
description "Bad external";
contract EC {
  impl ecImpl(int x) -> double {
    external::foo(true); // Invalid type
    return x;
  }
  hook onEC() {}
}
''';
      final result = analyze(InputStream.fromString(script), [ecContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(
          isA<ArgumentTypeMismatchError>().having(
            (e) => e.message,
            'message',
            contains("can't be assigned to the parameter type"),
          ),
        ),
      );
    });

    test('calling external function with missing parameters', () {
      final ecContract = contract('EC')
          .bind<double>('foo', (int x) => x.toDouble())
          .param(PrimitiveType.INT)
          .end()
          .impl('ecImpl', returnType: PrimitiveType.DOUBLE)
          .param('x', PrimitiveType.INT)
          .end()
          .hook('onEC')
          .end()
          .build();

      final script = '''
author "Me";
version 1.0.0;
name "EC";
description "Bad external";
contract EC {
  impl ecImpl(int x) -> double {
    external::foo(); // Missing parameter
    return x;
  }
  hook onEC() {}
}
''';
      final result = analyze(InputStream.fromString(script), [ecContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(
          isA<PositionalArgumentError>().having(
            (e) => e.message,
            'message',
            contains('0 found'),
          ),
        ),
      );
    });

    test('calling external function without defining permissions', () {
      final ecContract = contract('EC')
          .bind<double>('foo', (int x) => x.toDouble())
          .param(PrimitiveType.INT)
          .permission('fooPerm')
          .end()
          .impl('ecImpl', returnType: PrimitiveType.DOUBLE)
          .param('x', PrimitiveType.INT)
          .end()
          .hook('onEC')
          .end()
          .build();

      final script = '''
author "Me";
version 1.0.0;
name "EC";
description "Bad external";
contract EC {
  impl ecImpl(int x) -> double {
    return external::foo(x);
  }
  hook onEC() {}
}
''';
      final result = analyze(InputStream.fromString(script), [ecContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(
          isA<PermissionError>().having(
            (e) => e.message,
            'message',
            contains('Missing permission'),
          ),
        ),
      );
    });

    test('calling external function in undefined namespace', () {
      final ecContract = contract('EC')
          .bind<double>('foo', (int x) => x.toDouble())
          .param(PrimitiveType.INT)
          .permission('fooPerm')
          .end()
          .impl('ecImpl', returnType: PrimitiveType.DOUBLE)
          .param('x', PrimitiveType.INT)
          .end()
          .hook('onEC')
          .end()
          .build();

      final script = '''
author "Me";
version 1.0.0;
name "EC";
description "Bad external";
contract EC {
  impl ecImpl(int x) -> double {
    return test::foo(x);
  }
  hook onEC() {}
}
''';
      final result = analyze(InputStream.fromString(script), [ecContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(
          isA<UndefinedNamespaceError>().having(
            (e) => e.message,
            'message',
            contains('No such namespace'),
          ),
        ),
      );
    });
    test('calling undefined external function ', () {
      final ecContract = contract('EC')
          .bind<double>('foo', (int x) => x.toDouble())
          .param(PrimitiveType.INT)
          .permission('fooPerm')
          .end()
          .impl('ecImpl', returnType: PrimitiveType.DOUBLE)
          .param('x', PrimitiveType.INT)
          .end()
          .hook('onEC')
          .end()
          .build();

      final script = '''
author "Me";
version 1.0.0;
name "EC";
description "Bad external";
contract EC {
  impl ecImpl(int x) -> double {
    return external::bar(x);
  }
  hook onEC() {}
}
''';
      final result = analyze(InputStream.fromString(script), [ecContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(
          isA<UndefinedExternalFunctionError>().having(
            (e) => e.message,
            'message',
            contains("is not defined in the 'external' namespace"),
          ),
        ),
      );
    });
  });
}
