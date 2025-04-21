// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'changelog.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PackageUpdateType {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PackageUpdateType);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PackageUpdateType()';
  }
}

/// @nodoc
class $PackageUpdateTypeCopyWith<$Res> {
  $PackageUpdateTypeCopyWith(
      PackageUpdateType _, $Res Function(PackageUpdateType) __);
}

/// @nodoc

class _Breaking implements PackageUpdateType, _FlaggedPackageUpdateType {
  const _Breaking({this.flag});

  final String? flag;

  /// Create a copy of PackageUpdateType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BreakingCopyWith<_Breaking> get copyWith =>
      __$BreakingCopyWithImpl<_Breaking>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Breaking &&
            (identical(other.flag, flag) || other.flag == flag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, flag);

  @override
  String toString() {
    return 'PackageUpdateType.breaking(flag: $flag)';
  }
}

/// @nodoc
abstract mixin class _$BreakingCopyWith<$Res>
    implements $PackageUpdateTypeCopyWith<$Res> {
  factory _$BreakingCopyWith(_Breaking value, $Res Function(_Breaking) _then) =
      __$BreakingCopyWithImpl;
  @useResult
  $Res call({String? flag});
}

/// @nodoc
class __$BreakingCopyWithImpl<$Res> implements _$BreakingCopyWith<$Res> {
  __$BreakingCopyWithImpl(this._self, this._then);

  final _Breaking _self;
  final $Res Function(_Breaking) _then;

  /// Create a copy of PackageUpdateType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? flag = freezed,
  }) {
    return _then(_Breaking(
      flag: freezed == flag
          ? _self.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _Major implements PackageUpdateType, _FlaggedPackageUpdateType {
  const _Major({this.flag});

  final String? flag;

  /// Create a copy of PackageUpdateType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MajorCopyWith<_Major> get copyWith =>
      __$MajorCopyWithImpl<_Major>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Major &&
            (identical(other.flag, flag) || other.flag == flag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, flag);

  @override
  String toString() {
    return 'PackageUpdateType.major(flag: $flag)';
  }
}

/// @nodoc
abstract mixin class _$MajorCopyWith<$Res>
    implements $PackageUpdateTypeCopyWith<$Res> {
  factory _$MajorCopyWith(_Major value, $Res Function(_Major) _then) =
      __$MajorCopyWithImpl;
  @useResult
  $Res call({String? flag});
}

/// @nodoc
class __$MajorCopyWithImpl<$Res> implements _$MajorCopyWith<$Res> {
  __$MajorCopyWithImpl(this._self, this._then);

  final _Major _self;
  final $Res Function(_Major) _then;

  /// Create a copy of PackageUpdateType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? flag = freezed,
  }) {
    return _then(_Major(
      flag: freezed == flag
          ? _self.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _Minor implements PackageUpdateType, _FlaggedPackageUpdateType {
  const _Minor({this.flag});

  final String? flag;

  /// Create a copy of PackageUpdateType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MinorCopyWith<_Minor> get copyWith =>
      __$MinorCopyWithImpl<_Minor>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Minor &&
            (identical(other.flag, flag) || other.flag == flag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, flag);

  @override
  String toString() {
    return 'PackageUpdateType.minor(flag: $flag)';
  }
}

/// @nodoc
abstract mixin class _$MinorCopyWith<$Res>
    implements $PackageUpdateTypeCopyWith<$Res> {
  factory _$MinorCopyWith(_Minor value, $Res Function(_Minor) _then) =
      __$MinorCopyWithImpl;
  @useResult
  $Res call({String? flag});
}

/// @nodoc
class __$MinorCopyWithImpl<$Res> implements _$MinorCopyWith<$Res> {
  __$MinorCopyWithImpl(this._self, this._then);

  final _Minor _self;
  final $Res Function(_Minor) _then;

  /// Create a copy of PackageUpdateType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? flag = freezed,
  }) {
    return _then(_Minor(
      flag: freezed == flag
          ? _self.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _Patch implements PackageUpdateType, _FlaggedPackageUpdateType {
  const _Patch({this.flag});

  final String? flag;

  /// Create a copy of PackageUpdateType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PatchCopyWith<_Patch> get copyWith =>
      __$PatchCopyWithImpl<_Patch>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Patch &&
            (identical(other.flag, flag) || other.flag == flag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, flag);

  @override
  String toString() {
    return 'PackageUpdateType.patch(flag: $flag)';
  }
}

/// @nodoc
abstract mixin class _$PatchCopyWith<$Res>
    implements $PackageUpdateTypeCopyWith<$Res> {
  factory _$PatchCopyWith(_Patch value, $Res Function(_Patch) _then) =
      __$PatchCopyWithImpl;
  @useResult
  $Res call({String? flag});
}

/// @nodoc
class __$PatchCopyWithImpl<$Res> implements _$PatchCopyWith<$Res> {
  __$PatchCopyWithImpl(this._self, this._then);

  final _Patch _self;
  final $Res Function(_Patch) _then;

  /// Create a copy of PackageUpdateType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? flag = freezed,
  }) {
    return _then(_Patch(
      flag: freezed == flag
          ? _self.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _Build implements PackageUpdateType {
  const _Build();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Build);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PackageUpdateType.build()';
  }
}

/// @nodoc

class _Version implements PackageUpdateType {
  const _Version(this.version);

  final Version version;

  /// Create a copy of PackageUpdateType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VersionCopyWith<_Version> get copyWith =>
      __$VersionCopyWithImpl<_Version>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Version &&
            (identical(other.version, version) || other.version == version));
  }

  @override
  int get hashCode => Object.hash(runtimeType, version);

  @override
  String toString() {
    return 'PackageUpdateType.version(version: $version)';
  }
}

/// @nodoc
abstract mixin class _$VersionCopyWith<$Res>
    implements $PackageUpdateTypeCopyWith<$Res> {
  factory _$VersionCopyWith(_Version value, $Res Function(_Version) _then) =
      __$VersionCopyWithImpl;
  @useResult
  $Res call({Version version});
}

/// @nodoc
class __$VersionCopyWithImpl<$Res> implements _$VersionCopyWith<$Res> {
  __$VersionCopyWithImpl(this._self, this._then);

  final _Version _self;
  final $Res Function(_Version) _then;

  /// Create a copy of PackageUpdateType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? version = null,
  }) {
    return _then(_Version(
      null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as Version,
    ));
  }
}

// dart format on
