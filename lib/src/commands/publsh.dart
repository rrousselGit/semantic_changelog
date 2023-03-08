import 'dart:async';

import 'package:args/command_runner.dart';
import 'package:melos/melos.dart';

import '../packages.dart';

/// The "bump" command.
class PublishCommand extends Command<void> {
  @override
  String get description => 'Git tag and publish packages to pub.dev.';

  @override
  String get name => 'publish';

  @override
  FutureOr<void>? run() async {
    // final packages = await _findPackagesToPublish();
    // for (final package in packages) {
    //   print(package.name);
    // }
  }

  // Future<List<Package>> _findPackagesToPublish() async {
  //   final packages = await findPackages();
  // }
}
