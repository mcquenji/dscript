import 'dart:io';
import 'package:dscript_dart/dscript_dart.dart';

void main() async {
  final sb = StringBuffer();

  sb.writeln('# Standard Library');
  sb.writeln();
  // Generate Table of Contents
  sb.writeln();
  final libraries = LibraryBinding.stdLib();
  for (final lib in libraries) {
    final anchor = _toAnchor(lib.name);
    sb.writeln('- [${lib.name}](#$anchor)');
  }
  sb.writeln('---');

  sb.writeln();
  sb.writeln('## Globals');
  sb.writeln();
  sb.writeln(
    'The following globals are available in the dscript runtime. They are not part of any library.',
  );

  for (final glob in TypeScope.globals.entries) {
    sb.writeln('- `${glob.key}`: ${glob.value.$2} *(${glob.value.$1})*');
  }

  sb.writeln();

  // Document each library
  for (final lib in libraries) {
    sb.writeln();
    sb.writeln('---');
    sb.writeln();
    sb.writeln(_documentLibrary(lib));
  }

  final output = sb.toString();
  final file = File('docs/language/standard-library.md');
  await file.writeAsString(output);
}

String _toAnchor(String text) {
  return text
      .trim()
      .toLowerCase()
      .replaceAll(RegExp(r'[^a-z0-9\s-]'), '')
      .replaceAll(RegExp(r'\s+'), '-');
}

String _documentLibrary(LibraryBinding lib) {
  final sb = StringBuffer();

  sb.writeln('## ${lib.name}');
  sb.writeln();
  sb.writeln(lib.description);
  sb.writeln();

  for (final binding in lib.bindings) {
    sb.writeln(_documentBinding(binding));
    sb.writeln();
  }

  return sb.toString();
}

String _documentBinding(RuntimeBinding binding) {
  final sb = StringBuffer();

  // Binding Header with anchor
  sb.writeln('### ${binding.name} &rarr; `${binding.returnType}`');

  // Combine positional and named params in one table
  final params = <Map<String, dynamic>>[];
  for (var i = 0; i < binding.positionalParams.length; i++) {
    final p = binding.positionalParams.entries.elementAt(i);
    params.add(
      {'name': p.key, 'type': p.value, 'kind': 'Positional (${i + 1})'},
    );
  }
  for (final entry in binding.namedParams.entries) {
    final name = entry.key
        .toString()
        .substring('Symbol("'.length, entry.key.toString().length - 2);
    params.add({
      'name': name,
      'kind': 'Named',
      'type': entry.value.toString(),
    });
  }

  if (params.isNotEmpty) {
    sb.writeln();
    sb.writeln('| Name | Type | Kind |');
    sb.writeln('| --- | --- | --- |');
    for (final p in params) {
      sb.writeln('| ${p['name']} | `${p['type']}` | ${p['kind']} |');
    }
  }

  if (binding.description != null && binding.description!.isNotEmpty) {
    final description = binding.description!.trim().replaceAllMapped(
          RegExp(r'\[([^\]]+)\]'),
          (m) => '<code>${m.group(1)}</code>',
        );

    if (description.contains('\n')) {
      final summary = description.split('\n').first;
      final details = description.substring(summary.length).trim();
      sb.writeln('<details>');
      sb.writeln('<summary><em>$summary</em></summary>');
      sb.writeln('<em>$details</em>');
      sb.writeln('</details>');
      sb.writeln('<br>');
    } else {
      sb.writeln();
      sb.writeln('<em>$description</em>');
    }
  }

  if (binding.permissions.isNotEmpty) {
    sb.writeln();
    sb.writeln('#### Permissions');
    sb.writeln();
    sb.writeln(binding.permissions.map((p) => '`$p`').join(', '));
  }

  return sb.toString();
}
