// I like constants better in all caps :)
// ignore_for_file: constant_identifier_names

import 'dart:typed_data';

/// Stores the top value from the stack into a variable in the specified scope.
/// The values after this instruction are:
/// 1. The number of scopes to pop off the stack to find the variable (0 for the current scope, 1 for the parent scope, etc.).
/// 2. The index of the variable within that scope.
const INSTRUCTION_STORE = 0x00;

/// Reads a variable from the specified scope and pushes it onto the stack.
/// The values after this instruction are:
/// 1. The number of scopes to pop off the stack to find the variable (0 for the current scope, 1 for the parent scope, etc.).
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
/// The value after this instruction is the index of the constant in the constant pool.
const INSTRUCTION_PUSH_CONSTANT = 0x14;

/// Pushes a null value onto the stack.
const INSTRUCTION_PUSH_NULL = 0x15;

/// A function compiled to bytecode.
class BytecodeFunction {
  /// The flat list of opcodes and operands.
  final Uint32List code;

  /// Constant pool referenced by [code].
  final List<Object?> constants;

  /// Creates a compiled function with [code] and [constants].
  const BytecodeFunction(this.code, this.constants);
}
