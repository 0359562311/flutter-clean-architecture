// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginStateTearOff {
  const _$LoginStateTearOff();

  LogInInit init() {
    return LogInInit();
  }

  LoadingState loadingState() {
    return LoadingState();
  }

  LogInSuccess logInSuccessful() {
    return LogInSuccess();
  }

  LogInError getError(String message) {
    return LogInError(
      message,
    );
  }
}

/// @nodoc
const $LoginState = _$LoginStateTearOff();

/// @nodoc
mixin _$LoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loadingState,
    required TResult Function() logInSuccessful,
    required TResult Function(String message) getError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loadingState,
    TResult Function()? logInSuccessful,
    TResult Function(String message)? getError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogInInit value) init,
    required TResult Function(LoadingState value) loadingState,
    required TResult Function(LogInSuccess value) logInSuccessful,
    required TResult Function(LogInError value) getError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogInInit value)? init,
    TResult Function(LoadingState value)? loadingState,
    TResult Function(LogInSuccess value)? logInSuccessful,
    TResult Function(LogInError value)? getError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;
}

/// @nodoc
abstract class $LogInInitCopyWith<$Res> {
  factory $LogInInitCopyWith(LogInInit value, $Res Function(LogInInit) then) =
      _$LogInInitCopyWithImpl<$Res>;
}

/// @nodoc
class _$LogInInitCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements $LogInInitCopyWith<$Res> {
  _$LogInInitCopyWithImpl(LogInInit _value, $Res Function(LogInInit) _then)
      : super(_value, (v) => _then(v as LogInInit));

  @override
  LogInInit get _value => super._value as LogInInit;
}

/// @nodoc
class _$LogInInit implements LogInInit {
  _$LogInInit();

  @override
  String toString() {
    return 'LoginState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LogInInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loadingState,
    required TResult Function() logInSuccessful,
    required TResult Function(String message) getError,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loadingState,
    TResult Function()? logInSuccessful,
    TResult Function(String message)? getError,
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
    required TResult Function(LogInInit value) init,
    required TResult Function(LoadingState value) loadingState,
    required TResult Function(LogInSuccess value) logInSuccessful,
    required TResult Function(LogInError value) getError,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogInInit value)? init,
    TResult Function(LoadingState value)? loadingState,
    TResult Function(LogInSuccess value)? logInSuccessful,
    TResult Function(LogInError value)? getError,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class LogInInit implements LoginState {
  factory LogInInit() = _$LogInInit;
}

/// @nodoc
abstract class $LoadingStateCopyWith<$Res> {
  factory $LoadingStateCopyWith(
          LoadingState value, $Res Function(LoadingState) then) =
      _$LoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingStateCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements $LoadingStateCopyWith<$Res> {
  _$LoadingStateCopyWithImpl(
      LoadingState _value, $Res Function(LoadingState) _then)
      : super(_value, (v) => _then(v as LoadingState));

  @override
  LoadingState get _value => super._value as LoadingState;
}

/// @nodoc
class _$LoadingState implements LoadingState {
  _$LoadingState();

  @override
  String toString() {
    return 'LoginState.loadingState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loadingState,
    required TResult Function() logInSuccessful,
    required TResult Function(String message) getError,
  }) {
    return loadingState();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loadingState,
    TResult Function()? logInSuccessful,
    TResult Function(String message)? getError,
    required TResult orElse(),
  }) {
    if (loadingState != null) {
      return loadingState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogInInit value) init,
    required TResult Function(LoadingState value) loadingState,
    required TResult Function(LogInSuccess value) logInSuccessful,
    required TResult Function(LogInError value) getError,
  }) {
    return loadingState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogInInit value)? init,
    TResult Function(LoadingState value)? loadingState,
    TResult Function(LogInSuccess value)? logInSuccessful,
    TResult Function(LogInError value)? getError,
    required TResult orElse(),
  }) {
    if (loadingState != null) {
      return loadingState(this);
    }
    return orElse();
  }
}

abstract class LoadingState implements LoginState {
  factory LoadingState() = _$LoadingState;
}

/// @nodoc
abstract class $LogInSuccessCopyWith<$Res> {
  factory $LogInSuccessCopyWith(
          LogInSuccess value, $Res Function(LogInSuccess) then) =
      _$LogInSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class _$LogInSuccessCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements $LogInSuccessCopyWith<$Res> {
  _$LogInSuccessCopyWithImpl(
      LogInSuccess _value, $Res Function(LogInSuccess) _then)
      : super(_value, (v) => _then(v as LogInSuccess));

  @override
  LogInSuccess get _value => super._value as LogInSuccess;
}

/// @nodoc
class _$LogInSuccess implements LogInSuccess {
  _$LogInSuccess();

  @override
  String toString() {
    return 'LoginState.logInSuccessful()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LogInSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loadingState,
    required TResult Function() logInSuccessful,
    required TResult Function(String message) getError,
  }) {
    return logInSuccessful();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loadingState,
    TResult Function()? logInSuccessful,
    TResult Function(String message)? getError,
    required TResult orElse(),
  }) {
    if (logInSuccessful != null) {
      return logInSuccessful();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogInInit value) init,
    required TResult Function(LoadingState value) loadingState,
    required TResult Function(LogInSuccess value) logInSuccessful,
    required TResult Function(LogInError value) getError,
  }) {
    return logInSuccessful(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogInInit value)? init,
    TResult Function(LoadingState value)? loadingState,
    TResult Function(LogInSuccess value)? logInSuccessful,
    TResult Function(LogInError value)? getError,
    required TResult orElse(),
  }) {
    if (logInSuccessful != null) {
      return logInSuccessful(this);
    }
    return orElse();
  }
}

abstract class LogInSuccess implements LoginState {
  factory LogInSuccess() = _$LogInSuccess;
}

/// @nodoc
abstract class $LogInErrorCopyWith<$Res> {
  factory $LogInErrorCopyWith(
          LogInError value, $Res Function(LogInError) then) =
      _$LogInErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$LogInErrorCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements $LogInErrorCopyWith<$Res> {
  _$LogInErrorCopyWithImpl(LogInError _value, $Res Function(LogInError) _then)
      : super(_value, (v) => _then(v as LogInError));

  @override
  LogInError get _value => super._value as LogInError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(LogInError(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$LogInError implements LogInError {
  _$LogInError(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'LoginState.getError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LogInError &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $LogInErrorCopyWith<LogInError> get copyWith =>
      _$LogInErrorCopyWithImpl<LogInError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loadingState,
    required TResult Function() logInSuccessful,
    required TResult Function(String message) getError,
  }) {
    return getError(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loadingState,
    TResult Function()? logInSuccessful,
    TResult Function(String message)? getError,
    required TResult orElse(),
  }) {
    if (getError != null) {
      return getError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogInInit value) init,
    required TResult Function(LoadingState value) loadingState,
    required TResult Function(LogInSuccess value) logInSuccessful,
    required TResult Function(LogInError value) getError,
  }) {
    return getError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogInInit value)? init,
    TResult Function(LoadingState value)? loadingState,
    TResult Function(LogInSuccess value)? logInSuccessful,
    TResult Function(LogInError value)? getError,
    required TResult orElse(),
  }) {
    if (getError != null) {
      return getError(this);
    }
    return orElse();
  }
}

abstract class LogInError implements LoginState {
  factory LogInError(String message) = _$LogInError;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LogInErrorCopyWith<LogInError> get copyWith =>
      throw _privateConstructorUsedError;
}
