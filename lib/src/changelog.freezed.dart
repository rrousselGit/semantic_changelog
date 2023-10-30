// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'changelog.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PackageUpdateType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? flag) breaking,
    required TResult Function(String? flag) major,
    required TResult Function(String? flag) minor,
    required TResult Function(String? flag) patch,
    required TResult Function() build,
    required TResult Function(Version version) version,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? flag)? breaking,
    TResult? Function(String? flag)? major,
    TResult? Function(String? flag)? minor,
    TResult? Function(String? flag)? patch,
    TResult? Function()? build,
    TResult? Function(Version version)? version,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? flag)? breaking,
    TResult Function(String? flag)? major,
    TResult Function(String? flag)? minor,
    TResult Function(String? flag)? patch,
    TResult Function()? build,
    TResult Function(Version version)? version,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Breaking value) breaking,
    required TResult Function(_Major value) major,
    required TResult Function(_Minor value) minor,
    required TResult Function(_Patch value) patch,
    required TResult Function(_Build value) build,
    required TResult Function(_Version value) version,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Breaking value)? breaking,
    TResult? Function(_Major value)? major,
    TResult? Function(_Minor value)? minor,
    TResult? Function(_Patch value)? patch,
    TResult? Function(_Build value)? build,
    TResult? Function(_Version value)? version,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Breaking value)? breaking,
    TResult Function(_Major value)? major,
    TResult Function(_Minor value)? minor,
    TResult Function(_Patch value)? patch,
    TResult Function(_Build value)? build,
    TResult Function(_Version value)? version,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageUpdateTypeCopyWith<$Res> {
  factory $PackageUpdateTypeCopyWith(
          PackageUpdateType value, $Res Function(PackageUpdateType) then) =
      _$PackageUpdateTypeCopyWithImpl<$Res, PackageUpdateType>;
}

/// @nodoc
class _$PackageUpdateTypeCopyWithImpl<$Res, $Val extends PackageUpdateType>
    implements $PackageUpdateTypeCopyWith<$Res> {
  _$PackageUpdateTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$BreakingImplCopyWith<$Res> {
  factory _$$BreakingImplCopyWith(
          _$BreakingImpl value, $Res Function(_$BreakingImpl) then) =
      __$$BreakingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? flag});
}

/// @nodoc
class __$$BreakingImplCopyWithImpl<$Res>
    extends _$PackageUpdateTypeCopyWithImpl<$Res, _$BreakingImpl>
    implements _$$BreakingImplCopyWith<$Res> {
  __$$BreakingImplCopyWithImpl(
      _$BreakingImpl _value, $Res Function(_$BreakingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flag = freezed,
  }) {
    return _then(_$BreakingImpl(
      flag: freezed == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BreakingImpl implements _Breaking {
  const _$BreakingImpl({this.flag});

  @override
  final String? flag;

  @override
  String toString() {
    return 'PackageUpdateType.breaking(flag: $flag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BreakingImpl &&
            (identical(other.flag, flag) || other.flag == flag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, flag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BreakingImplCopyWith<_$BreakingImpl> get copyWith =>
      __$$BreakingImplCopyWithImpl<_$BreakingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? flag) breaking,
    required TResult Function(String? flag) major,
    required TResult Function(String? flag) minor,
    required TResult Function(String? flag) patch,
    required TResult Function() build,
    required TResult Function(Version version) version,
  }) {
    return breaking(flag);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? flag)? breaking,
    TResult? Function(String? flag)? major,
    TResult? Function(String? flag)? minor,
    TResult? Function(String? flag)? patch,
    TResult? Function()? build,
    TResult? Function(Version version)? version,
  }) {
    return breaking?.call(flag);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? flag)? breaking,
    TResult Function(String? flag)? major,
    TResult Function(String? flag)? minor,
    TResult Function(String? flag)? patch,
    TResult Function()? build,
    TResult Function(Version version)? version,
    required TResult orElse(),
  }) {
    if (breaking != null) {
      return breaking(flag);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Breaking value) breaking,
    required TResult Function(_Major value) major,
    required TResult Function(_Minor value) minor,
    required TResult Function(_Patch value) patch,
    required TResult Function(_Build value) build,
    required TResult Function(_Version value) version,
  }) {
    return breaking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Breaking value)? breaking,
    TResult? Function(_Major value)? major,
    TResult? Function(_Minor value)? minor,
    TResult? Function(_Patch value)? patch,
    TResult? Function(_Build value)? build,
    TResult? Function(_Version value)? version,
  }) {
    return breaking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Breaking value)? breaking,
    TResult Function(_Major value)? major,
    TResult Function(_Minor value)? minor,
    TResult Function(_Patch value)? patch,
    TResult Function(_Build value)? build,
    TResult Function(_Version value)? version,
    required TResult orElse(),
  }) {
    if (breaking != null) {
      return breaking(this);
    }
    return orElse();
  }
}

