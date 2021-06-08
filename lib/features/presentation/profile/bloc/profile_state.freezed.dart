// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProfileStateTearOff {
  const _$ProfileStateTearOff();

  ProfileLoadingState loading() {
    return ProfileLoadingState();
  }

  ProfileCompleteState complete(CustomUser user) {
    return ProfileCompleteState(
      user,
    );
  }

  ProfileErrorState error(String message) {
    return ProfileErrorState(
      message,
    );
  }
}

/// @nodoc
const $ProfileState = _$ProfileStateTearOff();

/// @nodoc
mixin _$ProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(CustomUser user) complete,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(CustomUser user)? complete,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileLoadingState value) loading,
    required TResult Function(ProfileCompleteState value) complete,
    required TResult Function(ProfileErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileLoadingState value)? loading,
    TResult Function(ProfileCompleteState value)? complete,
    TResult Function(ProfileErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res> implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  final ProfileState _value;
  // ignore: unused_field
  final $Res Function(ProfileState) _then;
}

/// @nodoc
abstract class $ProfileLoadingStateCopyWith<$Res> {
  factory $ProfileLoadingStateCopyWith(
          ProfileLoadingState value, $Res Function(ProfileLoadingState) then) =
      _$ProfileLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProfileLoadingStateCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res>
    implements $ProfileLoadingStateCopyWith<$Res> {
  _$ProfileLoadingStateCopyWithImpl(
      ProfileLoadingState _value, $Res Function(ProfileLoadingState) _then)
      : super(_value, (v) => _then(v as ProfileLoadingState));

  @override
  ProfileLoadingState get _value => super._value as ProfileLoadingState;
}

/// @nodoc
class _$ProfileLoadingState implements ProfileLoadingState {
  _$ProfileLoadingState();

  @override
  String toString() {
    return 'ProfileState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ProfileLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(CustomUser user) complete,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(CustomUser user)? complete,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileLoadingState value) loading,
    required TResult Function(ProfileCompleteState value) complete,
    required TResult Function(ProfileErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileLoadingState value)? loading,
    TResult Function(ProfileCompleteState value)? complete,
    TResult Function(ProfileErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ProfileLoadingState implements ProfileState {
  factory ProfileLoadingState() = _$ProfileLoadingState;
}

/// @nodoc
abstract class $ProfileCompleteStateCopyWith<$Res> {
  factory $ProfileCompleteStateCopyWith(ProfileCompleteState value,
          $Res Function(ProfileCompleteState) then) =
      _$ProfileCompleteStateCopyWithImpl<$Res>;
  $Res call({CustomUser user});
}

/// @nodoc
class _$ProfileCompleteStateCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res>
    implements $ProfileCompleteStateCopyWith<$Res> {
  _$ProfileCompleteStateCopyWithImpl(
      ProfileCompleteState _value, $Res Function(ProfileCompleteState) _then)
      : super(_value, (v) => _then(v as ProfileCompleteState));

  @override
  ProfileCompleteState get _value => super._value as ProfileCompleteState;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(ProfileCompleteState(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as CustomUser,
    ));
  }
}

/// @nodoc
class _$ProfileCompleteState implements ProfileCompleteState {
  _$ProfileCompleteState(this.user);

  @override
  final CustomUser user;

  @override
  String toString() {
    return 'ProfileState.complete(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProfileCompleteState &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  $ProfileCompleteStateCopyWith<ProfileCompleteState> get copyWith =>
      _$ProfileCompleteStateCopyWithImpl<ProfileCompleteState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(CustomUser user) complete,
    required TResult Function(String message) error,
  }) {
    return complete(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(CustomUser user)? complete,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileLoadingState value) loading,
    required TResult Function(ProfileCompleteState value) complete,
    required TResult Function(ProfileErrorState value) error,
  }) {
    return complete(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileLoadingState value)? loading,
    TResult Function(ProfileCompleteState value)? complete,
    TResult Function(ProfileErrorState value)? error,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(this);
    }
    return orElse();
  }
}

abstract class ProfileCompleteState implements ProfileState {
  factory ProfileCompleteState(CustomUser user) = _$ProfileCompleteState;

  CustomUser get user => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileCompleteStateCopyWith<ProfileCompleteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileErrorStateCopyWith<$Res> {
  factory $ProfileErrorStateCopyWith(
          ProfileErrorState value, $Res Function(ProfileErrorState) then) =
      _$ProfileErrorStateCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$ProfileErrorStateCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res>
    implements $ProfileErrorStateCopyWith<$Res> {
  _$ProfileErrorStateCopyWithImpl(
      ProfileErrorState _value, $Res Function(ProfileErrorState) _then)
      : super(_value, (v) => _then(v as ProfileErrorState));

  @override
  ProfileErrorState get _value => super._value as ProfileErrorState;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(ProfileErrorState(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$ProfileErrorState implements ProfileErrorState {
  _$ProfileErrorState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ProfileState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProfileErrorState &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $ProfileErrorStateCopyWith<ProfileErrorState> get copyWith =>
      _$ProfileErrorStateCopyWithImpl<ProfileErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(CustomUser user) complete,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(CustomUser user)? complete,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileLoadingState value) loading,
    required TResult Function(ProfileCompleteState value) complete,
    required TResult Function(ProfileErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileLoadingState value)? loading,
    TResult Function(ProfileCompleteState value)? complete,
    TResult Function(ProfileErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ProfileErrorState implements ProfileState {
  factory ProfileErrorState(String message) = _$ProfileErrorState;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileErrorStateCopyWith<ProfileErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}
