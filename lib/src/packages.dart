import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:cli_util/cli_logging.dart';
import 'package:melos/melos.dart';

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
  final configs = await MelosWorkspaceConfig.fromDirectory(Directory.current);
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
