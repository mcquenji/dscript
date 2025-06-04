import 'dart:typed_data';

/// Supported stack based operations for the runtime.
enum OpCode {
  pushConst,
  loadVar,
  add,
  sub,
  mul,
  div,
  neg,
  ret,
}

/// A function compiled to bytecode.
class BytecodeFunction {
  /// The flat list of opcodes and operands.
  final Uint32List code;

  /// Constant pool referenced by [code].
  final List<Object?> constants;

  /// Creates a compiled function with [code] and [constants].
  const BytecodeFunction(this.code, this.constants);
}
