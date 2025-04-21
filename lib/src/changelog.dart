// ignore_for_file: public_member_api_docs

import 'dart:io';

import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pub_semver/pub_semver.dart';

import 'packages.dart';

part 'changelog.freezed.dart';

extension VersionX on Version {
  Version get nextPre {
    String? pre;

    if (preRelease case [final String flag, final int build]) {
      pre = '$flag.${build + 1}';
    }

    return Version(major, minor, patch, pre: pre);
  }
}

sealed class _FlaggedPackageUpdateType {
  String? get flag;
}

@freezed
sealed class PackageUpdateType with _$PackageUpdateType {
  @Implements<_FlaggedPackageUpdateType>()
  const factory PackageUpdateType.breaking({String? flag}) = _Breaking;
  @Implements<_FlaggedPackageUpdateType>()
  const factory PackageUpdateType.major({String? flag}) = _Major;
  @Implements<_FlaggedPackageUpdateType>()
  const factory PackageUpdateType.minor({String? flag}) = _Minor;
  @Implements<_FlaggedPackageUpdateType>()
  const factory PackageUpdateType.patch({String? flag}) = _Patch;

  const factory PackageUpdateType.build() = _Build;

  const factory PackageUpdateType.version(Version version) = _Version;

  factory PackageUpdateType.dependencyChange(Version version) {
    if (version.isPreRelease) {
      return PackageUpdateType.version(version.nextPre);
    } else {
      return PackageUpdateType.version(version.nextPatch);
    }
  }

  static PackageUpdateType fromString(String? value) {
    final split = value?.split(' ')?..removeWhere((e) => e.isEmpty);

    final bump = split?.firstOrNull;
    if (bump == null) {
      throw ArgumentError.value(value, 'value');
    }

    try {
      return PackageUpdateType.version(Version.parse(bump));
    } catch (e) {
      // Failed to parse the update as a version number, continue
    }

    final flag = split?.elementAtOrNull(1);

    switch (split?.firstOrNull) {
      case 'breaking':
        return PackageUpdateType.breaking(flag: flag);
      case 'major':
        return PackageUpdateType.major(flag: flag);
      case 'minor':
        return PackageUpdateType.minor(flag: flag);
      case 'fix':
      case 'patch':
        return PackageUpdateType.patch(flag: flag);
      case 'build':
        return const PackageUpdateType.build();
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
      case _Version(:final version):
        return version;

      case _Build():
        return package.version!.nextPre;

      case final _FlaggedPackageUpdateType type:
        final flaglessNewVersion = switch (type) {
          _Breaking() => package.version!.nextBreaking,
          _Major() => package.version!.nextMajor,
          _Minor() => package.version!.nextMinor,
          _Patch() => package.version!.nextPatch,
        };

        return Version(
          flaglessNewVersion.major,
          flaglessNewVersion.minor,
          flaglessNewVersion.patch,
          pre: type.flag,
        );
    }
  }();

  String get newVersionChangelogHeader {
    return '## $newVersion - ${DateTime.now().toIso8601String().split('T').first}';
  }
}
