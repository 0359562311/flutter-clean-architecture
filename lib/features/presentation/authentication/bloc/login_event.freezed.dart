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

  LogInByEmailEvent logInWithEmailAndPassWord(String email, String password) {
    return LogInByEmailEvent(
      email,
      password,
    );
  }

  LogInByGoogleEvent googleSignIn() {
    return LogInByGoogleEvent();
  }

  LogInByFacebookEvent facebookSignIn() {
    return LogInByFacebookEvent();
  }
}

/// @nodoc
const $LogInEvent = _$LogInEventTearOff();

/// @nodoc
mixin _$LogInEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password)
        logInWithEmailAndPassWord,
    required TResult Function() googleSignIn,
    required TResult Function() facebookSignIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? logInWithEmailAndPassWord,
    TResult Function()? googleSignIn,
    TResult Function()? facebookSignIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogInByEmailEvent value)
        logInWithEmailAndPassWord,
    required TResult Function(LogInByGoogleEvent value) googleSignIn,
    required TResult Function(LogInByFacebookEvent value) facebookSignIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogInByEmailEvent value)? logInWithEmailAndPassWord,
    TResult Function(LogInByGoogleEvent value)? googleSignIn,
    TResult Function(LogInByFacebookEvent value)? facebookSignIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogInEventCopyWith<$Res> {
  factory $LogInEventCopyWith(
          LogInEvent value, $Res Function(LogInEvent) then) =
      _$LogInEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$LogInEventCopyWithImpl<$Res> implements $LogInEventCopyWith<$Res> {
  _$LogInEventCopyWithImpl(this._value, this._then);

  final LogInEvent _value;
  // ignore: unused_field
  final $Res Function(LogInEvent) _then;
}

/// @nodoc
abstract class $LogInByEmailEventCopyWith<$Res> {
  factory $LogInByEmailEventCopyWith(
          LogInByEmailEvent value, $Res Function(LogInByEmailEvent) then) =
      _$LogInByEmailEventCopyWithImpl<$Res>;
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
    return 'LogInEvent.logInWithEmailAndPassWord(email: $email, password: $password)';
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
        logInWithEmailAndPassWord,
    required TResult Function() googleSignIn,
    required TResult Function() facebookSignIn,
  }) {
    return logInWithEmailAndPassWord(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? logInWithEmailAndPassWord,
    TResult Function()? googleSignIn,
    TResult Function()? facebookSignIn,
    required TResult orElse(),
  }) {
    if (logInWithEmailAndPassWord != null) {
      return logInWithEmailAndPassWord(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogInByEmailEvent value)
        logInWithEmailAndPassWord,
    required TResult Function(LogInByGoogleEvent value) googleSignIn,
    required TResult Function(LogInByFacebookEvent value) facebookSignIn,
  }) {
    return logInWithEmailAndPassWord(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogInByEmailEvent value)? logInWithEmailAndPassWord,
    TResult Function(LogInByGoogleEvent value)? googleSignIn,
    TResult Function(LogInByFacebookEvent value)? facebookSignIn,
    required TResult orElse(),
  }) {
    if (logInWithEmailAndPassWord != null) {
      return logInWithEmailAndPassWord(this);
    }
    return orElse();
  }
}

abstract class LogInByEmailEvent implements LogInEvent {
  factory LogInByEmailEvent(String email, String password) =
      _$LogInByEmailEvent;

  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LogInByEmailEventCopyWith<LogInByEmailEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogInByGoogleEventCopyWith<$Res> {
  factory $LogInByGoogleEventCopyWith(
          LogInByGoogleEvent value, $Res Function(LogInByGoogleEvent) then) =
      _$LogInByGoogleEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$LogInByGoogleEventCopyWithImpl<$Res>
    extends _$LogInEventCopyWithImpl<$Res>
    implements $LogInByGoogleEventCopyWith<$Res> {
  _$LogInByGoogleEventCopyWithImpl(
      LogInByGoogleEvent _value, $Res Function(LogInByGoogleEvent) _then)
      : super(_value, (v) => _then(v as LogInByGoogleEvent));

  @override
  LogInByGoogleEvent get _value => super._value as LogInByGoogleEvent;
}

/// @nodoc
class _$LogInByGoogleEvent implements LogInByGoogleEvent {
  _$LogInByGoogleEvent();

  @override
  String toString() {
    return 'LogInEvent.googleSignIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LogInByGoogleEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password)
        logInWithEmailAndPassWord,
    required TResult Function() googleSignIn,
    required TResult Function() facebookSignIn,
  }) {
    return googleSignIn();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? logInWithEmailAndPassWord,
    TResult Function()? googleSignIn,
    TResult Function()? facebookSignIn,
    required TResult orElse(),
  }) {
    if (googleSignIn != null) {
      return googleSignIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogInByEmailEvent value)
        logInWithEmailAndPassWord,
    required TResult Function(LogInByGoogleEvent value) googleSignIn,
    required TResult Function(LogInByFacebookEvent value) facebookSignIn,
  }) {
    return googleSignIn(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogInByEmailEvent value)? logInWithEmailAndPassWord,
    TResult Function(LogInByGoogleEvent value)? googleSignIn,
    TResult Function(LogInByFacebookEvent value)? facebookSignIn,
    required TResult orElse(),
  }) {
    if (googleSignIn != null) {
      return googleSignIn(this);
    }
    return orElse();
  }
}

abstract class LogInByGoogleEvent implements LogInEvent {
  factory LogInByGoogleEvent() = _$LogInByGoogleEvent;
}

/// @nodoc
abstract class $LogInByFacebookEventCopyWith<$Res> {
  factory $LogInByFacebookEventCopyWith(LogInByFacebookEvent value,
          $Res Function(LogInByFacebookEvent) then) =
      _$LogInByFacebookEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$LogInByFacebookEventCopyWithImpl<$Res>
    extends _$LogInEventCopyWithImpl<$Res>
    implements $LogInByFacebookEventCopyWith<$Res> {
  _$LogInByFacebookEventCopyWithImpl(
      LogInByFacebookEvent _value, $Res Function(LogInByFacebookEvent) _then)
      : super(_value, (v) => _then(v as LogInByFacebookEvent));

  @override
  LogInByFacebookEvent get _value => super._value as LogInByFacebookEvent;
}

/// @nodoc
class _$LogInByFacebookEvent implements LogInByFacebookEvent {
  _$LogInByFacebookEvent();

  @override
  String toString() {
    return 'LogInEvent.facebookSignIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LogInByFacebookEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password)
        logInWithEmailAndPassWord,
    required TResult Function() googleSignIn,
    required TResult Function() facebookSignIn,
  }) {
    return facebookSignIn();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? logInWithEmailAndPassWord,
    TResult Function()? googleSignIn,
    TResult Function()? facebookSignIn,
    required TResult orElse(),
  }) {
    if (facebookSignIn != null) {
      return facebookSignIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogInByEmailEvent value)
        logInWithEmailAndPassWord,
    required TResult Function(LogInByGoogleEvent value) googleSignIn,
    required TResult Function(LogInByFacebookEvent value) facebookSignIn,
  }) {
    return facebookSignIn(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogInByEmailEvent value)? logInWithEmailAndPassWord,
    TResult Function(LogInByGoogleEvent value)? googleSignIn,
    TResult Function(LogInByFacebookEvent value)? facebookSignIn,
    required TResult orElse(),
  }) {
    if (facebookSignIn != null) {
      return facebookSignIn(this);
    }
    return orElse();
  }
}

abstract class LogInByFacebookEvent implements LogInEvent {
  factory LogInByFacebookEvent() = _$LogInByFacebookEvent;
}
