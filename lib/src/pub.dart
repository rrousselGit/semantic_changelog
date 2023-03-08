import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:pub_semver/pub_semver.dart';

part 'pub.freezed.dart';
part 'pub.g.dart';

Future<PubVersionResponse?> fetchPubVersions(String packageName) async {
  final response = await http.get(
    Uri.parse('https://pub.dev/api/packages/$packageName'),
  );

  if (response.statusCode != 200) return null;

  return PubVersionResponse.fromJson(
    jsonDecode(response.body) as Map<String, Object?>,
  );
}

@freezed
class PubVersionResponse with _$PubVersionResponse {
  factory PubVersionResponse({
    required PubVersion latest,
    required List<PubVersion> versions,
  }) = _PubVersionResponse;

  PubVersionResponse._();

  factory PubVersionResponse.fromJson(Map<String, Object?> json) =>
      _$PubVersionResponseFromJson(json);

  bool hasVersion(Version version) =>
      latest.version == version ||
      versions.any((element) => element.version == version);
}

@freezed
class PubVersion with _$PubVersion {
  factory PubVersion({
    @VersionConverter() required Version version,
  }) = _PubVersion;

  factory PubVersion.fromJson(Map<String, Object?> json) =>
      _$PubVersionFromJson(json);
}

class VersionConverter extends JsonConverter<Version, String> {
  const VersionConverter();

  @override
  Version fromJson(String json) => Version.parse(json);

  @override
  String toJson(Version object) => object.toString();
}
