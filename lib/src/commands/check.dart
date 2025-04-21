import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:ansi/ansi.dart';
import 'package:args/command_runner.dart';
import 'package:path/path.dart' as p;

import '../file.dart';
import '../git.dart';
import '../packages.dart';

/// The "bump" command.
class CheckCommand extends Command<void> {
  @override
  String get description =>
      'Verifies that a CHANGELOG.md is present for all updated packages';

  @override
  String get name => 'check';

  @override
  FutureOr<void>? run() async {
    final branchName = argResults?.arguments.firstOrNull;
    final changedFiles = await computeChangedPaths(branchName);

    await _groupChangedFiles(changedFiles);
  }
}

typedef Project = ({
  Package package,
  List<String> changedFiles,
});

Future<List<Project>> _groupChangedFiles(List<String> changedFiles) async {
  final pubspecForChanges = <({File pubspec, String changedFile})>[];
  for (final changedFile in changedFiles) {
    if (p.extension(changedFile) != '.dart') {
      // We only care about Dart files.
      continue;
    }
    if (p.basenameWithoutExtension(changedFile).contains('.')) {
      // Generated file, skip it.
      continue;
    }

    final enclosingPubspec = findAncestorFile(
      changedFile,
      'pubspec.yaml',
      root: Directory.current.path,
    );

    if (enclosingPubspec == null) {
      // No enclosing pubspec.yaml found, this change is not in a package.
      continue;
    }
    final testFolder = p.join(
      enclosingPubspec.parent.path,
      'test',
    );

    if (!p.isWithin(testFolder, changedFile)) {
      // We only count changes in the test folder.
      continue;
    }

    pubspecForChanges.add(
      (
        pubspec: enclosingPubspec,
        changedFile: changedFile,
      ),
    );
  }

  final result = <Project>[];
  final workspace = await Workspace.find();

  await workspace.visitPackagesInDependencyOrder((package) async {
    if (package.pubspec.publishTo != null) return;

    final changes = <String>[];

    for (final pubspecForChange in pubspecForChanges) {
      if (p.equals(package.pubspecFile.path, pubspecForChange.pubspec.path)) {
        changes.add(pubspecForChange.changedFile);
      }
    }

    if (changes.isNotEmpty) {
      // Check if the CHANGELOG.md of this package was modified.
      if (!changedFiles.any((e) => p.equals(e, package.changelog.path))) {
        stderr.writeln(
          '''
Changes detected for package `${package.name.red()}` at `${package.relativePath}`, but no ${'CHANGELOG.md'.green()} entry found.
Please add a ${'CHANGELOG.md'.green()} entry for this package.
To do so, start the CHANGELOG.md with `## Unreleased major/minor/patch` and explain the changes introduced.

Changed files (total ${changes.length}):
${changes.map((e) => '  $e\n').join()}
          
''',
        );
        exitCode = 1;
        return;
      }

      result.add(
        (
          package: package,
          changedFiles: changes,
        ),
      );
    }
  });

  return result;
}
