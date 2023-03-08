import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:args/command_runner.dart';
import 'package:collection/collection.dart';

import '../changelog.dart';
import '../packages.dart';

/// The "bump" command.
class BumpCommand extends Command<void> {
  @override
  String get description => 'Updates the version of the packages with '
      'changes within the project.';

  @override
  String get name => 'bump';

  void _logChanges(Map<String, PackageUpdate> versionBumps) {
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

  Future<void> _applyBumps(Map<String, PackageUpdate> versionBumps) async {
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

  Future<Map<String, PackageUpdate>> _computeBumps() async {
    final versionBumps = <String, PackageUpdate>{};

    await visitPackagesInDependencyOrder((package) async {
      if (package.pubSpec.publishTo.toString() == 'none') {
        return;
      }

      var update = await PackageUpdate.tryParse(package);
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
      update = versionBumps[package.name] = PackageUpdate(
        package,
        PackageUpdateType.patch,
      );

      // Patch the changelog to add a new section for the new version
      update.changelogPatch = Patch(
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