abstract class _Breaking
    implements PackageUpdateType, _FlaggedPackageUpdateType {
  const factory _Breaking({final String? flag}) = _$BreakingImpl;

  String? get flag;
  @JsonKey(ignore: true)
  _$$BreakingImplCopyWith<_$BreakingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MajorImplCopyWith<$Res> {
  factory _$$MajorImplCopyWith(
          _$MajorImpl value, $Res Function(_$MajorImpl) then) =
      __$$MajorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? flag});
}

/// @nodoc
class __$$MajorImplCopyWithImpl<$Res>
    extends _$PackageUpdateTypeCopyWithImpl<$Res, _$MajorImpl>
    implements _$$MajorImplCopyWith<$Res> {
  __$$MajorImplCopyWithImpl(
      _$MajorImpl _value, $Res Function(_$MajorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flag = freezed,
  }) {
    return _then(_$MajorImpl(
      flag: freezed == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MajorImpl implements _Major {
  const _$MajorImpl({this.flag});

  @override
  final String? flag;

  @override
  String toString() {
    return 'PackageUpdateType.major(flag: $flag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MajorImpl &&
            (identical(other.flag, flag) || other.flag == flag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, flag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MajorImplCopyWith<_$MajorImpl> get copyWith =>
      __$$MajorImplCopyWithImpl<_$MajorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? flag) breaking,
    required TResult Function(String? flag) major,
    required TResult Function(String? flag) minor,
    required TResult Function(String? flag) patch,
    required TResult Function() build,
    required TResult Function(Version version) version,
  }) {
    return major(flag);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? flag)? breaking,
    TResult? Function(String? flag)? major,
    TResult? Function(String? flag)? minor,
    TResult? Function(String? flag)? patch,
    TResult? Function()? build,
    TResult? Function(Version version)? version,
  }) {
    return major?.call(flag);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? flag)? breaking,
    TResult Function(String? flag)? major,
    TResult Function(String? flag)? minor,
    TResult Function(String? flag)? patch,
    TResult Function()? build,
    TResult Function(Version version)? version,
    required TResult orElse(),
  }) {
    if (major != null) {
      return major(flag);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Breaking value) breaking,
    required TResult Function(_Major value) major,
    required TResult Function(_Minor value) minor,
    required TResult Function(_Patch value) patch,
    required TResult Function(_Build value) build,
    required TResult Function(_Version value) version,
  }) {
    return major(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Breaking value)? breaking,
    TResult? Function(_Major value)? major,
    TResult? Function(_Minor value)? minor,
    TResult? Function(_Patch value)? patch,
    TResult? Function(_Build value)? build,
    TResult? Function(_Version value)? version,
  }) {
    return major?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Breaking value)? breaking,
    TResult Function(_Major value)? major,
    TResult Function(_Minor value)? minor,
    TResult Function(_Patch value)? patch,
    TResult Function(_Build value)? build,
    TResult Function(_Version value)? version,
    required TResult orElse(),
  }) {
    if (major != null) {
      return major(this);
    }
    return orElse();
  }
}

