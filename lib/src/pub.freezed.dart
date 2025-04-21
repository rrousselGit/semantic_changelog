// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pub.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PubVersionResponse {
  PubVersion get latest;
  List<PubVersion> get versions;

  /// Create a copy of PubVersionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PubVersionResponseCopyWith<PubVersionResponse> get copyWith =>
      _$PubVersionResponseCopyWithImpl<PubVersionResponse>(
          this as PubVersionResponse, _$identity);

  /// Serializes this PubVersionResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PubVersionResponse &&
            (identical(other.latest, latest) || other.latest == latest) &&
            const DeepCollectionEquality().equals(other.versions, versions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, latest, const DeepCollectionEquality().hash(versions));

  @override
  String toString() {
    return 'PubVersionResponse(latest: $latest, versions: $versions)';
  }
}

/// @nodoc
abstract mixin class $PubVersionResponseCopyWith<$Res> {
  factory $PubVersionResponseCopyWith(
          PubVersionResponse value, $Res Function(PubVersionResponse) _then) =
      _$PubVersionResponseCopyWithImpl;
  @useResult
  $Res call({PubVersion latest, List<PubVersion> versions});

  $PubVersionCopyWith<$Res> get latest;
}

/// @nodoc
class _$PubVersionResponseCopyWithImpl<$Res>
    implements $PubVersionResponseCopyWith<$Res> {
  _$PubVersionResponseCopyWithImpl(this._self, this._then);

  final PubVersionResponse _self;
  final $Res Function(PubVersionResponse) _then;

  /// Create a copy of PubVersionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latest = null,
    Object? versions = null,
  }) {
    return _then(_self.copyWith(
      latest: null == latest
          ? _self.latest
          : latest // ignore: cast_nullable_to_non_nullable
              as PubVersion,
      versions: null == versions
          ? _self.versions
          : versions // ignore: cast_nullable_to_non_nullable
              as List<PubVersion>,
    ));
  }

  /// Create a copy of PubVersionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PubVersionCopyWith<$Res> get latest {
    return $PubVersionCopyWith<$Res>(_self.latest, (value) {
      return _then(_self.copyWith(latest: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _PubVersionResponse extends PubVersionResponse {
  _PubVersionResponse(
      {required this.latest, required final List<PubVersion> versions})
      : _versions = versions,
        super._();
  factory _PubVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$PubVersionResponseFromJson(json);

  @override
  final PubVersion latest;
  final List<PubVersion> _versions;
  @override
  List<PubVersion> get versions {
    if (_versions is EqualUnmodifiableListView) return _versions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_versions);
  }

  /// Create a copy of PubVersionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PubVersionResponseCopyWith<_PubVersionResponse> get copyWith =>
      __$PubVersionResponseCopyWithImpl<_PubVersionResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PubVersionResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PubVersionResponse &&
            (identical(other.latest, latest) || other.latest == latest) &&
            const DeepCollectionEquality().equals(other._versions, _versions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, latest, const DeepCollectionEquality().hash(_versions));

  @override
  String toString() {
    return 'PubVersionResponse(latest: $latest, versions: $versions)';
  }
}

/// @nodoc
abstract mixin class _$PubVersionResponseCopyWith<$Res>
    implements $PubVersionResponseCopyWith<$Res> {
  factory _$PubVersionResponseCopyWith(
          _PubVersionResponse value, $Res Function(_PubVersionResponse) _then) =
      __$PubVersionResponseCopyWithImpl;
  @override
  @useResult
  $Res call({PubVersion latest, List<PubVersion> versions});

  @override
  $PubVersionCopyWith<$Res> get latest;
}

/// @nodoc
class __$PubVersionResponseCopyWithImpl<$Res>
    implements _$PubVersionResponseCopyWith<$Res> {
  __$PubVersionResponseCopyWithImpl(this._self, this._then);

  final _PubVersionResponse _self;
  final $Res Function(_PubVersionResponse) _then;

  /// Create a copy of PubVersionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? latest = null,
    Object? versions = null,
  }) {
    return _then(_PubVersionResponse(
      latest: null == latest
          ? _self.latest
          : latest // ignore: cast_nullable_to_non_nullable
              as PubVersion,
      versions: null == versions
          ? _self._versions
          : versions // ignore: cast_nullable_to_non_nullable
              as List<PubVersion>,
    ));
  }

  /// Create a copy of PubVersionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PubVersionCopyWith<$Res> get latest {
    return $PubVersionCopyWith<$Res>(_self.latest, (value) {
      return _then(_self.copyWith(latest: value));
    });
  }
}

/// @nodoc
mixin _$PubVersion {
  @VersionConverter()
  Version get version;

  /// Create a copy of PubVersion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PubVersionCopyWith<PubVersion> get copyWith =>
      _$PubVersionCopyWithImpl<PubVersion>(this as PubVersion, _$identity);

  /// Serializes this PubVersion to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PubVersion &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, version);

  @override
  String toString() {
    return 'PubVersion(version: $version)';
  }
}

/// @nodoc
abstract mixin class $PubVersionCopyWith<$Res> {
  factory $PubVersionCopyWith(
          PubVersion value, $Res Function(PubVersion) _then) =
      _$PubVersionCopyWithImpl;
  @useResult
  $Res call({@VersionConverter() Version version});
}

/// @nodoc
class _$PubVersionCopyWithImpl<$Res> implements $PubVersionCopyWith<$Res> {
  _$PubVersionCopyWithImpl(this._self, this._then);

  final PubVersion _self;
  final $Res Function(PubVersion) _then;

  /// Create a copy of PubVersion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
  }) {
    return _then(_self.copyWith(
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as Version,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PubVersion implements PubVersion {
  _PubVersion({@VersionConverter() required this.version});
  factory _PubVersion.fromJson(Map<String, dynamic> json) =>
      _$PubVersionFromJson(json);

  @override
  @VersionConverter()
  final Version version;

  /// Create a copy of PubVersion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PubVersionCopyWith<_PubVersion> get copyWith =>
      __$PubVersionCopyWithImpl<_PubVersion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PubVersionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PubVersion &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, version);

  @override
  String toString() {
    return 'PubVersion(version: $version)';
  }
}

/// @nodoc
abstract mixin class _$PubVersionCopyWith<$Res>
    implements $PubVersionCopyWith<$Res> {
  factory _$PubVersionCopyWith(
          _PubVersion value, $Res Function(_PubVersion) _then) =
      __$PubVersionCopyWithImpl;
  @override
  @useResult
  $Res call({@VersionConverter() Version version});
}

/// @nodoc
class __$PubVersionCopyWithImpl<$Res> implements _$PubVersionCopyWith<$Res> {
  __$PubVersionCopyWithImpl(this._self, this._then);

  final _PubVersion _self;
  final $Res Function(_PubVersion) _then;

  /// Create a copy of PubVersion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? version = null,
  }) {
    return _then(_PubVersion(
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as Version,
    ));
  }
}

// dart format on
