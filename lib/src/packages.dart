// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path/path.dart' as path;
import 'package:pub_semver/pub_semver.dart';
import 'package:pubspec/pubspec.dart';

class Workspace {
  Workspace(this.packages);

  static Future<Workspace> find() async {
    final packages = await Directory.current
        .list(recursive: true)
        .where((e) => e is File)
        .where((e) => !e.uri.pathSegments.contains('.dart_tool'))
        .where((e) => path.basename(e.path) == 'pubspec.yaml')
        .asyncMap((file) async {
      final pubspec = await PubSpec.loadFile(file.path);

      return Package(pubspec: pubspec, path: file.parent.path);
    }).toList();

    final names = <String>{};
    for (final package in packages) {
      if (names.contains(package.name)) {
        throw Exception('Duplicate package name found: ${package.name} (path: ${package.path})');
      }
      names.add(package.name);
    }

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
  Iterable<Package> packagesInDependencyOrder() sync* {
    final visitedPackages = <String>{};

    bool didVisitAllPackages() =>
        visitedPackages.containsAll(packages.map((e) => e.name));

    while (!didVisitAllPackages()) {
      for (final package in packages) {
        if (visitedPackages.contains(package.name)) continue;

        final didVisitAllDependencies = visitedPackages.containsAll(
          dependenciesInWorkspace(package),
        );

        if (!didVisitAllDependencies) continue;
        yield package;
        visitedPackages.add(package.name);
      }
    }
  }
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
}
