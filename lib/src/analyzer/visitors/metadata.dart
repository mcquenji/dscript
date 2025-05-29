part of 'visitors.dart';

/// Extracts metadata from the script.
class MetadataVisitor extends AnalysisVisitor {
  /// Extracts metadata from the script.
  MetadataVisitor(super._parent);

  @override
  $Type? visitAuthor(AuthorContext ctx) {
    if (author != null) {
      report(SemanticError('Author already defined', ctx: ctx));
    }

    author = ctx.STRING()!.innerText!;

    return const InvalidType();
  }

  @override
  $Type? visitName(NameContext ctx) {
    if (name != null) {
      report(SemanticError('Name already defined', ctx: ctx));
    }

    name = ctx.STRING()!.innerText!;

    return const InvalidType();
  }

  @override
  $Type? visitVersion(VersionContext ctx) {
    if (version != null) {
      report(SemanticError('Version already defined', ctx: ctx));
    }

    version = Version.parse(ctx.SEMVER()!.text!);

    return const InvalidType();
  }

  @override
  $Type? visitDescription(DescriptionContext ctx) {
    final txt = ctx.STRING()!.innerText!;

    description = description.isEmpty ? txt : '$description\n$txt';

    return const InvalidType();
  }

  @override
  $Type? visitLicense(LicenseContext ctx) {
    if (license != null) {
      report(SemanticError('License already defined', ctx: ctx));
    }

    license = ctx.STRING()!.innerText!;

    return const InvalidType();
  }

  @override
  $Type? visitRepo(RepoContext ctx) {
    if (repository != null) {
      report(SemanticError('Repository already defined', ctx: ctx));
    }

    repository = ctx.STRING()!.innerText!;

    return const InvalidType();
  }

  @override
  $Type? visitWebsite(WebsiteContext ctx) {
    if (website != null) {
      report(SemanticError('Website already defined', ctx: ctx));
    }

    website = ctx.STRING()!.innerText!;

    return const InvalidType();
  }
}
