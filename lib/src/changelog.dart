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

  static PackageUpdateType? fromChangelog(Changelog changelog) {
    final firstLine = changelog.changelogContent.firstOrNull;
    if (firstLine == null || !firstLine.startsWith('## Unreleased ')) {
      return null;
    }

    // Obtain the keyword after "## Unreleased"
    final flagRegex = RegExp('## Unreleased (.*)');
    final flag = flagRegex.firstMatch(firstLine)?.group(1)?.trim();

    return PackageUpdateType.fromString(flag);
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

extension<T> on List<T> {
  Iterable<ListSlice<T>> sliceWhile(
    bool Function(T element) test,
  ) sync* {
    var start = 0;
    int? index;
    for (final entry in indexed.skip(1)) {
      index = entry.$1;
      if (!test(this[index])) {
        yield slice(start, index);
        start = index;
      }
    }

    if (index != start) {
      yield slice(start);
    }
  }
}

class Changelog {
  Changelog(this.changelogContent);
  static final empty = Changelog([]);

  final List<String> changelogContent;
  late final PackageUpdateType? type = PackageUpdateType.fromChangelog(this);

  Iterable<({String header, String content})> sections() {
    return changelogContent
        .sliceWhile((line) => !line.startsWith('## '))
        .map((slice) {
      return (
        header: slice.first,
        content: slice.slice(1).join('\n').trim(),
      );
    });
  }

  static Future<Changelog?> tryParse(Package package) async {
    try {
      final lines = await package.changelog.readAsLines();

      return Changelog(lines);
    } on PathNotFoundException {
      return null;
    }
  }

  String newVersionChangelogHeader(String newVersion) {
    return '## $newVersion - ${DateTime.now().toIso8601String().split('T').first}';
  }
}

class Patch {
  Patch(this.run);
  final Future<void> Function() run;
}

class PackageUpdate {
  PackageUpdate(this.package, this.changelog);

  final Package package;
  final Set<PackageUpdate> dependencyChanges = {};
  final Set<PackageUpdate> otherDependencyChanges = {};
  final Changelog? changelog;
  Patch? changelogPatch;

  Version? newVersion() {
    switch (changelog?.type) {
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

      case null when dependencyChanges.isNotEmpty:
        final version = package.version!;

        if (version.isPreRelease) return version.nextPre;
        return version.nextPatch;

      case null:
        return null; // No update
    }
  }

  String? newVersionChangelogHeader() {
    final newVersion = this.newVersion();
    final changelog = this.changelog;

    if (newVersion == null || changelog == null) return null;
    return changelog.newVersionChangelogHeader(newVersion.toString());
  }
}
