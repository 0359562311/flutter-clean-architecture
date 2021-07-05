// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeStateTearOff {
  const _$HomeStateTearOff();

  HomeComplete getInforCompletely(CustomUser customUser) {
    return HomeComplete(
      customUser,
    );
  }

  HomeErrorState error(String message) {
    return HomeErrorState(
      message,
    );
  }

  HomeLoading loading() {
    return HomeLoading();
  }
}

/// @nodoc
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomUser customUser) getInforCompletely,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomUser customUser)? getInforCompletely,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeComplete value) getInforCompletely,
    required TResult Function(HomeErrorState value) error,
    required TResult Function(HomeLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeComplete value)? getInforCompletely,
    TResult Function(HomeErrorState value)? error,
    TResult Function(HomeLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;
}

/// @nodoc
abstract class $HomeCompleteCopyWith<$Res> {
  factory $HomeCompleteCopyWith(
          HomeComplete value, $Res Function(HomeComplete) then) =
      _$HomeCompleteCopyWithImpl<$Res>;
  $Res call({CustomUser customUser});
}

/// @nodoc
class _$HomeCompleteCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements $HomeCompleteCopyWith<$Res> {
  _$HomeCompleteCopyWithImpl(
      HomeComplete _value, $Res Function(HomeComplete) _then)
      : super(_value, (v) => _then(v as HomeComplete));

  @override
  HomeComplete get _value => super._value as HomeComplete;

  @override
  $Res call({
    Object? customUser = freezed,
  }) {
    return _then(HomeComplete(
      customUser == freezed
          ? _value.customUser
          : customUser // ignore: cast_nullable_to_non_nullable
              as CustomUser,
    ));
  }
}

/// @nodoc
class _$HomeComplete implements HomeComplete {
  _$HomeComplete(this.customUser);

  @override
  final CustomUser customUser;

  @override
  String toString() {
    return 'HomeState.getInforCompletely(customUser: $customUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HomeComplete &&
            (identical(other.customUser, customUser) ||
                const DeepCollectionEquality()
                    .equals(other.customUser, customUser)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(customUser);

  @JsonKey(ignore: true)
  @override
  $HomeCompleteCopyWith<HomeComplete> get copyWith =>
      _$HomeCompleteCopyWithImpl<HomeComplete>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomUser customUser) getInforCompletely,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return getInforCompletely(customUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomUser customUser)? getInforCompletely,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (getInforCompletely != null) {
      return getInforCompletely(customUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeComplete value) getInforCompletely,
    required TResult Function(HomeErrorState value) error,
    required TResult Function(HomeLoading value) loading,
  }) {
    return getInforCompletely(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeComplete value)? getInforCompletely,
    TResult Function(HomeErrorState value)? error,
    TResult Function(HomeLoading value)? loading,
    required TResult orElse(),
  }) {
    if (getInforCompletely != null) {
      return getInforCompletely(this);
    }
    return orElse();
  }
}

abstract class HomeComplete implements HomeState {
  factory HomeComplete(CustomUser customUser) = _$HomeComplete;

  CustomUser get customUser => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeCompleteCopyWith<HomeComplete> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeErrorStateCopyWith<$Res> {
  factory $HomeErrorStateCopyWith(
          HomeErrorState value, $Res Function(HomeErrorState) then) =
      _$HomeErrorStateCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$HomeErrorStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements $HomeErrorStateCopyWith<$Res> {
  _$HomeErrorStateCopyWithImpl(
      HomeErrorState _value, $Res Function(HomeErrorState) _then)
      : super(_value, (v) => _then(v as HomeErrorState));

  @override
  HomeErrorState get _value => super._value as HomeErrorState;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(HomeErrorState(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$HomeErrorState implements HomeErrorState {
  _$HomeErrorState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'HomeState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HomeErrorState &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $HomeErrorStateCopyWith<HomeErrorState> get copyWith =>
      _$HomeErrorStateCopyWithImpl<HomeErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomUser customUser) getInforCompletely,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomUser customUser)? getInforCompletely,
    TResult Function(String message)? error,
    TResult Function()? loading,
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
    required TResult Function(HomeComplete value) getInforCompletely,
    required TResult Function(HomeErrorState value) error,
    required TResult Function(HomeLoading value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeComplete value)? getInforCompletely,
    TResult Function(HomeErrorState value)? error,
    TResult Function(HomeLoading value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class HomeErrorState implements HomeState {
  factory HomeErrorState(String message) = _$HomeErrorState;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeErrorStateCopyWith<HomeErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeLoadingCopyWith<$Res> {
  factory $HomeLoadingCopyWith(
          HomeLoading value, $Res Function(HomeLoading) then) =
      _$HomeLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeLoadingCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements $HomeLoadingCopyWith<$Res> {
  _$HomeLoadingCopyWithImpl(
      HomeLoading _value, $Res Function(HomeLoading) _then)
      : super(_value, (v) => _then(v as HomeLoading));

  @override
  HomeLoading get _value => super._value as HomeLoading;
}

/// @nodoc
class _$HomeLoading implements HomeLoading {
  _$HomeLoading();

  @override
  String toString() {
    return 'HomeState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is HomeLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomUser customUser) getInforCompletely,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomUser customUser)? getInforCompletely,
    TResult Function(String message)? error,
    TResult Function()? loading,
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
    required TResult Function(HomeComplete value) getInforCompletely,
    required TResult Function(HomeErrorState value) error,
    required TResult Function(HomeLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeComplete value)? getInforCompletely,
    TResult Function(HomeErrorState value)? error,
    TResult Function(HomeLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class HomeLoading implements HomeState {
  factory HomeLoading() = _$HomeLoading;
}
