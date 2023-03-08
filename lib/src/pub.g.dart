// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'pub.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PubVersionResponse _$$_PubVersionResponseFromJson(
        Map<String, dynamic> json) =>
    _$_PubVersionResponse(
      latest: PubVersion.fromJson(json['latest'] as Map<String, dynamic>),
      versions: (json['versions'] as List<dynamic>)
          .map((e) => PubVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PubVersionResponseToJson(
        _$_PubVersionResponse instance) =>
    <String, dynamic>{
      'latest': instance.latest,
      'versions': instance.versions,
    };

_$_PubVersion _$$_PubVersionFromJson(Map<String, dynamic> json) =>
    _$_PubVersion(
      version: const VersionConverter().fromJson(json['version'] as String),
    );

Map<String, dynamic> _$$_PubVersionToJson(_$_PubVersion instance) =>
    <String, dynamic>{
      'version': const VersionConverter().toJson(instance.version),
    };
