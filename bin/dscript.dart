// Printing for testing purposes
// ignore_for_file: avoid_print

import 'package:dscript/analyzer/analyzer.dart';
import 'package:dscript/dscript.dart';
import 'package:logging/logging.dart';

void main(List<String> arguments) {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print(record);
  });

//   const String code = '''
// permissions fs::read, fs::write;
// permissions ntwk::client, ntwk::server;

// contract TestContract {

//   impl add(int a, int b) -> int {
//     return a + b;
//   }

//   impl subtract(int a, int b) -> int {
//     return a - b;
//   }

//   hook onLogin(String username) {
//     // Hook implementation
//   }

//   hook onLogout() {
//     // Hook implementation
//   }
// }
// ''';

  const String code = '''
author "McQuenji";
version "0.0.1";
name "TestScript";
description "Random number generator.";
description "For testing purposes.";
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
    return 'Hello, "World"!';
  }

  impl test() -> void {
    // Test implementation
  }

  hook onLogout() -> void {
    // Hook implementation
    // return "Logout successful!";
  }

  hook onLogin(string username) {
    // Hook implementation
  }

}
''';

  final src = SourceCode(code);

  final parser = Parser();

  final script = parser.parse(src);

  final runtime = Runtime(
    script,
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
      HookSignature(
        name: 'onLogout',
        namedParameters: [],
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
