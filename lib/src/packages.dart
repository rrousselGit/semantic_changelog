// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:cli_util/cli_logging.dart';
import 'package:collection/collection.dart';
import 'package:melos/melos.dart';
import 'package:path/path.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:yaml/yaml.dart';

import 'changelog.dart';

/// Visits the packages in dependency order.
///
/// This visit all packages while guaranteeing that all dependencies
/// of a package are visited first, yes visit packages only once.
Future<void> visitPackagesInDependencyOrder(
  FutureOr<void> Function(Package package) visitor,
) async {
  final packages = await findPackages();

  final packageQueue = LinkedList<_Entry<Package>>();
  packageQueue.addAll(packages.map(_Entry.new));

  final visitedPackages = <Package>{};

  while (packageQueue.isNotEmpty) {
    // Using toList() to avoid concurrent modification
    for (final entry in packageQueue.toList()) {
      final package = entry.value;
      if (visitedPackages.contains(package)) continue;

      // Check that all dependencies have been visited
      if (!package.dependenciesInWorkspace.values
          .every(visitedPackages.contains)) {
        // One of the dependency has not been visited yet
        // We need to visit it first.
        continue;
      }

      // All dependencies have been visited, we can visit this package
      visitedPackages.add(package);
      packageQueue.remove(entry);

      await visitor(package);
    }
  }
}

/// Lists all the packages within the current directory.
Future<List<Package>> findPackages() async {
  final configs = await MelosWorkspaceConfig.fromWorkspaceRoot(Directory.current);
  final workspace = await MelosWorkspace.fromConfig(
    configs,
    logger: MelosLogger(Logger.standard()),
  );
  return workspace.allPackages.values.toList();
}

class _Entry<T> extends LinkedListEntry<_Entry<T>> {
  _Entry(this.value);

  final T value;
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

extension PackageMeta on Package {
  File get pubspecFile => File(join(path, 'pubspec.yaml'));

  File get changelog => File(join(path, 'CHANGELOG.md'));

  String get gitTagName => '$name-v$version';

  Future<void> publish() async {
    final result = await Process.run(
      'dart',
      ['pub', 'publish', '--force'],
      workingDirectory: path,
      stderrEncoding: utf8,
    );

    if (result.exitCode != 0) {
      throw Exception(result.stderr);
    }
  }

  Future<void> tag() async {
    final result = await Process.run(
      'git',
      ['tag', gitTagName],
      workingDirectory: path,
      stderrEncoding: utf8,
    );

    if (result.exitCode != 0) {
      throw Exception(result.stderr);
    }
  }

  Future<bool> hasTag() async {
    final result = await Process.run(
      'git',
      ['tag', '-l', gitTagName],
      workingDirectory: path,
      stdoutEncoding: utf8,
      stderrEncoding: utf8,
    );

    if (result.exitCode != 0) {
      throw Exception(result.stderr);
    }

    return result.stdout.toString().isNotEmpty;
  }

  Future<void> updatePubspec(
    Version newVersion, {
    required Set<PackageUpdate> dependencyChanges,
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
}
