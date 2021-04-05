// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sign_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignUpStateTearOff {
  const _$SignUpStateTearOff();

  SignUpErrorState error(String message) {
    return SignUpErrorState(
      message,
    );
  }

  SignUpSuccessfulState success() {
    return SignUpSuccessfulState();
  }

  SignUpLoadingState loading() {
    return SignUpLoadingState();
  }

  SignUpInitState init() {
    return SignUpInitState();
  }
}

/// @nodoc
const $SignUpState = _$SignUpStateTearOff();

/// @nodoc
mixin _$SignUpState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) error,
    required TResult Function() success,
    required TResult Function() loading,
    required TResult Function() init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? error,
    TResult Function()? success,
    TResult Function()? loading,
    TResult Function()? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpErrorState value) error,
    required TResult Function(SignUpSuccessfulState value) success,
    required TResult Function(SignUpLoadingState value) loading,
    required TResult Function(SignUpInitState value) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpErrorState value)? error,
    TResult Function(SignUpSuccessfulState value)? success,
    TResult Function(SignUpLoadingState value)? loading,
    TResult Function(SignUpInitState value)? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res> implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  final SignUpState _value;
  // ignore: unused_field
  final $Res Function(SignUpState) _then;
}

/// @nodoc
abstract class $SignUpErrorStateCopyWith<$Res> {
  factory $SignUpErrorStateCopyWith(
          SignUpErrorState value, $Res Function(SignUpErrorState) then) =
      _$SignUpErrorStateCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$SignUpErrorStateCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res>
    implements $SignUpErrorStateCopyWith<$Res> {
  _$SignUpErrorStateCopyWithImpl(
      SignUpErrorState _value, $Res Function(SignUpErrorState) _then)
      : super(_value, (v) => _then(v as SignUpErrorState));

  @override
  SignUpErrorState get _value => super._value as SignUpErrorState;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(SignUpErrorState(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$SignUpErrorState implements SignUpErrorState {
  _$SignUpErrorState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SignUpState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SignUpErrorState &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $SignUpErrorStateCopyWith<SignUpErrorState> get copyWith =>
      _$SignUpErrorStateCopyWithImpl<SignUpErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) error,
    required TResult Function() success,
    required TResult Function() loading,
    required TResult Function() init,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? error,
    TResult Function()? success,
    TResult Function()? loading,
    TResult Function()? init,
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
    required TResult Function(SignUpErrorState value) error,
    required TResult Function(SignUpSuccessfulState value) success,
    required TResult Function(SignUpLoadingState value) loading,
    required TResult Function(SignUpInitState value) init,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpErrorState value)? error,
    TResult Function(SignUpSuccessfulState value)? success,
    TResult Function(SignUpLoadingState value)? loading,
    TResult Function(SignUpInitState value)? init,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SignUpErrorState implements SignUpState {
  factory SignUpErrorState(String message) = _$SignUpErrorState;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignUpErrorStateCopyWith<SignUpErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpSuccessfulStateCopyWith<$Res> {
  factory $SignUpSuccessfulStateCopyWith(SignUpSuccessfulState value,
          $Res Function(SignUpSuccessfulState) then) =
      _$SignUpSuccessfulStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignUpSuccessfulStateCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res>
    implements $SignUpSuccessfulStateCopyWith<$Res> {
  _$SignUpSuccessfulStateCopyWithImpl(
      SignUpSuccessfulState _value, $Res Function(SignUpSuccessfulState) _then)
      : super(_value, (v) => _then(v as SignUpSuccessfulState));

  @override
  SignUpSuccessfulState get _value => super._value as SignUpSuccessfulState;
}

/// @nodoc
class _$SignUpSuccessfulState implements SignUpSuccessfulState {
  _$SignUpSuccessfulState();

  @override
  String toString() {
    return 'SignUpState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SignUpSuccessfulState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) error,
    required TResult Function() success,
    required TResult Function() loading,
    required TResult Function() init,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? error,
    TResult Function()? success,
    TResult Function()? loading,
    TResult Function()? init,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpErrorState value) error,
    required TResult Function(SignUpSuccessfulState value) success,
    required TResult Function(SignUpLoadingState value) loading,
    required TResult Function(SignUpInitState value) init,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpErrorState value)? error,
    TResult Function(SignUpSuccessfulState value)? success,
    TResult Function(SignUpLoadingState value)? loading,
    TResult Function(SignUpInitState value)? init,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SignUpSuccessfulState implements SignUpState {
  factory SignUpSuccessfulState() = _$SignUpSuccessfulState;
}

/// @nodoc
abstract class $SignUpLoadingStateCopyWith<$Res> {
  factory $SignUpLoadingStateCopyWith(
          SignUpLoadingState value, $Res Function(SignUpLoadingState) then) =
      _$SignUpLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignUpLoadingStateCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res>
    implements $SignUpLoadingStateCopyWith<$Res> {
  _$SignUpLoadingStateCopyWithImpl(
      SignUpLoadingState _value, $Res Function(SignUpLoadingState) _then)
      : super(_value, (v) => _then(v as SignUpLoadingState));

  @override
  SignUpLoadingState get _value => super._value as SignUpLoadingState;
}

/// @nodoc
class _$SignUpLoadingState implements SignUpLoadingState {
  _$SignUpLoadingState();

  @override
  String toString() {
    return 'SignUpState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SignUpLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) error,
    required TResult Function() success,
    required TResult Function() loading,
    required TResult Function() init,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? error,
    TResult Function()? success,
    TResult Function()? loading,
    TResult Function()? init,
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
    required TResult Function(SignUpErrorState value) error,
    required TResult Function(SignUpSuccessfulState value) success,
    required TResult Function(SignUpLoadingState value) loading,
    required TResult Function(SignUpInitState value) init,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpErrorState value)? error,
    TResult Function(SignUpSuccessfulState value)? success,
    TResult Function(SignUpLoadingState value)? loading,
    TResult Function(SignUpInitState value)? init,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SignUpLoadingState implements SignUpState {
  factory SignUpLoadingState() = _$SignUpLoadingState;
}

/// @nodoc
abstract class $SignUpInitStateCopyWith<$Res> {
  factory $SignUpInitStateCopyWith(
          SignUpInitState value, $Res Function(SignUpInitState) then) =
      _$SignUpInitStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignUpInitStateCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res>
    implements $SignUpInitStateCopyWith<$Res> {
  _$SignUpInitStateCopyWithImpl(
      SignUpInitState _value, $Res Function(SignUpInitState) _then)
      : super(_value, (v) => _then(v as SignUpInitState));

  @override
  SignUpInitState get _value => super._value as SignUpInitState;
}

/// @nodoc
class _$SignUpInitState implements SignUpInitState {
  _$SignUpInitState();

  @override
  String toString() {
    return 'SignUpState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SignUpInitState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) error,
    required TResult Function() success,
    required TResult Function() loading,
    required TResult Function() init,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? error,
    TResult Function()? success,
    TResult Function()? loading,
    TResult Function()? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpErrorState value) error,
    required TResult Function(SignUpSuccessfulState value) success,
    required TResult Function(SignUpLoadingState value) loading,
    required TResult Function(SignUpInitState value) init,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpErrorState value)? error,
    TResult Function(SignUpSuccessfulState value)? success,
    TResult Function(SignUpLoadingState value)? loading,
    TResult Function(SignUpInitState value)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class SignUpInitState implements SignUpState {
  factory SignUpInitState() = _$SignUpInitState;
}
