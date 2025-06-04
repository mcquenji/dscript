import 'dart:typed_data';

import 'package:dscript/src/analyzer/analyzer.dart';
import 'package:dscript/src/compiler/visitor.dart';
import 'package:dscript/src/permissions.dart';
import 'package:dscript/src/gen/antlr/dscriptBaseVisitor.dart';

import 'instructions.dart';

/// Result of compiling a script.
class CompiledScript {
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
}

/// Compiles an analyzed [script] into a [CompiledScript].
CompiledScript compileScript(Script script) {
  final impls = <String, BytecodeFunction>{};
  final hooks = <String, BytecodeFunction>{};

  for (final entry in script.implementations.entries) {
    final visitor = NaiveCompiler();
    entry.value.accept(visitor);
    impls[entry.key] = visitor.build();
  }

  for (final entry in script.hooks.entries) {
    final visitor = NaiveCompiler();
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
abstract class DscriptCompiler extends dscriptBaseVisitor<void> {
  /// Builds the compiled bytecode function.
  BytecodeFunction build() {
    return BytecodeFunction(
      code,
      constants,
    );
  }

  /// The current constant pool.
  final List<Object?> constants = [];

  /// The code buffer for the compiled function.
  final List<int> _code = [];

  final List<List<String>> _stackFrames = [
    [],
  ];

  /// Index of the current stack frame.
  int get currentFrame => _stackFrames.length - 1;

  /// Adds a constant to the pool and returns its index.
  int addConstant(Object? value) {
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
    if (arg1 != null) _code.add(arg1);
    if (arg2 != null) _code.add(arg2);
    if (arg3 != null) _code.add(arg3);
    if (arg4 != null) _code.add(arg4);
    if (arg5 != null) _code.add(arg5);

    _code.add(instruction);
  }

  /// The instruction buffer.
  Uint32List get code => Uint32List.fromList(_code);
}

/// Represents a frame index in the stack.
/// It is a tuple of two integers: the frame index and the variable index within that frame.
/// This is used to track the position of variables in the stack frames during compilation.
typedef FrameIndex = ({int frame, int index});