abstract class _Major implements PackageUpdateType, _FlaggedPackageUpdateType {
  const factory _Major({final String? flag}) = _$MajorImpl;

  String? get flag;
  @JsonKey(ignore: true)
  _$$MajorImplCopyWith<_$MajorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MinorImplCopyWith<$Res> {
  factory _$$MinorImplCopyWith(
          _$MinorImpl value, $Res Function(_$MinorImpl) then) =
      __$$MinorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? flag});
}

/// @nodoc
class __$$MinorImplCopyWithImpl<$Res>
    extends _$PackageUpdateTypeCopyWithImpl<$Res, _$MinorImpl>
    implements _$$MinorImplCopyWith<$Res> {
  __$$MinorImplCopyWithImpl(
      _$MinorImpl _value, $Res Function(_$MinorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flag = freezed,
  }) {
    return _then(_$MinorImpl(
      flag: freezed == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MinorImpl implements _Minor {
  const _$MinorImpl({this.flag});

  @override
  final String? flag;

  @override
  String toString() {
    return 'PackageUpdateType.minor(flag: $flag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MinorImpl &&
            (identical(other.flag, flag) || other.flag == flag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, flag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MinorImplCopyWith<_$MinorImpl> get copyWith =>
      __$$MinorImplCopyWithImpl<_$MinorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? flag) breaking,
    required TResult Function(String? flag) major,
    required TResult Function(String? flag) minor,
    required TResult Function(String? flag) patch,
    required TResult Function() build,
    required TResult Function(Version version) version,
  }) {
    return minor(flag);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? flag)? breaking,
    TResult? Function(String? flag)? major,
    TResult? Function(String? flag)? minor,
    TResult? Function(String? flag)? patch,
    TResult? Function()? build,
    TResult? Function(Version version)? version,
  }) {
    return minor?.call(flag);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? flag)? breaking,
    TResult Function(String? flag)? major,
    TResult Function(String? flag)? minor,
    TResult Function(String? flag)? patch,
    TResult Function()? build,
    TResult Function(Version version)? version,
    required TResult orElse(),
  }) {
    if (minor != null) {
      return minor(flag);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Breaking value) breaking,
    required TResult Function(_Major value) major,
    required TResult Function(_Minor value) minor,
    required TResult Function(_Patch value) patch,
    required TResult Function(_Build value) build,
    required TResult Function(_Version value) version,
  }) {
    return minor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Breaking value)? breaking,
    TResult? Function(_Major value)? major,
    TResult? Function(_Minor value)? minor,
    TResult? Function(_Patch value)? patch,
    TResult? Function(_Build value)? build,
    TResult? Function(_Version value)? version,
  }) {
    return minor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Breaking value)? breaking,
    TResult Function(_Major value)? major,
    TResult Function(_Minor value)? minor,
    TResult Function(_Patch value)? patch,
    TResult Function(_Build value)? build,
    TResult Function(_Version value)? version,
    required TResult orElse(),
  }) {
    if (minor != null) {
      return minor(this);
    }
    return orElse();
  }
}

abstract class _Minor implements PackageUpdateType, _FlaggedPackageUpdateType {
  const factory _Minor({final String? flag}) = _$MinorImpl;

  String? get flag;
  @JsonKey(ignore: true)
  _$$MinorImplCopyWith<_$MinorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PatchImplCopyWith<$Res> {
  factory _$$PatchImplCopyWith(
          _$PatchImpl value, $Res Function(_$PatchImpl) then) =
      __$$PatchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? flag});
}

