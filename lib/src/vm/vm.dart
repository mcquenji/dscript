import 'package:dscript_dart/dscript_dart.dart';
import 'package:dscript_dart/src/stdlib/stdlib.dart';

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
  ///
  /// The [functions] map contains all bytecode functions available for
  /// invocation via the [Instruction.call] opcode. The [libraries] map provides
  /// access to host or standard library bindings used by
  /// [Instruction.externalCall].
  VM(
    this.function, {
    this.args = const [],
    this.namedArgs = const {},
    this.functions = const {},
    this.libraries = const {},
  });

  /// All functions that can be invoked by this VM.
  final Map<String, BytecodeFunction> functions;

  /// Available libraries for external calls keyed by namespace.
  final Map<String, LibraryBinding> libraries;

  /// Executes the function with the provided [args] and [namedArgs].
  ///
  /// Returns the result of the execution or [null] if the function does not return a value.
  dynamic exec();
}
