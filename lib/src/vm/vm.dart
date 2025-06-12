import 'package:dscript/dscript.dart';

part 'vm_impl.dart';

/// A virtual machine executing a [BytecodeFunction].
abstract class VM {
  /// The function being executed by this virtual machine.
  final BytecodeFunction function;

  /// The positional arguments passed to the function.
  final List<dynamic> args;

  /// The named arguments passed to the function.
  final Map<String, dynamic> namedArgs;

  /// A virtual machine executing a [BytecodeFunction].
  VM(
    this.function, {
    this.args = const [],
    this.namedArgs = const {},
  });

  /// Executes the function with the provided [args] and [namedArgs].
  ///
  /// Returns the result of the execution or [null] if the function does not return a value.
  dynamic exec();
}