/// @nodoc
class __$$PatchImplCopyWithImpl<$Res>
    extends _$PackageUpdateTypeCopyWithImpl<$Res, _$PatchImpl>
    implements _$$PatchImplCopyWith<$Res> {
  __$$PatchImplCopyWithImpl(
      _$PatchImpl _value, $Res Function(_$PatchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flag = freezed,
  }) {
    return _then(_$PatchImpl(
      flag: freezed == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PatchImpl implements _Patch {
  const _$PatchImpl({this.flag});

  @override
  final String? flag;

  @override
  String toString() {
    return 'PackageUpdateType.patch(flag: $flag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatchImpl &&
            (identical(other.flag, flag) || other.flag == flag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, flag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PatchImplCopyWith<_$PatchImpl> get copyWith =>
      __$$PatchImplCopyWithImpl<_$PatchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? flag) breaking,
    required TResult Function(String? flag) major,
    required TResult Function(String? flag) minor,
    required TResult Function(String? flag) patch,
    required TResult Function() build,
    required TResult Function(Version version) version,
  }) {
    return patch(flag);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? flag)? breaking,
    TResult? Function(String? flag)? major,
    TResult? Function(String? flag)? minor,
    TResult? Function(String? flag)? patch,
    TResult? Function()? build,
    TResult? Function(Version version)? version,
  }) {
    return patch?.call(flag);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? flag)? breaking,
    TResult Function(String? flag)? major,
    TResult Function(String? flag)? minor,
    TResult Function(String? flag)? patch,
    TResult Function()? build,
    TResult Function(Version version)? version,
    required TResult orElse(),
  }) {
    if (patch != null) {
      return patch(flag);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Breaking value) breaking,
    required TResult Function(_Major value) major,
    required TResult Function(_Minor value) minor,
    required TResult Function(_Patch value) patch,
    required TResult Function(_Build value) build,
    required TResult Function(_Version value) version,
  }) {
    return patch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Breaking value)? breaking,
    TResult? Function(_Major value)? major,
    TResult? Function(_Minor value)? minor,
    TResult? Function(_Patch value)? patch,
    TResult? Function(_Build value)? build,
    TResult? Function(_Version value)? version,
  }) {
    return patch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Breaking value)? breaking,
    TResult Function(_Major value)? major,
    TResult Function(_Minor value)? minor,
    TResult Function(_Patch value)? patch,
    TResult Function(_Build value)? build,
    TResult Function(_Version value)? version,
    required TResult orElse(),
  }) {
    if (patch != null) {
      return patch(this);
    }
    return orElse();
  }
}

abstract class _Patch implements PackageUpdateType, _FlaggedPackageUpdateType {
  const factory _Patch({final String? flag}) = _$PatchImpl;

  String? get flag;
  @JsonKey(ignore: true)
  _$$PatchImplCopyWith<_$PatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BuildImplCopyWith<$Res> {
  factory _$$BuildImplCopyWith(
          _$BuildImpl value, $Res Function(_$BuildImpl) then) =
      __$$BuildImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BuildImplCopyWithImpl<$Res>
    extends _$PackageUpdateTypeCopyWithImpl<$Res, _$BuildImpl>
    implements _$$BuildImplCopyWith<$Res> {
  __$$BuildImplCopyWithImpl(
      _$BuildImpl _value, $Res Function(_$BuildImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BuildImpl implements _Build {
  const _$BuildImpl();

  @override
  String toString() {
    return 'PackageUpdateType.build()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BuildImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? flag) breaking,
    required TResult Function(String? flag) major,
    required TResult Function(String? flag) minor,
    required TResult Function(String? flag) patch,
    required TResult Function() build,
    required TResult Function(Version version) version,
  }) {
    return build();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? flag)? breaking,
    TResult? Function(String? flag)? major,
    TResult? Function(String? flag)? minor,
    TResult? Function(String? flag)? patch,
    TResult? Function()? build,
    TResult? Function(Version version)? version,
  }) {
    return build?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? flag)? breaking,
    TResult Function(String? flag)? major,
    TResult Function(String? flag)? minor,
    TResult Function(String? flag)? patch,
    TResult Function()? build,
    TResult Function(Version version)? version,
    required TResult orElse(),
  }) {
    if (build != null) {
      return build();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Breaking value) breaking,
    required TResult Function(_Major value) major,
    required TResult Function(_Minor value) minor,
    required TResult Function(_Patch value) patch,
    required TResult Function(_Build value) build,
    required TResult Function(_Version value) version,
  }) {
    return build(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Breaking value)? breaking,
    TResult? Function(_Major value)? major,
    TResult? Function(_Minor value)? minor,
    TResult? Function(_Patch value)? patch,
    TResult? Function(_Build value)? build,
    TResult? Function(_Version value)? version,
  }) {
    return build?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Breaking value)? breaking,
    TResult Function(_Major value)? major,
    TResult Function(_Minor value)? minor,
    TResult Function(_Patch value)? patch,
    TResult Function(_Build value)? build,
    TResult Function(_Version value)? version,
    required TResult orElse(),
  }) {
    if (build != null) {
      return build(this);
    }
    return orElse();
  }
}

