part of 'compiler.dart';

/// Represents a single instruction in the bytecode.
///
/// Each instruction is identified by a unique opcode and may have associated arguments, operands and results.
///
/// {@template instruction}
/// - **Arguments** are values that follow the instruction in the bytecode buffer and are used to specify additional data needed for the instruction.
/// - **Operands** are values that the instruction operates on and are popped from the stack.
/// - **Results** are values that the instruction pushes onto the stack after execution.
/// {@endtemplate}
class Instruction {
  /// Stores the top value from the stack into a variable in the specified scope.
  ///
  /// **Arguments**
  ///   1. The index of the scope to store the variable in (0 = root scope).
  ///   2. The index of the variable within that scope.
  ///
  /// **Operands**
  ///   1. The value to store (dynamic).
  ///
  /// **Results**
  ///   None
  ///
  /// {@macro instruction}
  static const store = 0x00;

  /// Reads a variable from the specified scope and pushes it onto the stack.
  ///
  /// **Arguments**
  ///   1. The index of the scope to read the variable from (0 = root scope).
  ///   2. The index of the variable within that scope.
  ///
  /// **Operands**
  ///   None
  ///
  /// **Results**
  ///   1. The variable's value (dynamic).
  ///
  /// {@macro instruction}
  static const read = 0x01;

  /// Adds the top two values from the stack and pushes the result onto the stack.
  ///
  /// Performs numeric addition of two operands.
  ///
  /// **Arguments:**
  ///   None
  ///
  /// **Operands**
  ///   1. Right operand (num).
  ///   2. Left operand (num).
  ///
  /// **Results**
  ///   1. Sum (num).
  ///
  /// {@macro instruction}
  static const add = 0x02;

  /// Subtracts the top two values from the stack and pushes the result onto the stack.
  ///
  /// Performs numeric subtraction (left − right).
  ///
  /// **Arguments:**
  ///   None
  ///
  /// **Operands**
  ///   1. Right operand (num).
  ///   2. Left operand (num).
  ///
  /// **Results**
  ///   1. Difference (num).
  ///
  /// {@macro instruction}
  static const sub = 0x03;

  /// Multiplies the top two values from the stack and pushes the result onto the stack.
  ///
  /// Performs numeric multiplication of two operands.
  ///
  /// **Arguments:**
  ///   None
  ///
  /// **Operands**
  ///   1. Right operand (num).
  ///   2. Left operand (num).
  ///
  /// **Results**
  ///   1. Product (num).
  ///
  /// {@macro instruction}
  static const mul = 0x04;

  /// Divides the second top value by the top value from the stack and pushes the result onto the stack.
  ///
  /// Performs numeric division (left ÷ right).
  ///
  /// **Arguments:**
  ///   None
  ///
  /// **Operands**
  ///   1. Divisor (num).
  ///   2. Dividend (num).
  ///
  /// **Results**
  ///   1. Quotient (num).
  ///
  /// {@macro instruction}
  static const div = 0x05;

  /// Computes the modulus of the second top value by the top value from the stack and pushes the result onto the stack.
  ///
  /// Calculates the remainder of left ÷ right.
  ///
  /// **Arguments:**
  ///   None
  ///
  /// **Operands**
  ///   1. Divisor (num).
  ///   2. Dividend (num).
  ///
  /// **Results**
  ///   1. Remainder (num).
  ///
  /// {@macro instruction}
  static const mod = 0x06;

  /// Compares the top two values from the stack for equality and pushes a boolean result onto the stack.
  ///
  /// Tests if two values are equal (==).
  ///
  /// **Arguments:**
  ///   None
  ///
  /// **Operands**
  ///   1. Right operand (dynamic).
  ///   2. Left operand (dynamic).
  ///
  /// **Results**
  ///   1. Result (bool).
  ///
  /// {@macro instruction}
  static const eq = 0x07;

  /// Compares the top two values from the stack for inequality and pushes a boolean result onto the stack.
  ///
  /// Tests if two values are not equal (!=).
  ///
  /// **Arguments:**
  ///   None
  ///
  /// **Operands**
  ///   1. Right operand (dynamic).
  ///   2. Left operand (dynamic).
  ///
  /// **Results**
  ///   1. Result (bool).
  ///
  /// {@macro instruction}
  static const neq = 0x08;

