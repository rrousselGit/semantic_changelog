import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:ansi/ansi.dart';
import 'package:args/command_runner.dart';
import 'package:melos/melos.dart';

import '../changelog.dart';
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
    final branchName = argResults?.arguments.firstOrNull ?? 'master';
    final changedFiles = await computeChangedPaths(branchName);

    await _groupChangedFiles(changedFiles);
  }
}

typedef Project = ({
  Package package,
  PackageUpdate update,
  List<String> changedFiles,
});

Future<List<Project>> _groupChangedFiles(List<String> changedFiles) async {
  final pubspecForChanges = <({File pubspec, String changedFile})>[];
  for (final changedFile in changedFiles) {
    final enclosingPubspec = findAncestorFile(
      changedFile,
      'pubspec.yaml',
      root: Directory.current.path,
    );

    if (enclosingPubspec == null) {
      // No enclosing pubspec.yaml found, this change is not in a package.
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
  await visitPackagesInDependencyOrder((package) async {
    if (package.publishTo != null) return;

    final changes = <String>[];

    for (final pubspecForChange in pubspecForChanges) {
      if (package.pubspecFile.absoluteNormalizedPath ==
          pubspecForChange.pubspec.absoluteNormalizedPath) {
        changes.add(pubspecForChange.changedFile);
      }
    }

    if (changes.isNotEmpty) {
      final update = await PackageUpdate.tryParse(package);

      if (update == null) {
        stderr.writeln(
          '''
Changes detected for package `${package.name.red()}` at `${package.pathRelativeToWorkspace}`, but no ${'CHANGELOG.md'.green()} entry found.
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
          update: update,
          changedFiles: changes,
        ),
      );
    }
  });

  return result;
}