abstract class _Build implements PackageUpdateType {
  const factory _Build() = _$BuildImpl;
}

/// @nodoc
abstract class _$$VersionImplCopyWith<$Res> {
  factory _$$VersionImplCopyWith(
          _$VersionImpl value, $Res Function(_$VersionImpl) then) =
      __$$VersionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Version version});
}

/// @nodoc
class __$$VersionImplCopyWithImpl<$Res>
    extends _$PackageUpdateTypeCopyWithImpl<$Res, _$VersionImpl>
    implements _$$VersionImplCopyWith<$Res> {
  __$$VersionImplCopyWithImpl(
      _$VersionImpl _value, $Res Function(_$VersionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
  }) {
    return _then(_$VersionImpl(
      null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as Version,
    ));
  }
}

/// @nodoc

class _$VersionImpl implements _Version {
  const _$VersionImpl(this.version);

  @override
  final Version version;

  @override
  String toString() {
    return 'PackageUpdateType.version(version: $version)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VersionImpl &&
            (identical(other.version, version) || other.version == version));
  }

  @override
  int get hashCode => Object.hash(runtimeType, version);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VersionImplCopyWith<_$VersionImpl> get copyWith =>
      __$$VersionImplCopyWithImpl<_$VersionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? flag) breaking,
    required TResult Function(String? flag) major,
    required TResult Function(String? flag) minor,
    required TResult Function(String? flag) patch,
    required TResult Function() build,
    required TResult Function(Version version) version,
  }) {
    return version(this.version);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? flag)? breaking,
    TResult? Function(String? flag)? major,
    TResult? Function(String? flag)? minor,
    TResult? Function(String? flag)? patch,
    TResult? Function()? build,
    TResult? Function(Version version)? version,
  }) {
    return version?.call(this.version);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? flag)? breaking,
    TResult Function(String? flag)? major,
    TResult Function(String? flag)? minor,
    TResult Function(String? flag)? patch,
    TResult Function()? build,
    TResult Function(Version version)? version,
    required TResult orElse(),
  }) {
    if (version != null) {
      return version(this.version);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Breaking value) breaking,
    required TResult Function(_Major value) major,
    required TResult Function(_Minor value) minor,
    required TResult Function(_Patch value) patch,
    required TResult Function(_Build value) build,
    required TResult Function(_Version value) version,
  }) {
    return version(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Breaking value)? breaking,
    TResult? Function(_Major value)? major,
    TResult? Function(_Minor value)? minor,
    TResult? Function(_Patch value)? patch,
    TResult? Function(_Build value)? build,
    TResult? Function(_Version value)? version,
  }) {
    return version?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Breaking value)? breaking,
    TResult Function(_Major value)? major,
    TResult Function(_Minor value)? minor,
    TResult Function(_Patch value)? patch,
    TResult Function(_Build value)? build,
    TResult Function(_Version value)? version,
    required TResult orElse(),
  }) {
    if (version != null) {
      return version(this);
    }
    return orElse();
  }
}

abstract class _Version implements PackageUpdateType {
  const factory _Version(final Version version) = _$VersionImpl;

  Version get version;
  @JsonKey(ignore: true)
  _$$VersionImplCopyWith<_$VersionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
