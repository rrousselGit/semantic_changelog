import 'dart:io';

import 'package:path/path.dart';

File? findAncestorFile(String changedPath, String fileName, {String? root}) {
  final rootDir = root ?? Directory.current.path;

  if (!isWithin(rootDir, changedPath)) {
    throw ArgumentError(
      'The changed path must be within the root directory: $changedPath is not in $rootDir',
    );
  }

  var currentDir = dirname(changedPath);
  while (currentDir != rootDir) {
    final dir = dirname(currentDir);
    final candidate = File(join(dir, fileName));
    if (candidate.existsSync()) return candidate;

    currentDir = dir;
  }

  return null;
}

extension EntityX on FileSystemEntity {
  String get absoluteNormalizedPath => normalize(this.absolute.path);
}
