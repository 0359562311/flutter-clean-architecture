// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sign_up_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignUpEventTearOff {
  const _$SignUpEventTearOff();

  SignUpWithEmaiAndPasswordEvent signUp(String email, String password) {
    return SignUpWithEmaiAndPasswordEvent(
      email,
      password,
    );
  }
}

/// @nodoc
const $SignUpEvent = _$SignUpEventTearOff();

/// @nodoc
mixin _$SignUpEvent {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signUp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpWithEmaiAndPasswordEvent value) signUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpWithEmaiAndPasswordEvent value)? signUp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpEventCopyWith<SignUpEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpEventCopyWith<$Res> {
  factory $SignUpEventCopyWith(
          SignUpEvent value, $Res Function(SignUpEvent) then) =
      _$SignUpEventCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class _$SignUpEventCopyWithImpl<$Res> implements $SignUpEventCopyWith<$Res> {
  _$SignUpEventCopyWithImpl(this._value, this._then);

  final SignUpEvent _value;
  // ignore: unused_field
  final $Res Function(SignUpEvent) _then;

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
abstract class $SignUpWithEmaiAndPasswordEventCopyWith<$Res>
    implements $SignUpEventCopyWith<$Res> {
  factory $SignUpWithEmaiAndPasswordEventCopyWith(
          SignUpWithEmaiAndPasswordEvent value,
          $Res Function(SignUpWithEmaiAndPasswordEvent) then) =
      _$SignUpWithEmaiAndPasswordEventCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password});
}

/// @nodoc
class _$SignUpWithEmaiAndPasswordEventCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res>
    implements $SignUpWithEmaiAndPasswordEventCopyWith<$Res> {
  _$SignUpWithEmaiAndPasswordEventCopyWithImpl(
      SignUpWithEmaiAndPasswordEvent _value,
      $Res Function(SignUpWithEmaiAndPasswordEvent) _then)
      : super(_value, (v) => _then(v as SignUpWithEmaiAndPasswordEvent));

  @override
  SignUpWithEmaiAndPasswordEvent get _value =>
      super._value as SignUpWithEmaiAndPasswordEvent;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(SignUpWithEmaiAndPasswordEvent(
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
class _$SignUpWithEmaiAndPasswordEvent
    implements SignUpWithEmaiAndPasswordEvent {
  _$SignUpWithEmaiAndPasswordEvent(this.email, this.password);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignUpEvent.signUp(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SignUpWithEmaiAndPasswordEvent &&
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
  $SignUpWithEmaiAndPasswordEventCopyWith<SignUpWithEmaiAndPasswordEvent>
      get copyWith => _$SignUpWithEmaiAndPasswordEventCopyWithImpl<
          SignUpWithEmaiAndPasswordEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signUp,
  }) {
    return signUp(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signUp,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpWithEmaiAndPasswordEvent value) signUp,
  }) {
    return signUp(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpWithEmaiAndPasswordEvent value)? signUp,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(this);
    }
    return orElse();
  }
}

abstract class SignUpWithEmaiAndPasswordEvent implements SignUpEvent {
  factory SignUpWithEmaiAndPasswordEvent(String email, String password) =
      _$SignUpWithEmaiAndPasswordEvent;

  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $SignUpWithEmaiAndPasswordEventCopyWith<SignUpWithEmaiAndPasswordEvent>
      get copyWith => throw _privateConstructorUsedError;
}
