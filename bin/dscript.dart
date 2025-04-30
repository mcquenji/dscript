import 'package:dscript/dscript.dart';

void main(List<String> arguments) {
  const String code = '''
permissions fs::read, fs::write;
permissions ntwk::client, ntwk::server;

contract TestContract {

  impl add(int a, int b) -> int {
    return a + b;
  }

  impl subtract(int a, int b) -> int {
    return a - b;
  }

  hook onLogin(String username) {
    // Hook implementation
  }

  hook onLogout() {
    // Hook implementation
  }
}
''';

  final src = SourceCode(code);

  final parser = Parser();

  print(parser.parse(src));
}