  /// Compares the second top value with the top value from the stack for less than and pushes a boolean result onto the stack.
  ///
  /// Checks if left < right.
  ///
  /// **Arguments:**
  ///   None
  ///
  /// **Operands**
  ///   1. Right operand (num).
  ///   2. Left operand (num).
  ///
  /// **Results**
  ///   1. Result (bool).
  ///
  /// {@macro instruction}
  static const lt = 0x09;

  /// Compares the second top value with the top value from the stack for greater than and pushes a boolean result onto the stack.
  ///
  /// Checks if left > right.
  ///
  /// **Arguments:**
  ///   None
  ///
  /// **Operands**
  ///   1. Right operand (num).
  ///   2. Left operand (num).
  ///
  /// **Results**
  ///   1. Result (bool).
  ///
  /// {@macro instruction}
  static const gt = 0x0A;

  /// Compares the second top value with the top value from the stack for less than or equal to and pushes a boolean result onto the stack.
  ///
  /// Checks if left ≤ right.
  ///
  /// **Arguments:**
  ///   None
  ///
  /// **Operands**
  ///   1. Right operand (num).
  ///   2. Left operand (num).
  ///
  /// **Results**
  ///   1. Result (bool).
  ///
  /// {@macro instruction}
  static const lte = 0x0B;

  /// Compares the second top value with the top value from the stack for greater than or equal to and pushes a boolean result onto the stack.
  ///
  /// Checks if left ≥ right.
  ///
  /// **Arguments:**
  ///   None
  ///
  /// **Operands**
  ///   1. Right operand (num).
  ///   2. Left operand (num).
  ///
  /// **Results**
  ///   1. Result (bool).
  ///
  /// {@macro instruction}
  static const gte = 0x0C;

  /// Performs a logical AND operation on the top two boolean values from the stack and pushes the result onto the stack.
  ///
  /// Computes left && right.
  ///
  /// **Arguments:**
  ///   None
  ///
  /// **Operands**
  ///   1. Right operand (bool).
  ///   2. Left operand (bool).
  ///
  /// **Results**
  ///   1. Result (bool).
  ///
  /// {@macro instruction}
  static const and = 0x0D;

  /// Performs a logical OR operation on the top two boolean values from the stack and pushes the result onto the stack.
  ///
  /// Computes left || right.
  ///
  /// **Arguments:**
  ///   None
  ///
  /// **Operands**
  ///   1. Right operand (bool).
  ///   2. Left operand (bool).
  ///
  /// **Results**
  ///   1. Result (bool).
  ///
  /// {@macro instruction}
  static const or = 0x0E;

  /// Negates the top boolean value from the stack and pushes the result onto the stack.
  ///
  /// Computes !value.
  ///
  /// **Arguments:**
  ///   None
  ///
  /// **Operands**
  ///   1. Operand (bool).
  ///
  /// **Results**
  ///   1. Result (bool).
  ///
  /// {@macro instruction}
  static const not = 0x0F;

  /// Jumps to a specified instruction index in the code.
  ///
  /// Alters the instruction pointer unconditionally.
  ///
  /// **Arguments**
  ///   1. Target instruction index.
  ///
  /// **Operands**
  ///   None
  ///
  /// **Results**
  ///   None
  static const jump = 0x10;

  /// Jumps to a specified instruction index if the top value on the stack is true.
  ///
  /// Pops a boolean and branches if it is true.
  ///
  /// **Arguments**
  ///   1. Target instruction index.
  ///
  /// **Operands**
  ///   1. Condition (bool).
  ///
  /// **Results**
  ///   None
  ///
  /// {@macro instruction}
  static const jumpIfTrue = 0x11;

  /// Jumps to a specified instruction index if the top value on the stack is false.
  ///
  /// Pops a boolean and branches if it is false.
  ///
  /// **Arguments**
  ///   1. Target instruction index.
  ///
  /// **Operands**
  ///   1. Condition (bool).
  ///
  /// **Results**
  ///   None
  ///
  /// {@macro instruction}
  static const jumpIfFalse = 0x12;

  /// Returns from the current function, popping the top value from the stack as the return value (if any).
  ///
  /// Unwinds the call stack and provides a return value.
  ///
  /// **Arguments:**
  ///   None
  ///
  /// **Operands**
  ///   1. Return value (dynamic).
  ///
  /// **Results**
  ///   None
  static const ret = 0x13;

