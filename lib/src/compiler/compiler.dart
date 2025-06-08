import 'dart:typed_data';

import 'package:antlr4/antlr4.dart';
import 'package:dscript/src/analyzer/analyzer.dart';
import 'package:dscript/src/gen/antlr/dscriptParser.dart';
import 'package:dscript/src/gen/antlr/dscriptVisitor.dart';
import 'package:dscript/src/permissions.dart';
import 'package:equatable/equatable.dart';

part 'naivie_compiler.dart';
part 'instructions.dart';

/// Result of compiling a script.
class CompiledScript extends Equatable {
  /// Bytecode for each implementation.
  final Map<String, BytecodeFunction> implementations;

  /// Bytecode for each hook.
  final Map<String, BytecodeFunction> hooks;

  /// Permissions required by the script.
  final List<ScriptPermission> permissions;

  /// Creates a compiled script with [implementations], [hooks] and [permissions].
  const CompiledScript({
    required this.implementations,
    required this.hooks,
    required this.permissions,
  });

  @override
  List<Object?> get props => [implementations, hooks, permissions];
}

/// Compiles an analyzed [script] into a [CompiledScript].
CompiledScript compileScript(Script script) {
  final impls = <String, BytecodeFunction>{};
  final hooks = <String, BytecodeFunction>{};

  for (final entry in script.implementations.entries) {
    final visitor = NaiveCompiler(script.globals);
    entry.value.accept(visitor);
    impls[entry.key] = visitor.build();
  }

  for (final entry in script.hooks.entries) {
    final visitor = NaiveCompiler(script.globals);
    entry.value.accept(visitor);
    hooks[entry.key] = visitor.build();
  }

  return CompiledScript(
    implementations: impls,
    hooks: hooks,
    permissions: script.permissions,
  );
}

/// Base class for compiling Dscript code into bytecode.
abstract class DscriptCompiler extends dscriptVisitor<void> {
  /// Base class for compiling Dscript code into bytecode.
  DscriptCompiler(List<VarDeclContext> globals) {
    for (final global in globals) {
      global.accept(this);
    }
  }

  /// Builds the compiled bytecode function.
  BytecodeFunction build() {
    return BytecodeFunction(
      buffer,
      constants,
    );
  }

  /// The current constant pool.
  final List<Object?> constants = [];

  /// The code buffer for the compiled function.
  final List<int> _buffer = [];

  final List<List<String>> _stackFrames = [
    [],
  ];

  /// Index of the current stack frame.
  int get currentFrame => _stackFrames.length - 1;

  /// Adds a constant to the pool and returns its index.
  int addConstant(Object? value) {
    if (constants.contains(value)) {
      return constants.indexOf(value);
    }

    final index = constants.length;
    constants.add(value);
    return index;
  }

  /// Pushes a new stack frame onto the stack.
  void frame() {
    _stackFrames.add([]);
  }

  /// Pops the top stack frame from the stack.
  void pop() {
    // do not pop
    if (_stackFrames.isNotEmpty && _stackFrames.length > 1) {
      _stackFrames.removeLast();
    }
  }

  /// Returns a [FrameIndex] for a new variable [name] in the current stack frame.
  FrameIndex push(String name) {
    final frameIndex = _stackFrames.length - 1;
    _stackFrames.last.add(name);
    final variableIndex = _stackFrames.last.length - 1;
    return (frame: frameIndex, index: variableIndex);
  }

  /// Returns a [FrameIndex] for the given variable [name].
  FrameIndex of(String name) {
    for (var i = _stackFrames.length - 1; i >= 0; i--) {
      final frame = _stackFrames[i];
      final index = frame.indexOf(name);
      if (index != -1) {
        return (frame: i, index: index);
      }
    }
    throw ArgumentError('Variable "$name" not found in stack frames.');
  }

  /// Adds an [instruction] to the buffer with the given arguments.
  void emit(
    int instruction, [
    int? arg1,
    int? arg2,
    int? arg3,
    int? arg4,
    int? arg5,
  ]) {
    _buffer.add(instruction);

    if (arg1 != null) _buffer.add(arg1);
    if (arg2 != null) _buffer.add(arg2);
    if (arg3 != null) _buffer.add(arg3);
    if (arg4 != null) _buffer.add(arg4);
    if (arg5 != null) _buffer.add(arg5);
  }

  /// The instruction buffer.
  Uint32List get buffer => Uint32List.fromList(_buffer);

  /// Starts a counter for jump instructions. Returns the index of the jump instruction.
  ///
  /// Call this method before emitting instructions that may be jumped over,
  /// such as conditional jumps or loops.
  ///
  /// Call [finalizeJump] to finalize the jump instruction and calculate the target index.
  int prepareJump(int instruction) {
    final jumpIndex = _buffer.length;
    emit(instruction, 0); // Placeholder for jump target
    return jumpIndex;
  }

  /// Finalizes a jump instruction at the given [jumpIndex].
  ///
  /// This method should be called after emitting the instructions that the jump instruction will skip over.
  /// It calculates the target index for the jump instruction and updates the instruction in the buffer.
  void finalizeJump(int jumpIndex) {
    // Update the jump instruction to point to the last instruction in the buffer.
    // now need to decrement the jump index by 1 because we want to point to the last *future* instruction
    // as the last instruction that is currently in the buffer is still part of a branch that will be skipped.
    // Thus, we need to point to the next instruction that will be added, which is the current length of the buffer.
    _buffer[jumpIndex + 1] = _buffer.length;
  }

  // #region No-ops

  /// No-op. The compiler does not care about metadata.
  @override
  visitVersion(VersionContext ctx) {}

  /// No-op. The compiler does not care about metadata.
  @override
  visitWebsite(WebsiteContext ctx) {}

  /// No-op. The compiler does not care about metadata.
  @override
  visitAuthor(AuthorContext ctx) {}

  /// No-op. The compiler does not care about metadata.
  @override
  visitLicense(LicenseContext ctx) {}

  /// No-op. The compiler does not care about metadata.
  @override
  visitDescription(DescriptionContext ctx) {}

  /// No-op. The compiler does not care about metadata.
  @override
  visitPermission(PermissionContext ctx) {}

  /// No-op. The compiler does not care about metadata.
  @override
  visitPermissions(PermissionsContext ctx) {}

  /// No-op. The compiler does not care about metadata.
  @override
  visitRepo(RepoContext ctx) {}

  /// No-op. The compiler does not care about metadata.
  @override
  visitName(NameContext ctx) {}

  /// No-op. The compiler does not care about metadata.
  @override
  void visitMetadata(MetadataContext ctx) {}

  /// No-op. The compiler does not care about the contract itself.
  @override
  visitContract(ContractContext ctx) {}

  /// No-op. The compiler does not care about data types.
  @override
  visitDataType(DataTypeContext ctx) {}

  /// No-op.
  @override
  visitSchema(SchemaContext ctx) {}

  /// No-op.
  @override
  visitScript(ScriptContext ctx) {}

  //#endregion
}

/// Represents a frame index in the stack.
/// It is a tuple of two integers: the frame index and the variable index within that frame.
/// This is used to track the position of variables in the stack frames during compilation.
typedef FrameIndex = ({int frame, int index});
