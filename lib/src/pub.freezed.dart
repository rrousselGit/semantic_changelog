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
abstract class _$$PubVersionResponseImplCopyWith<$Res>
    implements $PubVersionResponseCopyWith<$Res> {
  factory _$$PubVersionResponseImplCopyWith(_$PubVersionResponseImpl value,
          $Res Function(_$PubVersionResponseImpl) then) =
      __$$PubVersionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PubVersion latest, List<PubVersion> versions});

  @override
  $PubVersionCopyWith<$Res> get latest;
}

/// @nodoc
class __$$PubVersionResponseImplCopyWithImpl<$Res>
    extends _$PubVersionResponseCopyWithImpl<$Res, _$PubVersionResponseImpl>
    implements _$$PubVersionResponseImplCopyWith<$Res> {
  __$$PubVersionResponseImplCopyWithImpl(_$PubVersionResponseImpl _value,
      $Res Function(_$PubVersionResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latest = null,
    Object? versions = null,
  }) {
    return _then(_$PubVersionResponseImpl(
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
class _$PubVersionResponseImpl extends _PubVersionResponse {
  _$PubVersionResponseImpl(
      {required this.latest, required final List<PubVersion> versions})
      : _versions = versions,
        super._();

  factory _$PubVersionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PubVersionResponseImplFromJson(json);

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
            other is _$PubVersionResponseImpl &&
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
  _$$PubVersionResponseImplCopyWith<_$PubVersionResponseImpl> get copyWith =>
      __$$PubVersionResponseImplCopyWithImpl<_$PubVersionResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PubVersionResponseImplToJson(
      this,
    );
  }
}

abstract class _PubVersionResponse extends PubVersionResponse {
  factory _PubVersionResponse(
      {required final PubVersion latest,
      required final List<PubVersion> versions}) = _$PubVersionResponseImpl;
  _PubVersionResponse._() : super._();

  factory _PubVersionResponse.fromJson(Map<String, dynamic> json) =
      _$PubVersionResponseImpl.fromJson;

  @override
  PubVersion get latest;
  @override
  List<PubVersion> get versions;
  @override
  @JsonKey(ignore: true)
  _$$PubVersionResponseImplCopyWith<_$PubVersionResponseImpl> get copyWith =>
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
abstract class _$$PubVersionImplCopyWith<$Res>
    implements $PubVersionCopyWith<$Res> {
  factory _$$PubVersionImplCopyWith(
          _$PubVersionImpl value, $Res Function(_$PubVersionImpl) then) =
      __$$PubVersionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@VersionConverter() Version version});
}

/// @nodoc
class __$$PubVersionImplCopyWithImpl<$Res>
    extends _$PubVersionCopyWithImpl<$Res, _$PubVersionImpl>
    implements _$$PubVersionImplCopyWith<$Res> {
  __$$PubVersionImplCopyWithImpl(
      _$PubVersionImpl _value, $Res Function(_$PubVersionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
  }) {
    return _then(_$PubVersionImpl(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as Version,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PubVersionImpl implements _PubVersion {
  _$PubVersionImpl({@VersionConverter() required this.version});

  factory _$PubVersionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PubVersionImplFromJson(json);

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
            other is _$PubVersionImpl &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, version);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PubVersionImplCopyWith<_$PubVersionImpl> get copyWith =>
      __$$PubVersionImplCopyWithImpl<_$PubVersionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PubVersionImplToJson(
      this,
    );
  }
}

abstract class _PubVersion implements PubVersion {
  factory _PubVersion({@VersionConverter() required final Version version}) =
      _$PubVersionImpl;

  factory _PubVersion.fromJson(Map<String, dynamic> json) =
      _$PubVersionImpl.fromJson;

  @override
  @VersionConverter()
  Version get version;
  @override
  @JsonKey(ignore: true)
  _$$PubVersionImplCopyWith<_$PubVersionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
