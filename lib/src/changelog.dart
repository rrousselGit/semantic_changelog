// ignore_for_file: public_member_api_docs

import 'dart:io';

import 'package:collection/collection.dart';
import 'package:melos/melos.dart';
import 'package:pub_semver/pub_semver.dart';

import 'packages.dart';

enum PackageUpdateType {
  breaking,
  major,
  minor,
  patch;

  static PackageUpdateType fromString(String? value) {
    switch (value) {
      case 'breaking':
        return PackageUpdateType.breaking;
      case 'major':
        return PackageUpdateType.major;
      case 'minor':
        return PackageUpdateType.minor;
      case 'fix':
      case 'patch':
        return PackageUpdateType.patch;
      default:
        throw ArgumentError.value(value, 'value');
    }
  }
}

class Patch {
  Patch(this.run);
  final Future<void> Function() run;
}

class PackageUpdate {
  PackageUpdate(this.package, this.type);

  static Future<PackageUpdate?> tryParse(Package package) async {
    List<String> changelogContent;
    try {
      changelogContent = await package.changelog.readAsLines();
    } on FileSystemException {
      // File not found
      return null;
    }

    final firstLine = changelogContent.firstOrNull;
    if (firstLine == null || !firstLine.startsWith('## Unreleased ')) {
      return null;
    }

    // Obtain the keyword after "## Unreleased"
    final flagRegex = RegExp('## Unreleased (.*)');
    final flag = flagRegex.firstMatch(firstLine)?.group(1)?.trim();

    final updateType = PackageUpdateType.fromString(flag);
    final update = PackageUpdate(package, updateType);

    // Patch the changelog to replace the Unreleased with the version number
    final newChangelog = StringBuffer();
    newChangelog.writeln(update.newVersionChangelogHeader);
    changelogContent.skip(1).forEach(newChangelog.writeln);

    update.changelogPatch = Patch(
      () => package.changelog.writeAsString(newChangelog.toString()),
    );

    return update;
  }

  final Package package;
  final PackageUpdateType type;
  final Set<PackageUpdate> dependencyChanges = {};
  Patch? changelogPatch;

  late final Version newVersion = () {
    switch (type) {
      case PackageUpdateType.breaking:
        return package.version.nextBreaking;
      case PackageUpdateType.major:
        return package.version.nextMajor;
      case PackageUpdateType.minor:
        return package.version.nextMinor;
      case PackageUpdateType.patch:
        return package.version.nextPatch;
    }
  }();

  String get newVersionChangelogHeader {
    return '## $newVersion - ${DateTime.now().toIso8601String().split('T').first}';
  }
}