  /// Pushes a constant value onto the stack.
  ///
  /// Retrieves a constant from the constant pool by index and pushes it.
  ///
  /// **Arguments**
  ///   1. Constant pool index.
  ///
  /// **Operands**
  ///   None
  ///
  /// **Results**
  ///   1. Constant (dynamic).
  ///
  /// {@macro instruction}
  static const pushConstant = 0x14;

  /// Pushes a null value onto the stack.
  ///
  /// **Arguments:**
  ///   None
  ///
  /// **Operands**
  ///   None
  ///
  /// **Results**
  ///   1. Null (null).
  ///
  /// {@macro instruction}
  static const pushNull = 0x15;

  /// Negates the top numeric value on the stack and pushes the result.
  ///
  /// Computes -value.
  ///
  /// **Arguments:**
  ///   None
  ///
  /// **Operands**
  ///   1. Operand (num).
  ///
  /// **Results**
  ///   1. Negative value (num).
  ///
  /// {@macro instruction}
  static const neg = 0x16;

  /// Creates a new array and pushes it onto the stack.
  ///
  /// Allocates an array and fills it with elements popped from the stack.
  ///
  /// **Arguments**
  ///   1. Number of elements.
  ///
  /// **Operands**
  ///   1. Elements (dynamic) × count.
  ///
  /// **Results**
  ///   1. List<dynamic>.
  ///
  /// {@macro instruction}
  static const array = 0x17;

  /// Creates a new map and pushes it onto the stack.
  ///
  /// Allocates a map and fills it with key/value pairs popped from the stack.
  ///
  /// **Arguments**
  ///   1. Number of entry pairs.
  ///
  /// **Operands**
  ///   1. Values (dynamic) × (count*2) [key, value].
  ///
  /// **Results**
  ///   1. Map<String, dynamic>.
  ///
  /// {@macro instruction}
  static const map = 0x18;

  /// Shifts the top value on the stack to the left by the number of bits specified by the second top value.
  ///
  /// Performs bitwise left shift (left << right).
  ///
  /// **Arguments:**
  ///   None
  ///
  /// **Operands**
  ///   1. Shift amount (int).
  ///   2. Value (int).
  ///
  /// **Results**
  ///   1. Result (int).
  ///
  /// {@macro instruction}
  static const shl = 0x19;

  /// Shifts the top value on the stack to the right by the number of bits specified by the second top value.
  ///
  /// Performs bitwise right shift (left >> right).
  ///
  /// **Arguments:**
  ///   None
  ///
  /// **Operands**
  ///   1. Shift amount (int).
  ///   2. Value (int).
  ///
  /// **Results**
  ///   1. Result (int).
  ///
  /// {@macro instruction}
  static const shr = 0x1A;

  /// Performs a bitwise AND operation on the top two values from the stack and pushes the result onto the stack.
  ///
  /// Computes left & right.
  ///
  /// **Arguments:**
  ///   None
  ///
  /// **Operands**
  ///   1. Right operand (int).
  ///   2. Left operand (int).
  ///
  /// **Results**
  ///   1. Result (int).
  ///
  /// {@macro instruction}
  static const bitwiseAnd = 0x1B;

  /// Performs a bitwise OR operation on the top two values from the stack and pushes the result onto the stack.
  ///
  /// Computes left | right.
  ///
  /// **Arguments:**
  ///   None
  ///
  /// **Operands**
  ///   1. Right operand (int).
  ///   2. Left operand (int).
  ///
  /// **Results**
  ///   1. Result (int).
  ///
  /// {@macro instruction}
  static const bitwiseOr = 0x1C;

  /// Performs a bitwise XOR operation on the top two values from the stack and pushes the result onto the stack.
  ///
  /// Computes left ^ right.
  ///
  /// **Arguments:**
  ///   None
  ///
  /// **Operands**
  ///   1. Right operand (int).
  ///   2. Left operand (int).
  ///
  /// **Results**
  ///   1. Result (int).
  ///
  /// {@macro instruction}
  static const bitwiseXor = 0x1D;

  /// Increments the top numeric value on the stack by one and pushes the result onto the stack.
  ///
  /// Computes value + 1.
  ///
  /// **Arguments:**
  ///   None
  ///
  /// **Operands**
  ///   1. Operand (num).
  ///
  /// **Results**
  ///   1. Result (num).
  ///
  /// {@macro instruction}
  static const inc = 0x1E;

