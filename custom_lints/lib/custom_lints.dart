import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/listener.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/error/error.dart' hide LintCode;

PluginBase createPlugin() => _MyPlugin();

class _MyPlugin extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [_NoTypeToString()];
}

class _NoTypeToString extends DartLintRule {
  _NoTypeToString()
    : super(
        code: LintCode(
          name: 'no_type_to_string',
          problemMessage:
              'Avoid calling `toString()` on a `Type`. In web builds, type names are minified and cannot be reliably mapped to Dscript types.',
          errorSeverity: ErrorSeverity.ERROR,
          correctionMessage:
              r"Use a stable Dscript type reference instead (e.g. `$Type.Primitive.INT`) or hardcode the string (e.g. `$Type.from('int')`).",
        ),
      );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addMethodInvocation((MethodInvocation node) {
      final target = node.realTarget ?? node.target;
      if (target == null) return;

      final isToString = node.methodName.name == 'toString';
      final noArgs = node.argumentList.arguments.isEmpty;
      if (!isToString || !noArgs) return;

      final t = target.staticType;

      final isTypeObject =
          t is InterfaceType &&
          t.element3.library2.name3 == 'dart.core' &&
          t.element3.name3 == 'Type';

      if (isTypeObject) {
        reporter.atNode(node, code);
      }
    });
  }
}
