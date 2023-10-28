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
      throw ArgumentError(
        'Detected changed file $changedFile, but could not find an associated pubspec.yaml.',
      );
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
          'Changes detected for package `${package.name.red()}` at `${package.pathRelativeToWorkspace}`, '
          'no ${'CHANGELOG.md'.green()} entry found.\n'
          'Please add a ${'CHANGELOG.md'.green()} entry for this package.\n\n'
          'Changed files (total ${changes.length}):\n'
          '${changes.map((e) => '  $e\n').join()}\n',
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
