// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'login_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LogInEventTearOff {
  const _$LogInEventTearOff();

  LogInByEmailEvent logInWithUsernameAndPassWord(
      String email, String password) {
    return LogInByEmailEvent(
      email,
      password,
    );
  }
}

/// @nodoc
const $LogInEvent = _$LogInEventTearOff();

/// @nodoc
mixin _$LogInEvent {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password)
        logInWithUsernameAndPassWord,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)?
        logInWithUsernameAndPassWord,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogInByEmailEvent value)
        logInWithUsernameAndPassWord,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogInByEmailEvent value)? logInWithUsernameAndPassWord,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LogInEventCopyWith<LogInEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogInEventCopyWith<$Res> {
  factory $LogInEventCopyWith(
          LogInEvent value, $Res Function(LogInEvent) then) =
      _$LogInEventCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class _$LogInEventCopyWithImpl<$Res> implements $LogInEventCopyWith<$Res> {
  _$LogInEventCopyWithImpl(this._value, this._then);

  final LogInEvent _value;
  // ignore: unused_field
  final $Res Function(LogInEvent) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $LogInByEmailEventCopyWith<$Res>
    implements $LogInEventCopyWith<$Res> {
  factory $LogInByEmailEventCopyWith(
          LogInByEmailEvent value, $Res Function(LogInByEmailEvent) then) =
      _$LogInByEmailEventCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password});
}

/// @nodoc
class _$LogInByEmailEventCopyWithImpl<$Res>
    extends _$LogInEventCopyWithImpl<$Res>
    implements $LogInByEmailEventCopyWith<$Res> {
  _$LogInByEmailEventCopyWithImpl(
      LogInByEmailEvent _value, $Res Function(LogInByEmailEvent) _then)
      : super(_value, (v) => _then(v as LogInByEmailEvent));

  @override
  LogInByEmailEvent get _value => super._value as LogInByEmailEvent;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(LogInByEmailEvent(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$LogInByEmailEvent implements LogInByEmailEvent {
  _$LogInByEmailEvent(this.email, this.password);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LogInEvent.logInWithUsernameAndPassWord(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LogInByEmailEvent &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password);

  @JsonKey(ignore: true)
  @override
  $LogInByEmailEventCopyWith<LogInByEmailEvent> get copyWith =>
      _$LogInByEmailEventCopyWithImpl<LogInByEmailEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password)
        logInWithUsernameAndPassWord,
  }) {
    return logInWithUsernameAndPassWord(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)?
        logInWithUsernameAndPassWord,
    required TResult orElse(),
  }) {
    if (logInWithUsernameAndPassWord != null) {
      return logInWithUsernameAndPassWord(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogInByEmailEvent value)
        logInWithUsernameAndPassWord,
  }) {
    return logInWithUsernameAndPassWord(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogInByEmailEvent value)? logInWithUsernameAndPassWord,
    required TResult orElse(),
  }) {
    if (logInWithUsernameAndPassWord != null) {
      return logInWithUsernameAndPassWord(this);
    }
    return orElse();
  }
}

abstract class LogInByEmailEvent implements LogInEvent {
  factory LogInByEmailEvent(String email, String password) =
      _$LogInByEmailEvent;

  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $LogInByEmailEventCopyWith<LogInByEmailEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
