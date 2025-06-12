import 'package:test/test.dart';
import 'package:dscript/dscript.dart';

void main() {
  group('ScriptPermission', () {
    test('equality and hashCode', () {
      const perm1 = ScriptPermission('fs', 'read');
      const perm2 = ScriptPermission('fs', 'read');
      expect(perm1, perm2);
      expect(perm1.hashCode, perm2.hashCode);
    });

    test('custom permission string', () {
      const perm = ScriptPermission.custom('foo');
      expect(perm.toString(), 'external::foo');
    });
  });

  group(r'$Type casting', () {
    test('int to double cast', () {
      final result = PrimitiveType.INT.cast(PrimitiveType.DOUBLE, 4);
      expect(result, 4.0);
    });

    test('null to nullable target', () {
      final result =
          PrimitiveType.NULL.cast(PrimitiveType.INT.asNullable(), null);
      expect(result, null);
    });

    test('MapType cast', () {
      final type = MapType(
        keyType: PrimitiveType.STRING,
        valueType: PrimitiveType.INT,
      );
      final value = {'a': 1};
      final result = type.cast(type, value);
      expect(result, {'a': 1});
    });
  });
}
