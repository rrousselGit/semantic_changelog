// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pub.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PubVersionResponse _$PubVersionResponseFromJson(Map<String, dynamic> json) {
  return _PubVersionResponse.fromJson(json);
}

/// @nodoc
mixin _$PubVersionResponse {
  PubVersion get latest => throw _privateConstructorUsedError;
  List<PubVersion> get versions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PubVersionResponseCopyWith<PubVersionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PubVersionResponseCopyWith<$Res> {
  factory $PubVersionResponseCopyWith(
          PubVersionResponse value, $Res Function(PubVersionResponse) then) =
      _$PubVersionResponseCopyWithImpl<$Res, PubVersionResponse>;
  @useResult
  $Res call({PubVersion latest, List<PubVersion> versions});

  $PubVersionCopyWith<$Res> get latest;
}

/// @nodoc
class _$PubVersionResponseCopyWithImpl<$Res, $Val extends PubVersionResponse>
    implements $PubVersionResponseCopyWith<$Res> {
  _$PubVersionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latest = null,
    Object? versions = null,
  }) {
    return _then(_value.copyWith(
      latest: null == latest
          ? _value.latest
          : latest // ignore: cast_nullable_to_non_nullable
              as PubVersion,
      versions: null == versions
          ? _value.versions
          : versions // ignore: cast_nullable_to_non_nullable
              as List<PubVersion>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PubVersionCopyWith<$Res> get latest {
    return $PubVersionCopyWith<$Res>(_value.latest, (value) {
      return _then(_value.copyWith(latest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PubVersionResponseCopyWith<$Res>
    implements $PubVersionResponseCopyWith<$Res> {
  factory _$$_PubVersionResponseCopyWith(_$_PubVersionResponse value,
          $Res Function(_$_PubVersionResponse) then) =
      __$$_PubVersionResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PubVersion latest, List<PubVersion> versions});

  @override
  $PubVersionCopyWith<$Res> get latest;
}

/// @nodoc
class __$$_PubVersionResponseCopyWithImpl<$Res>
    extends _$PubVersionResponseCopyWithImpl<$Res, _$_PubVersionResponse>
    implements _$$_PubVersionResponseCopyWith<$Res> {
  __$$_PubVersionResponseCopyWithImpl(
      _$_PubVersionResponse _value, $Res Function(_$_PubVersionResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latest = null,
    Object? versions = null,
  }) {
    return _then(_$_PubVersionResponse(
      latest: null == latest
          ? _value.latest
          : latest // ignore: cast_nullable_to_non_nullable
              as PubVersion,
      versions: null == versions
          ? _value._versions
          : versions // ignore: cast_nullable_to_non_nullable
              as List<PubVersion>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PubVersionResponse extends _PubVersionResponse {
  _$_PubVersionResponse(
      {required this.latest, required final List<PubVersion> versions})
      : _versions = versions,
        super._();

  factory _$_PubVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PubVersionResponseFromJson(json);

  @override
  final PubVersion latest;
  final List<PubVersion> _versions;
  @override
  List<PubVersion> get versions {
    if (_versions is EqualUnmodifiableListView) return _versions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_versions);
  }

  @override
  String toString() {
    return 'PubVersionResponse(latest: $latest, versions: $versions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PubVersionResponse &&
            (identical(other.latest, latest) || other.latest == latest) &&
            const DeepCollectionEquality().equals(other._versions, _versions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, latest, const DeepCollectionEquality().hash(_versions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PubVersionResponseCopyWith<_$_PubVersionResponse> get copyWith =>
      __$$_PubVersionResponseCopyWithImpl<_$_PubVersionResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PubVersionResponseToJson(
      this,
    );
  }
}

abstract class _PubVersionResponse extends PubVersionResponse {
  factory _PubVersionResponse(
      {required final PubVersion latest,
      required final List<PubVersion> versions}) = _$_PubVersionResponse;
  _PubVersionResponse._() : super._();

  factory _PubVersionResponse.fromJson(Map<String, dynamic> json) =
      _$_PubVersionResponse.fromJson;

  @override
  PubVersion get latest;
  @override
  List<PubVersion> get versions;
  @override
  @JsonKey(ignore: true)
  _$$_PubVersionResponseCopyWith<_$_PubVersionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

PubVersion _$PubVersionFromJson(Map<String, dynamic> json) {
  return _PubVersion.fromJson(json);
}

/// @nodoc
mixin _$PubVersion {
  @VersionConverter()
  Version get version => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PubVersionCopyWith<PubVersion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PubVersionCopyWith<$Res> {
  factory $PubVersionCopyWith(
          PubVersion value, $Res Function(PubVersion) then) =
      _$PubVersionCopyWithImpl<$Res, PubVersion>;
  @useResult
  $Res call({@VersionConverter() Version version});
}

/// @nodoc
class _$PubVersionCopyWithImpl<$Res, $Val extends PubVersion>
    implements $PubVersionCopyWith<$Res> {
  _$PubVersionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
  }) {
    return _then(_value.copyWith(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as Version,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PubVersionCopyWith<$Res>
    implements $PubVersionCopyWith<$Res> {
  factory _$$_PubVersionCopyWith(
          _$_PubVersion value, $Res Function(_$_PubVersion) then) =
      __$$_PubVersionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@VersionConverter() Version version});
}

/// @nodoc
class __$$_PubVersionCopyWithImpl<$Res>
    extends _$PubVersionCopyWithImpl<$Res, _$_PubVersion>
    implements _$$_PubVersionCopyWith<$Res> {
  __$$_PubVersionCopyWithImpl(
      _$_PubVersion _value, $Res Function(_$_PubVersion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
  }) {
    return _then(_$_PubVersion(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as Version,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PubVersion implements _PubVersion {
  _$_PubVersion({@VersionConverter() required this.version});

  factory _$_PubVersion.fromJson(Map<String, dynamic> json) =>
      _$$_PubVersionFromJson(json);

  @override
  @VersionConverter()
  final Version version;

  @override
  String toString() {
    return 'PubVersion(version: $version)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PubVersion &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, version);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PubVersionCopyWith<_$_PubVersion> get copyWith =>
      __$$_PubVersionCopyWithImpl<_$_PubVersion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PubVersionToJson(
      this,
    );
  }
}

abstract class _PubVersion implements PubVersion {
  factory _PubVersion({@VersionConverter() required final Version version}) =
      _$_PubVersion;

  factory _PubVersion.fromJson(Map<String, dynamic> json) =
      _$_PubVersion.fromJson;

  @override
  @VersionConverter()
  Version get version;
  @override
  @JsonKey(ignore: true)
  _$$_PubVersionCopyWith<_$_PubVersion> get copyWith =>
      throw _privateConstructorUsedError;
}
