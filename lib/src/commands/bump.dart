import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:args/command_runner.dart';
import 'package:collection/collection.dart';
import 'package:melos/melos.dart';
import 'package:path/path.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:yaml/yaml.dart';

import '../packages.dart';

/// The "bump" command.
class BumpCommand extends Command<void> {
  @override
  String get description => 'Updates the version of the packages with '
      'changes within the project.';

  @override
  String get name => 'bump';

  void _logChanges(Map<String, _PackageUpdate> versionBumps) {
    final longestPackageNameLength =
        versionBumps.keys.map((e) => e.length).reduce(max);

    final buffer = StringBuffer(
      'The following packages have been updated:\n',
    );
    for (final update in versionBumps.values) {
      buffer.writeln(
        '${update.package.name.padRight(longestPackageNameLength)} : ${update.package.version} -> ${update.newVersion}',
      );
    }

    stdout.write(buffer.toString());
  }

  @override
  FutureOr<void>? run() async {
    final versionBumps = await _computeBumps();
    await _applyBumps(versionBumps);
    _logChanges(versionBumps);
  }

  Future<void> _applyBumps(Map<String, _PackageUpdate> versionBumps) async {
    await Future.wait(
      versionBumps.values
          .expand(
            (update) => [
              update.changelogPatch?.run(),
              Future(
                () => update.package.updatePubspec(
                  update.newVersion,
                  dependencyChanges: update.dependencyChanges,
                ),
              ),
            ],
          )
          .whereNotNull(),
    );
  }

  Future<Map<String, _PackageUpdate>> _computeBumps() async {
    final versionBumps = <String, _PackageUpdate>{};

    await visitPackagesInDependencyOrder((package) async {
      if (package.pubSpec.publishTo.toString() == 'none') {
        return;
      }

      var update = await package.computePackageUpdateFromChangelog();
      if (update != null) {
        versionBumps[package.name] = update;
        return;
      }

      // Check if any of the dependencies has a version bump
      final dependencyChanges = package.dependenciesInWorkspace.values
          .map((dependency) => versionBumps[dependency.name])
          .whereNotNull()
          .toList();

      if (dependencyChanges.isEmpty) return;

      // If a dependency has a version bump, we need to bump the version of this
      // package as well.
      update = versionBumps[package.name] = _PackageUpdate(
        package,
        _PackageUpdateType.patch,
      );

      // Patch the changelog to add a new section for the new version
      update.changelogPatch = _Patch(
        () async => package.changelog.writeAsString(
          '''
    ${update!.newVersionChangelogHeader}
    
    ${dependencyChanges.map((e) => '- `${e.package.name}` upgraded to `${e.newVersion}`').join('\n')}
    
    ${await package.changelog.readAsString()}
    ''',
        ),
      );

      update.dependencyChanges.addAll(dependencyChanges);
    });
    return versionBumps;
  }
}

enum _PackageUpdateType {
  breaking,
  major,
  minor,
  patch;

  static _PackageUpdateType fromString(String? value) {
    switch (value) {
      case 'breaking':
        return _PackageUpdateType.breaking;
      case 'major':
        return _PackageUpdateType.major;
      case 'minor':
        return _PackageUpdateType.minor;
      case 'fix':
      case 'patch':
        return _PackageUpdateType.patch;
      default:
        throw ArgumentError.value(value, 'value');
    }
  }
}

class _Patch {
  _Patch(this.run);
  final Future<void> Function() run;
}

class _PackageUpdate {
  _PackageUpdate(this.package, this.type);

  final Package package;
  final _PackageUpdateType type;
  final Set<_PackageUpdate> dependencyChanges = {};
  _Patch? changelogPatch;

  late final Version newVersion = () {
    switch (type) {
      case _PackageUpdateType.breaking:
        return package.version.nextBreaking;
      case _PackageUpdateType.major:
        return package.version.nextMajor;
      case _PackageUpdateType.minor:
        return package.version.minor == 0
            ? package.version.nextPatch
            : package.version.nextMinor;
      case _PackageUpdateType.patch:
        return package.version.nextPatch;
    }
  }();

