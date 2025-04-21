// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'pub.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PubVersionResponse _$PubVersionResponseFromJson(Map<String, dynamic> json) =>
    _PubVersionResponse(
      latest: PubVersion.fromJson(json['latest'] as Map<String, dynamic>),
      versions: (json['versions'] as List<dynamic>)
          .map((e) => PubVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PubVersionResponseToJson(_PubVersionResponse instance) =>
    <String, dynamic>{
      'latest': instance.latest,
      'versions': instance.versions,
    };

_PubVersion _$PubVersionFromJson(Map<String, dynamic> json) => _PubVersion(
      version: const VersionConverter().fromJson(json['version'] as String),
    );

Map<String, dynamic> _$PubVersionToJson(_PubVersion instance) =>
    <String, dynamic>{
      'version': const VersionConverter().toJson(instance.version),
    };
