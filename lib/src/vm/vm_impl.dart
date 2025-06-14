part of 'vm.dart';

/// The default implementation of [VM].
class DefaultVM extends VM {
  /// The default implementation of [VM].
  DefaultVM(
    super.function, {
    super.args,
    super.namedArgs,
    super.functions,
    super.libraries,
  });

  @override
  Future<dynamic> exec() async {
    final buffer = function.buffer;
    final constants = function.constants;

    final stack = <dynamic>[];
    final Map<int, Map<int, dynamic>> frames = {};
    final List<int> catchTargets = [];

    void store(int frame, int index, dynamic value) {
      frames.putIfAbsent(frame, () => {})[index] = value;
    }

    dynamic read(int frame, int index) {
      return frames[frame]?[index];
    }

    // Initialize first frame with positional and named arguments.
    if (args.isNotEmpty || namedArgs.isNotEmpty) {
      final frame = frames.putIfAbsent(1, () => {});
      for (var i = 0; i < args.length; i++) {
        frame[i] = args[i];
      }
      for (final entry in namedArgs.entries) {
        final idx = function.namedParameterIndex[entry.key];
        if (idx != null) {
          frame[idx] = entry.value;
        }
      }
    }

    Map<String, dynamic> createError(dynamic error) {
      final errorMap = <String, dynamic>{
        'message': error.toString(),
        'stackTrace': StackTrace.current.toString(),
        $Type.structKey: Struct.error.name,
      };
      if (error is Map<String, dynamic>) {
        errorMap.addAll(error);
      }
      return errorMap;
    }

    dynamic result;
    for (var ip = 0; ip < buffer.length;) {
      final opcode = buffer[ip++];
      try {
        switch (opcode) {
          case Instruction.store:
            final frame = buffer[ip++];
            final index = buffer[ip++];
            store(frame, index, stack.removeLast());
            break;
          case Instruction.read:
            final frame = buffer[ip++];
            final index = buffer[ip++];
            stack.add(read(frame, index));
            break;
          case Instruction.add:
            final a = stack.removeLast();
            final b = stack.removeLast();

            if (a is String) {
              stack.add('$a$b');
              break;
            }

            stack.add(a + b);

            break;
          case Instruction.sub:
            final a = stack.removeLast();
            final b = stack.removeLast();
            stack.add(a - b);
            break;
          case Instruction.mul:
            final a = stack.removeLast();
            final b = stack.removeLast();
            stack.add(a * b);
            break;
          case Instruction.div:
            final a = stack.removeLast();
            final b = stack.removeLast();
            stack.add(a / b);
            break;
          case Instruction.mod:
            final a = stack.removeLast();
            final b = stack.removeLast();
            stack.add(a % b);
            break;
          case Instruction.eq:
            final a = stack.removeLast();
            final b = stack.removeLast();
            stack.add(a == b);
            break;
          case Instruction.neq:
            final a = stack.removeLast();
            final b = stack.removeLast();
            stack.add(a != b);
            break;
          case Instruction.lt:
            final a = stack.removeLast();
            final b = stack.removeLast();
            stack.add(a < b);
            break;
          case Instruction.gt:
            final a = stack.removeLast();
            final b = stack.removeLast();
            stack.add(a > b);
            break;
          case Instruction.lte:
            final a = stack.removeLast();
            final b = stack.removeLast();
            stack.add(a <= b);
            break;
          case Instruction.gte:
            final a = stack.removeLast();
            final b = stack.removeLast();
            stack.add(a >= b);
            break;
          case Instruction.and:
            final a = stack.removeLast() as bool;
            final b = stack.removeLast() as bool;
            stack.add(a && b);
            break;
          case Instruction.or:
            final a = stack.removeLast() as bool;
            final b = stack.removeLast() as bool;
            stack.add(a || b);
            break;
          case Instruction.not:
            final a = stack.removeLast() as bool;
            stack.add(!a);
            break;
          case Instruction.jump:
            final target = buffer[ip++];
            ip = target;
            break;
          case Instruction.jumpIfTrue:
            final target = buffer[ip++];
            final condition = stack.removeLast();
            if (condition == true) ip = target;
            break;
          case Instruction.jumpIfFalse:
            final target = buffer[ip++];
            final condition = stack.removeLast();
            if (condition == false) ip = target;
            break;
          case Instruction.ret:
            result = stack.isNotEmpty ? stack.removeLast() : null;
            return result;
          case Instruction.pushConstant:
            final idx = buffer[ip++];
            stack.add(constants[idx]);
            break;
          case Instruction.pushNull:
            stack.add(null);
            break;
          case Instruction.neg:
            final a = stack.removeLast() as num;
            stack.add(-a);
            break;
          case Instruction.array:
            final count = buffer[ip++];
            final items = List<dynamic>.generate(
              count,
              (_) => stack.removeLast(),
            ).reversed.toList();
            stack.add(items);
            break;
          case Instruction.map:
            final count = buffer[ip++];
            final m = <String, dynamic>{};
            for (var i = 0; i < count; i++) {
              final value = stack.removeLast();
              final key = stack.removeLast() as String;
              m[key] = value;
            }
            stack.add(m);
            break;
          case Instruction.readProperty:
            final idx = buffer[ip++];
            final obj = stack.removeLast();
            final prop = constants[idx];
            if (obj is Map) {
              stack.add(obj[prop]);
            } else {
              throw StateError("Cannot read property '$prop' from '$obj'");
            }
            break;
          case Instruction.writeProperty:
            final idx = buffer[ip++];
            final obj = stack.removeLast();
            final value = stack.removeLast();
            final prop = constants[idx];
            if (obj is Map) {
              obj[prop] = value;
            } else {
              (obj as dynamic)[prop] = value;
            }
            break;
          case Instruction.readElement:
            final index = stack.removeLast();
            final obj = stack.removeLast();
            if (obj is List) {
              stack.add(obj[index as int]);
            } else if (obj is Map) {
              stack.add(obj[index]);
            } else {
              throw StateError(
                "Cannot read element '$index' from '$obj'",
              );
            }
            break;
          case Instruction.writeElement:
            final value = stack.removeLast();
            final index = stack.removeLast();
            final obj = stack.removeLast();
            if (obj is List) {
              obj[index as int] = value;
            } else if (obj is Map) {
              obj[index] = value;
            } else {
              (obj as dynamic)[index] = value;
            }
            break;
          case Instruction.call:
            final idx = buffer[ip++];
            final named = stack.removeLast() as Map<String, dynamic>?;
            final positional = stack.removeLast() as List<dynamic>?;
            final name = constants[idx] as String;
            final fn = functions[name];

            if (fn == null) {
              throw StateError('Function $name not found');
            }

            final vm = DefaultVM(
              fn,
              args: positional ?? const [],
              namedArgs: named ?? const {},
              functions: functions,
              libraries: libraries,
            );
            stack.add(await vm.exec());
            break;
          case Instruction.externalCall:
            final nsIdx = buffer[ip++];
            final fnIdx = buffer[ip++];
            final named = stack.removeLast() as Map<String, dynamic>?;
            final positional = stack.removeLast() as List<dynamic>?;
            final namespace = constants[nsIdx] as String;
            final name = constants[fnIdx] as String;
            final lib = libraries[namespace];
            if (lib == null) {
              throw StateError('Unknown namespace $namespace');
            }
            final binding = lib.bindings.firstWhere((b) => b.name == name,
                orElse: () =>
                    throw StateError('Unknown function $name in $namespace'));
            final result = await binding(
              positional ?? const [],
              namedArgs:
                  named?.map((k, v) => MapEntry(Symbol(k), v)) ?? const {},
            );
            stack.add(result);
            break;
          case Instruction.structFromMap:
            final idx = buffer[ip++];
            final map = Map<String, dynamic>.from(stack.removeLast() as Map);
            map[$Type.structKey] = constants[idx];
            stack.add(map);
            break;
          case Instruction.shl:
            final a = stack.removeLast() as int;
            final b = stack.removeLast() as int;
            stack.add(a << b);
            break;
          case Instruction.shr:
            final a = stack.removeLast() as int;
            final b = stack.removeLast() as int;
            stack.add(a >> b);
            break;
          case Instruction.bitwiseAnd:
            final a = stack.removeLast() as int;
            final b = stack.removeLast() as int;
            stack.add(a & b);
            break;
          case Instruction.bitwiseOr:
            final a = stack.removeLast() as int;
            final b = stack.removeLast() as int;
            stack.add(a | b);
            break;
          case Instruction.bitwiseXor:
            final a = stack.removeLast() as int;
            final b = stack.removeLast() as int;
            stack.add(a ^ b);
            break;
          case Instruction.inc:
            final a = stack.removeLast() as num;
            stack.add(a + 1);
            break;
          case Instruction.dec:
            final a = stack.removeLast() as num;
            stack.add(a - 1);
            break;
          case Instruction.throw_:
            final error = stack.removeLast();
            if (catchTargets.isEmpty) {
              throw error;
            }
            stack.add(createError(error));
            ip = catchTargets.last;
            break;
          case Instruction.tryStart:
            final target = buffer[ip++];
            catchTargets.add(target);
            break;
          case Instruction.catchStart:
            final frame = buffer[ip++];
            final index = buffer[ip++];
            store(frame, index, stack.removeLast());
            break;
          case Instruction.endTry:
            if (catchTargets.isNotEmpty) catchTargets.removeLast();
            break;
          default:
            throw UnimplementedError('Opcode $opcode not implemented');
        }
      } catch (e) {
        // if there is a catch target, jump to it
        if (catchTargets.isNotEmpty) {
          stack.add(createError(e));
          ip = catchTargets.last;
          continue;
        }

        // otherwise, rethrow
        rethrow;
      }
    }

    return result;
  }
}