  /// Decrements the top numeric value on the stack by one and pushes the result onto the stack.
  ///
  /// Computes value - 1.
  ///
  /// **Arguments:**
  ///   None
  ///
  /// **Operands**
  ///   1. Operand (num).
  ///
  /// **Results**
  ///   1. Result (num).
  ///
  /// {@macro instruction}
  static const dec = 0x1F;

  /// Throws an exception with the message specified by the top value on the stack.
  ///
  /// Pops an error message and raises an exception.
  ///
  /// **Arguments:**
  ///   None
  ///
  /// **Operands**
  ///   1. Error message (String).
  ///
  /// **Results**
  ///   None
  ///
  /// {@macro instruction}
  static const throw_ = 0x20;

  /// Instantiates a struct from a map on the stack.
  ///
  /// Constructs a host-defined struct by mapping fields from a Map.
  ///
  /// **Arguments**
  ///   1. Constant pool index containing the struct's name.
  ///
  /// **Operands**
  ///   1. A Map<String, dynamic>.
  ///
  /// **Results**
  ///   1. Struct instance.
  ///
  /// {@macro instruction}
  static const structFromMap = 0x21;

  /// Calls an external function with the arguments specified on the stack.
  ///
  /// Invokes a host or external function by namespace and name.
  ///
  /// **Arguments**
  ///   1. Constant pool index for the function namespace.
  ///   2. Constant pool index for the function name.
  ///
  /// **Operands**
  ///   1. Positional arguments as List<dynamic> or null ([Instruction.pushNull]).
  ///   2. Named arguments as Map<String, dynamic> or null ([Instruction.pushNull]).
  ///
  /// **Results**
  ///   1. Return value (dynamic).
  ///
  /// {@macro instruction}
  static const externalCall = 0x22;

  /// Reads a property from an object and pushes the value onto the stack.
  ///
  /// Reads a property from an object using the specified property name.
  ///
  /// **Arguments**
  ///  1. Constant pool index for the property name.
  ///
  /// **Operands**
  /// 1. The object to read the property from (dynamic).
  ///
  /// **Results**
  /// 1. The property value (dynamic).
  ///
  /// {@macro instruction}
  static const readProperty = 0x23;

  /// Writes a value to a property of an object.
  ///
  /// Writes a value to a property of an object using the specified property name.
  ///
  /// **Arguments**
  /// 1. Constant pool index for the property name.
  ///
  /// **Operands**
  /// 1. The object to write the property to (dynamic).
  /// 2. The value to write (dynamic).
  ///
  /// **Results**
  /// None
  ///
  /// {@macro instruction}
  static const writeProperty = 0x24;

  /// Reads an element from an array or map and pushes the value onto the stack.
  ///
  /// Reads an element from an array or map using the specified index or key.
  ///
  /// **Arguments**
  /// None
  ///
  /// **Operands**
  /// 1. The array or map to read from (dynamic).
  /// 2. The index or key to read (dynamic).
  ///
  /// **Results**
  /// 1. The element value (dynamic).
  ///
  /// {@macro instruction}
  static const readElement = 0x25;

  /// Writes a value to an element in an array or map.
  ///
  /// Writes a value to an element in an array or map using the specified index or key.
  ///
  /// **Arguments**
  /// None
  ///
  /// **Operands**
  /// 1. The array or map to write to (dynamic).
  /// 2. The index or key to write (dynamic).
  /// 3. The value to write (dynamic).
  ///
  /// **Results**
  /// None
  ///
  /// {@macro instruction}
  static const writeElement = 0x26;

  /// Calls a function with the given arguments.
  ///
  /// Invokes a function by its index in the constant pool with the provided arguments.
  ///
  /// **Arguments**
  ///   1. Constant pool index for the function name.
  ///
  /// **Operands**
  ///   1. Positional arguments as List<dynamic> or null ([Instruction.pushNull]).
  ///   2. Named arguments as Map<String, dynamic> or null ([Instruction.pushNull]).
  static const call = 0x27;
}

/// A function compiled to bytecode.
class BytecodeFunction extends Equatable {
  /// The flat list of opcodes and operands.
  final Uint64List buffer;

  /// Constant pool referenced by [buffer].
  final List<Object?> constants;

  /// Creates a compiled function with [buffer] and [constants].
  const BytecodeFunction(this.buffer, this.constants);

  @override
  List<Object?> get props => [buffer, constants];
}
