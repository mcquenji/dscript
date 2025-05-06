part of 'lexer.dart';

/// A token representing a keyword to define script metadata.
sealed class MetadataToken extends KeywordToken {
  /// Creates a metadata token with the given [value], and optional [line] and [column].
  const MetadataToken(super.value, {super.line, super.column});

  /// Demotes this keyword token to a generic identifier token.
  IdentifierToken demote() {
    return IdentifierToken(value, line: line, column: column);
  }
}

/// Token representing the `version` keyword.
class VersionToken extends MetadataToken {
  /// Creates a `version` keyword token with optional position metadata.
  const VersionToken({super.line, super.column}) : super('version');
}

/// Token representing the `author` keyword.
class AuthorToken extends MetadataToken {
  /// Creates an `author` keyword token with optional position metadata.
  const AuthorToken({super.line, super.column}) : super('author');
}

/// Token representing the `name` keyword.
class NameToken extends MetadataToken {
  /// Creates a `name` keyword token with optional position metadata.
  const NameToken({super.line, super.column}) : super('name');
}

/// Token representing the `description` keyword.
class DescriptionToken extends MetadataToken {
  /// Creates a `description` keyword token with optional position metadata.
  const DescriptionToken({super.line, super.column}) : super('description');
}

/// Token representing the `license` keyword.
class LicenseToken extends MetadataToken {
  /// Creates a `license` keyword token with optional position metadata.
  const LicenseToken({super.line, super.column}) : super('license');
}

/// Token representing the `website` keyword.
class WebsiteToken extends MetadataToken {
  /// Creates a `website` keyword token with optional position metadata.
  const WebsiteToken({super.line, super.column}) : super('website');
}

/// Token representing the `repo` keyword.
class RepoToken extends MetadataToken {
  /// Creates a `repo` keyword token with optional position metadata.
  const RepoToken({super.line, super.column}) : super('repo');
}

/// Token representing the `permissions` keyword.
///
/// Begins a permissions block listing required capabilities for the plugin.
class PermissionToken extends MetadataToken {
  /// Creates a `permissions` keyword token with optional position metadata.
  const PermissionToken({super.line, super.column}) : super('permissions');
}
