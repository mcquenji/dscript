// I like constants better in all caps :)
// ignore_for_file: constant_identifier_names

part of 'compiler.dart';

/// Stores the top value from the stack into a variable in the specified scope.
/// The values after this instruction are:
/// 1. The index of of the scope to store the variable in (0 for root scope, 1 for the first child scope, etc.).
/// 2. The index of the variable within that scope.
const INSTRUCTION_STORE = 0x00;

/// Reads a variable from the specified scope and pushes it onto the stack.
/// The values after this instruction are:
/// 1. The index of the scope to read the variable from (0 for root scope, 1 for the first child scope, etc.).
/// 2. The index of the variable within that scope.
const INSTRUCTION_READ = 0x01;

/// Adds the top two values from the stack and pushes the result onto the stack.
const INSTRUCTION_ADD = 0x02;

/// Subtracts the top two values from the stack and pushes the result onto the stack.
const INSTRUCTION_SUB = 0x03;

/// Multiplies the top two values from the stack and pushes the result onto the stack.
const INSTRUCTION_MUL = 0x04;

/// Divides the second top value by the top value from the stack and pushes the result onto the stack.
const INSTRUCTION_DIV = 0x05;

/// Computes the modulus of the second top value by the top value from the stack and pushes the result onto the stack.
const INSTRUCTION_MOD = 0x06;

/// Compares the top two values from the stack for equality and pushes a boolean result onto the stack.
const INSTRUCTION_EQ = 0x07;

/// Compares the top two values from the stack for inequality and pushes a boolean result onto the stack.
const INSTRUCTION_NEQ = 0x08;

/// Compares the second top value with the top value from the stack for less than and pushes a boolean result onto the stack.
const INSTRUCTION_LT = 0x09;

/// Compares the second top value with the top value from the stack for greater than and pushes a boolean result onto the stack.
const INSTRUCTION_GT = 0x0A;

/// Compares the second top value with the top value from the stack for less than or equal to and pushes a boolean result onto the stack.
const INSTRUCTION_LTE = 0x0B;

/// Compares the second top value with the top value from the stack for greater than or equal to and pushes a boolean result onto the stack.
const INSTRUCTION_GTE = 0x0C;

/// Performs a logical AND operation on the top two boolean values from the stack and pushes the result onto the stack.
const INSTRUCTION_AND = 0x0D;

/// Performs a logical OR operation on the top two boolean values from the stack and pushes the result onto the stack.
const INSTRUCTION_OR = 0x0E;

/// Negates the top boolean value from the stack and pushes the result onto the stack.
const INSTRUCTION_NOT = 0x0F;

/// Jumps to a specified instruction index in the code.
/// The value after this instruction is the target instruction index to jump to.
const INSTRUCTION_JUMP = 0x10;

/// Jumps to a specified instruction index if the top value on the stack is true.
/// The value after this instruction is the target instruction index to jump to if the condition is met.
const INSTRUCTION_JUMP_IF_TRUE = 0x11;

/// Jumps to a specified instruction index if the top value on the stack is false.
/// The value after this instruction is the target instruction index to jump to if the condition is met.
const INSTRUCTION_JUMP_IF_FALSE = 0x12;

/// Returns from the current function, popping the top value from the stack as the return value (if any).
const INSTRUCTION_RETURN = 0x13;

/// Pushes a constant value onto the stack.
///
/// The value after this instruction is the index of the constant in the constant pool.
const INSTRUCTION_PUSH_CONSTANT = 0x14;

/// Pushes a null value onto the stack.
const INSTRUCTION_PUSH_NULL = 0x15;

/// Negates the top numeric value on the stack and pushes the result.
const INSTRUCTION_NEG = 0x16;

/// Creates a new array and pushes it onto the stack.
///
/// The value after this instruction is the number of elements to pop from the stack to fill the array.
const INSTRUCTION_ARRAY = 0x17;

/// Creates a new map and pushes it onto the stack.
///
/// The value after this instruction is the number of entries pairs to pop from the stack to fill the map.
/// Each entry pair consists of a key and a value, so the number of values popped is twice this number.
const INSTRUCTION_MAP = 0x18;

/// Shifts the top value on the stack to the left by the number of bits specified by the second top value, and pushes the result onto the stack.
const INSTRUCTION_SHL = 0x19;

/// Shifts the top value on the stack to the right by the number of bits specified by the second top value, and pushes the result onto the stack.
const INSTRUCTION_SHR = 0x1A;

/// Performs a bitwise AND operation on the top two values from the stack and pushes the result onto the stack.
const INSTRUCTION_BITWISE_AND = 0x1B;

/// Performs a bitwise OR operation on the top two values from the stack and pushes the result onto the stack.
const INSTRUCTION_BITWISE_OR = 0x1C;

/// Performs a bitwise XOR operation on the top two values from the stack and pushes the result onto the stack.
const INSTRUCTION_BITWISE_XOR = 0x1D;

/// Increments the top numeric value on the stack by one and pushes the result onto the stack.
const INSTRUCTION_INC = 0x1E;

/// Decrements the top numeric value on the stack by one and pushes the result onto the stack.
const INSTRUCTION_DEC = 0x1F;

/// Throws an exception with the message specified by the top value on the stack.
const INSTRUCTION_THROW = 0x20;

/// A function compiled to bytecode.
class BytecodeFunction extends Equatable {
  /// The flat list of opcodes and operands.
  final Uint32List buffer;

  /// Constant pool referenced by [buffer].
  final List<Object?> constants;

  /// Creates a compiled function with [buffer] and [constants].
  const BytecodeFunction(this.buffer, this.constants);

  @override
  List<Object?> get props => [buffer, constants];
}
