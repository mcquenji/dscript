import 'package:test/test.dart';
import 'package:antlr4/antlr4.dart';
import 'package:dscript_dart/dscript_dart.dart';

import 'shared.dart';

void main() {
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
          isA<UndefinedExternalFunctionError>().having(
            (e) => e.message,
            'message',
            contains('is not defined in the'),
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

  group('flow control', () {
    test('if condition not boolean', () {
      final script =
          baseRandomScript('if (5) { return foo * 1.0; } else { return 0.0; }');
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(
          isA<TypeError>().having(
            (e) => e.message,
            'message',
            contains('Expected type bool'),
          ),
        ),
      );
    });

    test('while condition not boolean', () {
      final script =
          baseRandomScript('while (foo) { break; } return foo * 1.0;');
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(
          isA<TypeError>().having(
            (e) => e.message,
            'message',
            contains('Expected type bool'),
          ),
        ),
      );
    });

    test('return propagation in try-catch', () {
      final script = baseRandomScript('''
        try {
          return foo * 1.0;
        } catch (e) {
          return 0.0;
        }
      ''');
      final result = analyze(InputStream.fromString(script), [randomContract]);
      // Both branches return, so it should be valid
      expect(result.isSuccess(), isTrue);
    });

    test('missing return when only try returns but catch does not', () {
      final script = baseRandomScript('''
        try {
          return foo * 1.0;
        } catch (e) {
          // no return here
        }
      ''');
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
  });

  group('null safety', () {
    test('accessing nullable without null check', () {
      final script = baseRandomScript('''
        final Map<string,string>? maybe = null;
        final string? value = maybe['key'];
       
        return foo * 1.0;
      ''');
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(
          isA<NullSafetyError>(),
        ),
      );
    });

    test('unnecessary null-aware access', () {
      final script = baseRandomScript('''
         final Map<string,string> maybe = {'test' : 'value'};
        final string? value = maybe!['key'];
       
        return foo * 1.0;
      ''');
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(isA<UnnecessaryNullCheckWarning>()),
      );
    });

    test('valid null check', () {
      final script = baseRandomScript('''
       final Map<string,string> maybe = {'test' : 'value'};
        final string? value = maybe['key'];
       
        return foo * 1.0;
      ''');
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isSuccess(), isTrue);
    });

    test(
        'assigning element to non-nullable array without null check throws error',
        () {
      final script = baseRandomScript('''
        final List<int> arr = [1, 2, 3];
        
        final int value = arr[0];
      ''');
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(
          isA<AssignmentError>(),
        ),
      );
    });

    test('assigning element to nullable array with null check', () {
      final script = baseRandomScript('''
        final arr = [1, 2, 3];
        
        final int value = arr[0]!;

        return 1.0;
      ''');
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isSuccess(), isTrue);
    });
  });

  group('structs', () {
    test('valid struct instantiation', () {
      final script = baseRandomScript(
        'final User u = @User { name: "TestUser", id: 42 }; return foo * 1.0;',
      );
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isSuccess(), isTrue);
    });

    test('accessing struct property', () {
      final script = baseRandomScript(
        'final User u = @User { name: "Alice", id: 7 }; final string name = u.name; return foo * 1.0;',
      );
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isSuccess(), isTrue);
    });

    test('setting struct property', () {
      final script = baseRandomScript(
        'final User u = @User { name: "Bob", id: 3 }; u.name = "Eve"; return foo * 1.0;',
      );
      final result = analyze(InputStream.fromString(script), [randomContract]);

      expect(result.isSuccess(), isTrue);
    });

    test('missing required struct field throws', () {
      final script = baseRandomScript(
        'final User u = @User { id: 5 }; return foo * 1.0;',
      );
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(isA<SemanticError>()),
      );
    });

    test('struct field type mismatch throws', () {
      final script = baseRandomScript(
        'final User u = @User { name: 123, id: 5 }; return foo * 1.0;',
      );
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(isA<TypeError>()),
      );
    });

    test('struct non-existent field access throws', () {
      final script = baseRandomScript(
        'final User u = @User { name: "Test", id: 1 }; final int x = u.nonExistentField; return foo * 1.0;',
      );
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(isA<SemanticError>()),
      );
    });

    test('instantiating struct with non-existent type throws', () {
      final script = baseRandomScript(
        'final NonExistentType n = @NonExistentType { field: "value" }; return foo * 1.0;',
      );
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(isA<SemanticError>()),
      );
    });

    test('instantiating struct with non-existent field throws', () {
      final script = baseRandomScript(
        'final User u = @User { name: "Test", id: 1, doesNotExist: 5 } ; return foo * 1.0;',
      );
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(isA<SemanticError>()),
      );
    });
  });

  group('lists', () {
    test('creating a typed list', () {
      final script = baseRandomScript(
        'final List<int> arr = [1, 2, 3]; return foo * 1.0;',
      );
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isSuccess(), isTrue);
    });

    test('list index type mismatch', () {
      final script = baseRandomScript(
        'final List<int> arr = [1, 2, 3]; final int x = arr["0"]; return foo * 1.0;',
      );
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(isA<TypeError>()),
      );
    });

    test('accessing list element', () {
      final script = baseRandomScript(
        'final List<double> arr = [1.0, 2.0]; final double? x = arr[1]; return foo * 1.0;',
      );
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isSuccess(), isTrue);
    });

    test('assigning to list index', () {
      final script = baseRandomScript(
        'final List<int> arr = [1, 2, 3]; arr[0] = 5; return foo * 1.0;',
      );
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isSuccess(), isTrue);
    });
  });

  group('maps', () {
    test('creating a typed map', () {
      final script = baseRandomScript(
        'final Map<string,int> m = {"a": 1, "b": 2}; return foo * 1.0;',
      );
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isSuccess(), isTrue);
    });

    test('map key type mismatch', () {
      final script = baseRandomScript(
        'final Map<string,int> m = {"a": 1}; final int x = m[1]; return foo * 1.0;',
      );
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isError(), isTrue);
      expect(
        result.exceptionOrNull()?.errors,
        contains(isA<TypeError>()),
      );
    });

    test('accessing map element with null check', () {
      final script = baseRandomScript(
        'final Map<string,double> m = {"k": 3.14}; final double v = m["k"]!; return foo * 1.0;',
      );
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isSuccess(), isTrue);
    });

    test('assigning to map index', () {
      final script = baseRandomScript(
        'final Map<string,int> m = {"a": 1}; m["a"] = 2; return foo * 1.0;',
      );
      final result = analyze(InputStream.fromString(script), [randomContract]);
      expect(result.isSuccess(), isTrue);
    });
  });
}
