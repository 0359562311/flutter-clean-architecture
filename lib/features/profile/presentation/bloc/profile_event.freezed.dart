// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProfileEventTearOff {
  const _$ProfileEventTearOff();

  GetProfileEvent getProfile() {
    return GetProfileEvent();
  }

  UpdateProfileEvent updateProfile(Profile profile) {
    return UpdateProfileEvent(
      profile,
    );
  }
}

/// @nodoc
const $ProfileEvent = _$ProfileEventTearOff();

/// @nodoc
mixin _$ProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getProfile,
    required TResult Function(Profile profile) updateProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getProfile,
    TResult Function(Profile profile)? updateProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProfileEvent value) getProfile,
    required TResult Function(UpdateProfileEvent value) updateProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProfileEvent value)? getProfile,
    TResult Function(UpdateProfileEvent value)? updateProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEventCopyWith<$Res> {
  factory $ProfileEventCopyWith(
          ProfileEvent value, $Res Function(ProfileEvent) then) =
      _$ProfileEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProfileEventCopyWithImpl<$Res> implements $ProfileEventCopyWith<$Res> {
  _$ProfileEventCopyWithImpl(this._value, this._then);

  final ProfileEvent _value;
  // ignore: unused_field
  final $Res Function(ProfileEvent) _then;
}

/// @nodoc
abstract class $GetProfileEventCopyWith<$Res> {
  factory $GetProfileEventCopyWith(
          GetProfileEvent value, $Res Function(GetProfileEvent) then) =
      _$GetProfileEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetProfileEventCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res>
    implements $GetProfileEventCopyWith<$Res> {
  _$GetProfileEventCopyWithImpl(
      GetProfileEvent _value, $Res Function(GetProfileEvent) _then)
      : super(_value, (v) => _then(v as GetProfileEvent));

  @override
  GetProfileEvent get _value => super._value as GetProfileEvent;
}

/// @nodoc
class _$GetProfileEvent implements GetProfileEvent {
  _$GetProfileEvent();

  @override
  String toString() {
    return 'ProfileEvent.getProfile()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GetProfileEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getProfile,
    required TResult Function(Profile profile) updateProfile,
  }) {
    return getProfile();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getProfile,
    TResult Function(Profile profile)? updateProfile,
    required TResult orElse(),
  }) {
    if (getProfile != null) {
      return getProfile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProfileEvent value) getProfile,
    required TResult Function(UpdateProfileEvent value) updateProfile,
  }) {
    return getProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProfileEvent value)? getProfile,
    TResult Function(UpdateProfileEvent value)? updateProfile,
    required TResult orElse(),
  }) {
    if (getProfile != null) {
      return getProfile(this);
    }
    return orElse();
  }
}

abstract class GetProfileEvent implements ProfileEvent {
  factory GetProfileEvent() = _$GetProfileEvent;
}

/// @nodoc
abstract class $UpdateProfileEventCopyWith<$Res> {
  factory $UpdateProfileEventCopyWith(
          UpdateProfileEvent value, $Res Function(UpdateProfileEvent) then) =
      _$UpdateProfileEventCopyWithImpl<$Res>;
  $Res call({Profile profile});
}

/// @nodoc
class _$UpdateProfileEventCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res>
    implements $UpdateProfileEventCopyWith<$Res> {
  _$UpdateProfileEventCopyWithImpl(
      UpdateProfileEvent _value, $Res Function(UpdateProfileEvent) _then)
      : super(_value, (v) => _then(v as UpdateProfileEvent));

  @override
  UpdateProfileEvent get _value => super._value as UpdateProfileEvent;

  @override
  $Res call({
    Object? profile = freezed,
  }) {
    return _then(UpdateProfileEvent(
      profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
    ));
  }
}

/// @nodoc
class _$UpdateProfileEvent implements UpdateProfileEvent {
  _$UpdateProfileEvent(this.profile);

  @override
  final Profile profile;

  @override
  String toString() {
    return 'ProfileEvent.updateProfile(profile: $profile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateProfileEvent &&
            (identical(other.profile, profile) ||
                const DeepCollectionEquality().equals(other.profile, profile)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(profile);

  @JsonKey(ignore: true)
  @override
  $UpdateProfileEventCopyWith<UpdateProfileEvent> get copyWith =>
      _$UpdateProfileEventCopyWithImpl<UpdateProfileEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getProfile,
    required TResult Function(Profile profile) updateProfile,
  }) {
    return updateProfile(profile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getProfile,
    TResult Function(Profile profile)? updateProfile,
    required TResult orElse(),
  }) {
    if (updateProfile != null) {
      return updateProfile(profile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProfileEvent value) getProfile,
    required TResult Function(UpdateProfileEvent value) updateProfile,
  }) {
    return updateProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProfileEvent value)? getProfile,
    TResult Function(UpdateProfileEvent value)? updateProfile,
    required TResult orElse(),
  }) {
    if (updateProfile != null) {
      return updateProfile(this);
    }
    return orElse();
  }
}

abstract class UpdateProfileEvent implements ProfileEvent {
  factory UpdateProfileEvent(Profile profile) = _$UpdateProfileEvent;

  Profile get profile => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateProfileEventCopyWith<UpdateProfileEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
