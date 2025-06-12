// coverage:ignore-file
part of 'compiler.dart';

/// Provides debugging utilities for a bytecode buffer.
extension BufferDebugX on Uint64List {
  /// Holds information about the number of arguments for each opcode.
  static const argCount = {
    Instruction.store: 2,
    Instruction.read: 2,
    Instruction.add: 0,
    Instruction.sub: 0,
    Instruction.mul: 0,
    Instruction.div: 0,
    Instruction.mod: 0,
    Instruction.eq: 0,
    Instruction.neq: 0,
    Instruction.lt: 0,
    Instruction.gt: 0,
    Instruction.lte: 0,
    Instruction.gte: 0,
    Instruction.and: 0,
    Instruction.or: 0,
    Instruction.not: 0,
    Instruction.jump: 1,
    Instruction.jumpIfTrue: 1,
    Instruction.jumpIfFalse: 1,
    Instruction.ret: 0,
    Instruction.pushConstant: 1,
    Instruction.pushNull: 0,
    Instruction.neg: 1,
    Instruction.array: 1,
    Instruction.map: 1,
    Instruction.shl: 0,
    Instruction.shr: 0,
    Instruction.bitwiseAnd: 0,
    Instruction.bitwiseOr: 0,
    Instruction.bitwiseXor: 0,
    Instruction.inc: 0,
    Instruction.dec: 0,
    Instruction.throw_: 0,
    Instruction.structFromMap: 1,
    Instruction.externalCall: 2,
    Instruction.readElement: 0,
    Instruction.writeElement: 0,
    Instruction.readProperty: 1,
    Instruction.writeProperty: 1,
    Instruction.call: 1,
    Instruction.tryStart: 1,
    Instruction.catchStart: 2,
    Instruction.endTry: 0,
  };

  /// Maps opcodes to their names for debugging and display purposes.
  static const name = {
    Instruction.store: 'store',
    Instruction.read: 'read',
    Instruction.add: 'add',
    Instruction.sub: 'sub',
    Instruction.mul: 'mul',
    Instruction.div: 'div',
    Instruction.mod: 'mod',
    Instruction.eq: 'eq',
    Instruction.neq: 'neq',
    Instruction.lt: 'lt',
    Instruction.gt: 'gt',
    Instruction.lte: 'lte',
    Instruction.gte: 'gte',
    Instruction.and: 'and',
    Instruction.or: 'or',
    Instruction.not: 'not',
    Instruction.jump: 'jump',
    Instruction.jumpIfTrue: 'jumpIfTrue',
    Instruction.jumpIfFalse: 'jumpIfFalse',
    Instruction.ret: 'ret',
    Instruction.pushConstant: 'pushConstant',
    Instruction.pushNull: 'pushNull',
    Instruction.neg: 'neg',
    Instruction.array: 'array',
    Instruction.map: 'map',
    Instruction.shl: 'shl',
    Instruction.shr: 'shr',
    Instruction.bitwiseAnd: 'bitwiseAnd',
    Instruction.bitwiseOr: 'bitwiseOr',
    Instruction.bitwiseXor: 'bitwiseXor',
    Instruction.inc: 'inc',
    Instruction.dec: 'dec',
    Instruction.throw_: 'throw',
    Instruction.structFromMap: 'structFromMap',
    Instruction.externalCall: 'externalCall',
    Instruction.readElement: 'readElement',
    Instruction.writeElement: 'writeElement',
    Instruction.readProperty: 'readProperty',
    Instruction.writeProperty: 'writeProperty',
    Instruction.call: 'call',
    Instruction.tryStart: 'tryStart',
    Instruction.catchStart: 'catchStart',
    Instruction.endTry: 'endTry',
  };

  /// Converts a buffer of opcodes into a human-readable string representation.
  String stringify() {
    final buff = this;
    final sb = StringBuffer();
    for (var i = 0; i < buff.length; i++) {
      final opcode = buff[i];
      sb.write('[$i] ${name[opcode]}');
      final args = argCount[opcode] ?? 0;
      if (args > 0) {
        sb.write('(');
        for (var j = 0; j < args; j++) {
          if (j > 0) sb.write(', ');
          sb.write(buff[++i]);
        }
        sb.write(')');
      }
      sb.write('\n');
    }
    return sb.toString();
  }
}

/// Provides debugging utilities for a [BytecodeFunction].
extension BytecodeFunctionDebugX on BytecodeFunction {
  /// Converts the bytecode function to a human-readable string representation.
  String toDebugString() {
    final sb = StringBuffer();
    sb.writeln('Constants:');
    for (var i = 0; i < constants.length; i++) {
      sb.writeln('[$i] ${constants[i]}');
    }
    sb.writeln('\nBuffer:');
    sb.write(buffer.stringify());
    return sb.toString();
  }
}