  String get newVersionChangelogHeader {
    return '## $newVersion - ${DateTime.now().toIso8601String().split('T').first}';
  }
}

extension on Object? {
  R? safeCast<R>() {
    final that = this;
    if (that is R) return that;
    return null;
  }
}

extension on YamlMap {
  MapEntry<dynamic, YamlNode>? findEntry(String key) {
    return nodes.entries.firstWhereOrNull((e) => e.key.toString() == key);
  }
}

class _Edit {
  _Edit(this.start, this.end, this.content);

  final int start;
  final int end;
  final String content;
}

extension on Package {
  File get pubspecFile => File(join(path, 'pubspec.yaml'));

  File get changelog => File(join(path, 'CHANGELOG.md'));

  Future<void> updatePubspec(
    Version newVersion, {
    required Set<_PackageUpdate> dependencyChanges,
  }) async {
    final edits = <_Edit>[];

    final pubspecContent = await pubspecFile.readAsString();
    final pubspecYaml = loadYamlNode(
      pubspecContent,
      sourceUrl: pubspecFile.uri,
    );

    final versionNode = pubspecYaml.safeCast<YamlMap>()?.findEntry('version');

    final dependenciesNode = pubspecYaml
        .safeCast<YamlMap>()
        ?.nodes['dependencies']
        .safeCast<YamlMap>();
    final devDependenciesNode = pubspecYaml
        .safeCast<YamlMap>()
        ?.nodes['dev_dependencies']
        .safeCast<YamlMap>();
    final dependencyOverridesNode = pubspecYaml
        .safeCast<YamlMap>()
        ?.nodes['dependency_overrides']
        .safeCast<YamlMap>();

    // TODO handle "name:" placed after dependencies & co

    if (versionNode != null) {
      edits.add(
        _Edit(
          versionNode.value.span.start.offset,
          versionNode.value.span.end.offset,
          newVersion.toString(),
        ),
      );
    }

    for (final dependencyChange in dependencyChanges) {
      void editDependency(MapEntry<dynamic, YamlNode>? dependency) {
        if (dependency == null) return;

        final value = dependency.value.value;
        // Not a version number. Likely a git/path dependency.
        if (value is! String) return;

        VersionConstraint currentVersion;
        try {
          currentVersion = VersionConstraint.parse(value);
        } catch (err) {
          // Failed to parse the version, ignoring.
          return;
        }

        final isTightConstraints = currentVersion == version;

        edits.add(
          _Edit(
            dependency.value.span.start.offset,
            dependency.value.span.end.offset,
            isTightConstraints
                ? dependencyChange.newVersion.toString()
                : '^${dependencyChange.newVersion}',
          ),
        );
      }

      final dependency =
          dependenciesNode?.findEntry(dependencyChange.package.name);
      final devDependency =
          devDependenciesNode?.findEntry(dependencyChange.package.name);
      final dependencyOverride =
          dependencyOverridesNode?.findEntry(dependencyChange.package.name);

      editDependency(dependency);
      editDependency(devDependency);
      editDependency(dependencyOverride);
    }

    final newPubspecContent = StringBuffer();
    var lastOffset = 0;
    for (final edit in edits) {
      newPubspecContent.write(pubspecContent.substring(lastOffset, edit.start));
      newPubspecContent.write(edit.content);
      lastOffset = edit.end;
    }
    newPubspecContent.write(pubspecContent.substring(lastOffset));

    await pubspecFile.writeAsString(newPubspecContent.toString());
  }

  Future<_PackageUpdate?> computePackageUpdateFromChangelog() async {
    List<String> changelogContent;
    try {
      changelogContent = await changelog.readAsLines();
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

    final updateType = _PackageUpdateType.fromString(flag);
    final update = _PackageUpdate(this, updateType);

    // Patch the changelog to replace the Unrelased with the version number
    final newChangelog = StringBuffer(update.newVersionChangelogHeader);
    changelogContent.skip(1).forEach(newChangelog.writeln);

    update.changelogPatch = _Patch(
      () => changelog.writeAsString(newChangelog.toString()),
    );

    return update;
  }
}
