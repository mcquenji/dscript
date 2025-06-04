/// Instruction set for the stack based runtime.
///
/// Each [Instruction] consists of an [OpCode] and
/// an optional operand.
class Instruction {
  /// The operation code.
  final OpCode op;

  /// Optional operand for the instruction.
  final Object? operand;

  /// Creates an [Instruction] with the given [op] and optional [operand].
  const Instruction(this.op, [this.operand]);
}

/// Supported stack based operations.
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
