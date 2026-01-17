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

  void _logChanges(List<PackageUpdate> versionBumps) {
    final longestPackageNameLength =
        versionBumps.map((e) => e.package.name.length).reduce(max);

    final buffer = StringBuffer(
      'The following packages have been updated:\n',
    );
    for (final update in versionBumps) {
      buffer.writeln(
        '${update.package.name.padRight(longestPackageNameLength)} : ${update.package.version} -> ${update.newVersion()}',
      );
    }

    stdout.write(buffer.toString());
  }

  @override
  FutureOr<void>? run() async {
    final versionBumps = await _computePatches();
    await _applyBumps(versionBumps);
    _logChanges(versionBumps);
  }

  Future<void> _applyBumps(
    List<PackageUpdate> versionBumps,
  ) async {
    await Future.wait<void>(
      versionBumps.expand(
        (update) {
          final newVersion = update.newVersion();
          if (newVersion == null) return <Future<void>>[];

          return [
            if (update.changelogPatch case final changelog?) changelog.run(),
            update.package.updatePubspec(
              newVersion,
              dependencyChanges: update.dependencyChanges,
            ),
          ];
        },
      ).nonNulls,
    );
  }

  Future<List<PackageUpdate>> _computePatches() async {
    final workspace = await Workspace.find();

    final versionForPackage = <String, (PackageUpdate, Changelog?)>{};

    Iterable<PackageUpdate> dependencyChanges(Iterable<String> dependencies) {
      return dependencies
          .map((dependency) {
            return versionForPackage[dependency]?.$1;
          })
          .nonNulls
          .where((update) => update.newVersion() != null);
    }

    await workspace.visitPackagesInDependencyOrder((package) async {
      print(package.name);
      // if (package.pubspec.publishTo.toString() == 'none') return;
      if (versionForPackage.containsKey(package.name)) {
        throw Exception(
          'Duplicate package name found: ${package.name}',
        );
      }

      final changelog = await Changelog.tryParse(package);
      final update = PackageUpdate(package, changelog);
      versionForPackage[package.name] = (update, changelog);

      update.dependencyChanges.addAll(
        dependencyChanges(package.pubspec.dependencies.keys),
      );
      update.otherDependencyChanges.addAll(
        dependencyChanges(
          package.pubspec.devDependencies.keys
              .followedBy(package.pubspec.dependencyOverrides.keys),
        ),
      );

      if (changelog?.type != null || update.dependencyChanges.isNotEmpty) {
        // Patch the changelog to replace the Unreleased with the version number
        final newChangelog = StringBuffer();
        newChangelog.writeln(update.newVersionChangelogHeader());

        final sections = changelog?.sections().toList();
        if (sections?.firstOrNull case final section?
            when changelog?.type != null) {
          if (changelog?.type == null) {
            newChangelog.writeln();
            newChangelog.writeln(section.header);
          }
          newChangelog.writeln();
          newChangelog.writeln(section.content);
          newChangelog.writeln();
        }

        if (update.dependencyChanges.isNotEmpty) {
          newChangelog.writeln('### Dependency changes');
          newChangelog.writeln();
          for (final dependencyChange in update.dependencyChanges) {
            newChangelog.writeln(
              '- `${dependencyChange.package.name}` upgraded to `${dependencyChange.newVersion()}`',
            );
          }
          newChangelog.writeln();
        }

        final otherSections =
            changelog?.type == null ? sections : sections?.slice(1);
        for (final section
            in otherSections ?? <({String content, String header})>[]) {
          newChangelog.writeln(section.header);
          newChangelog.writeln();
          newChangelog.writeln(section.content);
          newChangelog.writeln();
        }

        update.changelogPatch = Patch(
          () => package.changelog.writeAsString(newChangelog.toString()),
        );
      }
    });

    return versionForPackage.values.map((e) => e.$1).nonNulls.toList();

    // final versionBumps = <String, PackageUpdate>{};

//     await workspace.visitPackagesInDependencyOrder((package) async {
//       final changelog = Changelog.tryParse(package) ?? Changelog([]);

//       var update = await PackageUpdate.tryParse(package, changelog);
//       if (update != null) {
//         versionBumps[package.name] = update;
//         // We continue to compute dependency changes in case, if any
//       }

//       // Check if any of the dependencies has a version bump
//       final dependencyChanges = workspace
//           .dependenciesInWorkspace(package)
//           .map((dependency) => versionBumps[dependency])
//           .nonNulls
//           .toList();

//       if (dependencyChanges.isEmpty) return;

//       if (update == null) {
//         // If a package has no updates but some dependency changes, we need to
//         // bump the version of this package to match. But only do so if the
//         // pubspec of the package has a version number.
//         if (package.version == null) return;
//         update = versionBumps[package.name] = PackageUpdate(
//           package,
//           PackageUpdateType.dependencyChange(package.version!),
//           changelog,
//         );

//         if (package.changelog.existsSync()) {
//           // Patch the changelog to add a new section for the new version
//           update.changelogPatch = Patch(
//             () async => package.changelog.writeAsString(
//               '''
// ${update!.newVersionChangelogHeader}

// ${dependencyChanges.map((e) => '- `${e.package.name}` upgraded to `${e.newVersion}`').join('\n')}

// ${await package.changelog.readAsString()}''',
//             ),
//           );
//         }
//       }

    // update.dependencyChanges.addAll(dependencyChanges);
    // });

    // return versionBumps;
  }
}
