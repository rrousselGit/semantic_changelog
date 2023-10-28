import 'process.dart';

Future<List<String>> computeChangedPaths(
  String sha1,
) async {
  final result = await safeRun(
    'git',
    ['diff', '--name-only', sha1],
  );

  return result.stdout
      .toString()
      .split('\n')
      .where((element) => element.isNotEmpty)
      .map((e) => e.trim())
      .toList();
}
