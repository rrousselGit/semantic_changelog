// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'pub.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PubVersionResponseImpl _$$PubVersionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PubVersionResponseImpl(
      latest: PubVersion.fromJson(json['latest'] as Map<String, dynamic>),
      versions: (json['versions'] as List<dynamic>)
          .map((e) => PubVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PubVersionResponseImplToJson(
        _$PubVersionResponseImpl instance) =>
    <String, dynamic>{
      'latest': instance.latest,
      'versions': instance.versions,
    };

_$PubVersionImpl _$$PubVersionImplFromJson(Map<String, dynamic> json) =>
    _$PubVersionImpl(
      version: const VersionConverter().fromJson(json['version'] as String),
    );

Map<String, dynamic> _$$PubVersionImplToJson(_$PubVersionImpl instance) =>
    <String, dynamic>{
      'version': const VersionConverter().toJson(instance.version),
    };
