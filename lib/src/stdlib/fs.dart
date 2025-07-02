part of 'stdlib.dart';

/// Bindings for the file system standard library.
class FsBindings extends LibraryBinding {
  /// Bindings for the file system standard library.
  const FsBindings()
      : super(
          name: 'fs',
          description: 'Library for interacting with the file system.',
        );

  @override
  Set<RuntimeBinding> get bindings => {
        readFileBinding,
        writeFileBinding,
        deleteFileBinding,
        fileExistsBinding,
        listDirectoryBinding,
        createDirectoryBinding,
        isDirectoryBinding,
        isFileBinding,
        absolutePathBinding,
        currentDirectoryBinding,
        moveBinding,
        copyBinding,
        fileSizeBinding,
        extensionBinding,
        basenameBinding,
        dirnameBinding,
      };

  /// Reads the contents of a file as a string.
  static final readFileBinding = RuntimeBinding<String>(
    name: 'read',
    function: (String path) async {
      final file = File(path);
      if (!file.existsSync()) {
        throw FileSystemException('File not found', path);
      }
      return await file.readAsString();
    },
    positionalParams: {
      'path': PrimitiveType.STRING,
    },
    permissions: [ScriptPermission.readFiles],
    description: 'Reads the contents of a file at the given path as a string.',
  );

  /// Writes a string to a file.
  static final writeFileBinding = RuntimeBinding<void>(
    name: 'write',
    function: (
        {required String path, required String content, bool? append}) async {
      final file = File(path);
      append ??= false; // Default to false if not provided
      await file.writeAsString(content,
          mode: append ? FileMode.append : FileMode.write);
    },
    namedParams: {
      #append: PrimitiveType.BOOL.asNullable(),
      #path: PrimitiveType.STRING,
      #content: PrimitiveType.STRING,
    },
    permissions: [ScriptPermission.writeFiles],
    description:
        'Writes a string to a file at the given [path]. If [append] is true, it appends to the file; otherwise, it overwrites the file. The file is created if it does not exist.',
  );

  /// Deletes a file at the given path.
  static final deleteFileBinding = RuntimeBinding<void>(
    name: 'delete',
    function: (String path) async {
      final file = File(path);
      if (!file.existsSync()) {
        throw FileSystemException('File not found', path);
      }

      await file.delete();
    },
    positionalParams: {
      'path': PrimitiveType.STRING,
    },
    permissions: [ScriptPermission.writeFiles],
    description: 'Deletes a file at the given [path].',
  );

  /// Checks if a file exists at the given path.
  static final fileExistsBinding = RuntimeBinding<bool>(
    name: 'exists',
    function: (String path) async {
      final file = File(path);
      return await file.exists();
    },
    positionalParams: {
      'path': PrimitiveType.STRING,
    },
    permissions: [ScriptPermission.readFiles],
    description: 'Checks if a file exists at the given [path].',
  );

  /// Lists the contents of a directory.
  static final listDirectoryBinding = RuntimeBinding<List<String>>(
    name: 'ls',
    function: (String path) async {
      final dir = Directory(path);
      if (!dir.existsSync()) {
        throw FileSystemException('Directory not found', path);
      }
      final contents = dir.listSync();
      return contents
          .whereType<File>()
          .map((file) => file.path)
          .toList(growable: false);
    },
    positionalParams: {
      'path': PrimitiveType.STRING,
    },
    permissions: [ScriptPermission.readFiles],
    description:
        'Lists the contents of a directory at the given [path]. Returns a list of file paths.',
  );

  /// Creates a directory at the given path.
  static final createDirectoryBinding = RuntimeBinding<void>(
    name: 'mkdir',
    function: (String path) async {
      final dir = Directory(path);
      if (dir.existsSync()) {
        return;
      }
      await dir.create(recursive: true);
    },
    positionalParams: {
      'path': PrimitiveType.STRING,
    },
    permissions: [ScriptPermission.writeFiles],
    description:
        'Creates a directory at the given [path]. If the directory already exists, it does nothing.',
  );

  /// Checks if the path is a directory.
  static final isDirectoryBinding = RuntimeBinding<bool>(
    name: 'isDir',
    function: (String path) async {
      return await FileSystemEntity.isDirectory(path);
    },
    positionalParams: {
      'path': PrimitiveType.STRING,
    },
    permissions: [ScriptPermission.readFiles],
    description: 'Checks if the path is a directory.',
  );

