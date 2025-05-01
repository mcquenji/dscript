import 'package:dscript/dscript.dart';

void main(List<String> arguments) {
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
permissions fs::read, fs::write;
permissions ntwk::client, ntwk::server;

contract Random {
  impl randomNumber(int foo) -> double {
    return foo * pi;
  }

  impl author() -> string {
    return "John Doe";
  }

  impl randomString() -> string {
    return 'Hello, "World"!';
  }

  hook onLogin(string username) {
    // Hook implementation
  }
}
''';

  final src = SourceCode(code);

  final parser = Parser();

  final script = parser.parse(src);

  // print(script);

  final runtime = Runtime(script);
  runtime.allow(ScriptPermission.readFiles);
  runtime.allow(ScriptPermission.writeFiles);
  runtime.allow(ScriptPermission.networkClient);
  runtime.allow(ScriptPermission.networkServer);

  print(runtime.run('randomNumber', {'foo': 10}));
  print(runtime.run('author', {}));
}
