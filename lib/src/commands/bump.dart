import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:args/command_runner.dart';
import 'package:collection/collection.dart';
import 'package:melos/melos.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:pubspec/pubspec.dart';

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
      var update = await PackageUpdate.tryParse(package);
      if (update != null) {
        versionBumps[package.name] = update;
        // We continue to compute dependency changes in case, if any
      }

      // Check if any of the dependencies has a version bump
      final dependencyChanges = package.dependenciesInWorkspace.values
          .map((dependency) => versionBumps[dependency.name])
          .whereNotNull()
          .toList();

      if (dependencyChanges.isEmpty) return;

      final lockedDependencyChanges =
          _findLockedDependencyChanges(package, dependencyChanges);

      if (update == null) {
        // If a package has no updates but some dependency changes, we need to
        // bump the version of this package to match. But only do so if the
        // pubspec of the package has a version number.
        if (package.pubSpec.version == null) return;
        update = versionBumps[package.name] = PackageUpdate(
          package,
          lockedDependencyChanges ?? const PackageUpdateType.patch(),
        );

        if (package.changelog.existsSync()) {
          // Patch the changelog to add a new section for the new version
          update.changelogPatch = Patch(
            () async => package.changelog.writeAsString(
              '''
${update!.newVersionChangelogHeader}

${dependencyChanges.map((e) => '- `${e.package.name}` upgraded to `${e.newVersion}`').join('\n')}

${await package.changelog.readAsString()}''',
            ),
          );
        }
      }

      update.dependencyChanges.addAll(dependencyChanges);
    });
    return versionBumps;
  }
}

extension on Package {
  bool isLockedWithDependency(String dependencyName) {
    return isLockedWithDependencyReference(
          pubSpec.dependencies[dependencyName],
        ) ||
        isLockedWithDependencyReference(
          pubSpec.devDependencies[dependencyName],
        );
  }

  bool isLockedWithDependencyReference(
    DependencyReference? dependencyReference,
  ) {
    if (dependencyReference is! HostedReference) return false;

    return dependencyReference.versionConstraint is Version;
  }
}

PackageUpdateType? _findLockedDependencyChanges(
  Package package,
  List<PackageUpdate> dependencyChanges,
) {
  PackageUpdateType? result;
  for (final lockedDependency in dependencyChanges
      .where((e) => package.isLockedWithDependency(e.package.name))) {
    if (result != null && result != lockedDependency.type) return null;

    result = lockedDependency.type;
  }

  return result;
}
