// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';
import 'package:path/path.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:pubspec/pubspec.dart';
import 'package:yaml/yaml.dart';

import 'changelog.dart';

class Workspace {
  Workspace(this.packages);

  static Future<Workspace> find() async {
    final packages = await Glob('**/pubspec.yaml', recursive: true)
        .list()
        .asyncMap((file) async {
      final pubspec = await PubSpec.loadFile(file.path);

      return Package(pubspec: pubspec, path: file.parent.path);
    }).toList();

    return Workspace(packages);
  }

  final List<Package> packages;
  late final Set<String> uniqueDependencyNames =
      packages.map((e) => e.name).toSet();

  Set<String> dependenciesInWorkspace(Package package) =>
      uniqueDependencyNames.intersection(package.uniqueDependencyNames);

  /// Visits the packages in dependency order.
  ///
  /// This visit all packages while guaranteeing that all dependencies
  /// of a package are visited first, yet visit packages only once.
  Future<void> visitPackagesInDependencyOrder(
    Future<void> Function(Package package) visitor,
  ) async {
    final futures = <Future<void>>[];
    final visitedPackages = <Package>{};

    void recurs(Package package) {
      if (visitedPackages.contains(package)) return;
      visitedPackages.add(package);

      for (final childName in dependenciesInWorkspace(package)) {
        final child = packages.firstWhere((p) => p.name == childName);

        recurs(child);
      }

      futures.add(visitor(package));
    }

    packages.forEach(recurs);

    await Future.wait(futures);
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

class Package {
  Package({required this.pubspec, required this.path});

  final PubSpec pubspec;
  final String path;

  late final uniqueDependencyNames = pubspec.allDependencies.keys.toSet();

  String get name => pubspec.name!;
  Version? get version => pubspec.version;
  File get pubspecFile => File(join(path, 'pubspec.yaml'));
  File get changelog => File(join(path, 'CHANGELOG.md'));
  String get gitTagName => '$name-v${version!}';

  String get relativePath => normalize(relative(path));

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

        edits.add(
          _Edit(
            dependency.value.span.start.offset,
            dependency.value.span.end.offset,
            dependencyChange.newVersion.toString(),
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
