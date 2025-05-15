part of '../ast.dart';

/// Parser extension for parsing metadata annotations.
extension MetadataParser on Parser {
  /// Parses the script version.
  Version _parseVersion() {
    Version version;

    consume<VersionToken>();
    final versionToken = consume<StringToken>();
    final versionString = versionToken.value;
    try {
      version = Version.parse(versionString);
      consume<SemiColonToken>();
    } on FormatException {
      throw ParseException(
        'Invalid version format: "$versionString". Version must follow semantic versioning (see https://semver.org/).',
        line: versionToken.line,
        column: versionToken.column,
      );
    }

    return version;
  }

  /// Parses the script author.
  String _parseAuthor() {
    consume<AuthorToken>();
    final authorToken = consume<StringToken>();
    final author = authorToken.value;
    consume<SemiColonToken>();

    return author;
  }

  /// Parses the script name.
  String _parseName() {
    consume<NameToken>();
    final nameToken = consume<StringToken>();
    final name = nameToken.value;
    consume<SemiColonToken>();

    return name;
  }

  /// Parses the script description.
  String _parseDescription() {
    consume<DescriptionToken>();
    final descriptionToken = consume<StringToken>();
    final description = descriptionToken.value;
    consume<SemiColonToken>();

    return description;
  }

  /// Parses the script license.
  String _parseLicense() {
    consume<LicenseToken>();
    final licenseToken = consume<StringToken>();
    final license = licenseToken.value;
    consume<SemiColonToken>();

    return license;
  }

  /// Parses the script website.
  String _parseWebsite() {
    consume<WebsiteToken>();
    final websiteToken = consume<StringToken>();
    final website = websiteToken.value;
    consume<SemiColonToken>();

    return website;
  }

  /// Parses the script repository.
  String _parseRepo() {
    consume<RepoToken>();
    final repoToken = consume<StringToken>();
    final repo = repoToken.value;
    consume<SemiColonToken>();

    return repo;
  }

  List<PermissionStmt> _parsePermissions() {
    final List<PermissionStmt> permissions = [];

    consume<PermissionToken>();
    while (peek() is! SemiColonToken) {
      if (peek() is CommaToken) {
        consume<CommaToken>();
        continue;
      }
      final namespace = consume<IdentifierToken>();
      consume<DoubleColonToken>();
      final permission = consume<IdentifierToken>();
      permissions.add(PermissionStmt(namespace.value, permission.value));
    }
    consume<SemiColonToken>();
    return permissions;
  }
}