  /// Checks if the path is a file.
  static final isFileBinding = RuntimeBinding<bool>(
    name: 'isFile',
    function: (String path) async {
      return await FileSystemEntity.isFile(path);
    },
    positionalParams: {
      'path': PrimitiveType.STRING,
    },
    permissions: [ScriptPermission.readFiles],
    description: 'Checks if the path is a file.',
  );

  /// Gets the absolute path of a file or directory.
  static final absolutePathBinding = RuntimeBinding<String>(
    name: 'absolute',
    function: (String path) {
      final entity = File(path);
      return entity.absolute.path;
    },
    positionalParams: {
      'path': PrimitiveType.STRING,
    },
    permissions: [ScriptPermission.readFiles],
    description:
        'Gets the absolute path of a file or directory at the given [path].',
  );

  /// Returns the current working directory.
  static final currentDirectoryBinding = RuntimeBinding<String>(
    name: 'cwd',
    function: () => Directory.current.path,
    permissions: [ScriptPermission.readFiles],
    description: 'Returns the current working directory.',
  );

  /// Moves a file or directory to a new location.
  static final moveBinding = RuntimeBinding<void>(
    name: 'move',
    function: ({required String from, required String to}) async {
      final source = File(from);
      if (!source.existsSync()) {
        throw FileSystemException('Source file not found', from);
      }
      await source.rename(to);
    },
    namedParams: {
      #from: PrimitiveType.STRING,
      #to: PrimitiveType.STRING,
    },
    permissions: [ScriptPermission.writeFiles, ScriptPermission.readFiles],
    description: 'Moves a file or directory from [from] to [to].',
  );

  /// Copies a file or directory to a new location.
  static final copyBinding = RuntimeBinding<void>(
    name: 'copy',
    function: ({required String from, required String to}) async {
      final source = File(from);
      if (!source.existsSync()) {
        throw FileSystemException('Source file not found', from);
      }
      await source.copy(to);
    },
    namedParams: {
      #from: PrimitiveType.STRING,
      #to: PrimitiveType.STRING,
    },
    permissions: [ScriptPermission.writeFiles, ScriptPermission.readFiles],
    description: 'Copies a file or directory from [from] to [to].',
  );

  /// Gets the size of a file in bytes.
  static final fileSizeBinding = RuntimeBinding<int>(
    name: 'size',
    function: (String path) async {
      final file = File(path);
      if (!file.existsSync()) {
        throw FileSystemException('File not found', path);
      }
      return await file.length();
    },
    positionalParams: {
      'path': PrimitiveType.STRING,
    },
    permissions: [ScriptPermission.readFiles],
    description: 'Gets the size of a file at the given [path] in bytes.',
  );

  /// Gets the file extension of a file.
  static final extensionBinding = RuntimeBinding<String>(
    name: 'extension',
    function: (String path) {
      final file = File(path);

      if (!path.contains('.')) {
        return '';
      }

      return file.uri.pathSegments.last.split('.').last;
    },
    positionalParams: {
      'path': PrimitiveType.STRING,
    },
    description:
        'Gets the file extension of the given [path]. Returns an empty string if no extension is found.',
  );

  /// Gets the base name of a file or directory.
  static final basenameBinding = RuntimeBinding<String>(
    name: 'basename',
    function: (String path) {
      final file = File(path);
      final name = file.uri.pathSegments.last;

      if (name.contains('.')) {
        return name.split('.').first;
      }

      return name;
    },
    positionalParams: {
      'path': PrimitiveType.STRING,
    },
    description: 'Gets the base name of the given [path].',
  );

  /// Gets the directory name of a file or directory.
  static final dirnameBinding = RuntimeBinding<String>(
    name: 'dirname',
    function: (String path) {
      return FileSystemEntity.parentOf(path);
    },
    positionalParams: {
      'path': PrimitiveType.STRING,
    },
    description: r"""
The parent path of a path.

Finds the final path component of a path, using the platform's path separator to split the path, and returns the prefix up to that part.

Will not remove the root component of a Windows path, like "C:\" or "\\server_name\". Includes a trailing path separator in the last part of [path], and leaves no trailing path separator.
""",
  );
}
