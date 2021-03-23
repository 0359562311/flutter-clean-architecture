// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FailureTearOff {
  const _$FailureTearOff();

  InvalidEmail invalidEmail(String message) {
    return InvalidEmail(
      message,
    );
  }

  InvalidPassword invalidPassword(String message) {
    return InvalidPassword(
      message,
    );
  }
}

/// @nodoc
const $Failure = _$FailureTearOff();

/// @nodoc
mixin _$Failure {
  String get message => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) invalidEmail,
    required TResult Function(String message) invalidPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? invalidEmail,
    TResult Function(String message)? invalidPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(InvalidPassword value) invalidPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(InvalidPassword value)? invalidPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res> implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  final Failure _value;
  // ignore: unused_field
  final $Res Function(Failure) _then;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $InvalidEmailCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $InvalidEmailCopyWith(
          InvalidEmail value, $Res Function(InvalidEmail) then) =
      _$InvalidEmailCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class _$InvalidEmailCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements $InvalidEmailCopyWith<$Res> {
  _$InvalidEmailCopyWithImpl(
      InvalidEmail _value, $Res Function(InvalidEmail) _then)
      : super(_value, (v) => _then(v as InvalidEmail));

  @override
  InvalidEmail get _value => super._value as InvalidEmail;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(InvalidEmail(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$InvalidEmail implements InvalidEmail {
  _$InvalidEmail(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.invalidEmail(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidEmail &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $InvalidEmailCopyWith<InvalidEmail> get copyWith =>
      _$InvalidEmailCopyWithImpl<InvalidEmail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) invalidEmail,
    required TResult Function(String message) invalidPassword,
  }) {
    return invalidEmail(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? invalidEmail,
    TResult Function(String message)? invalidPassword,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(InvalidPassword value) invalidPassword,
  }) {
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(InvalidPassword value)? invalidPassword,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class InvalidEmail implements Failure {
  factory InvalidEmail(String message) = _$InvalidEmail;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $InvalidEmailCopyWith<InvalidEmail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvalidPasswordCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $InvalidPasswordCopyWith(
          InvalidPassword value, $Res Function(InvalidPassword) then) =
      _$InvalidPasswordCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class _$InvalidPasswordCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements $InvalidPasswordCopyWith<$Res> {
  _$InvalidPasswordCopyWithImpl(
      InvalidPassword _value, $Res Function(InvalidPassword) _then)
      : super(_value, (v) => _then(v as InvalidPassword));

  @override
  InvalidPassword get _value => super._value as InvalidPassword;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(InvalidPassword(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$InvalidPassword implements InvalidPassword {
  _$InvalidPassword(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.invalidPassword(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidPassword &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $InvalidPasswordCopyWith<InvalidPassword> get copyWith =>
      _$InvalidPasswordCopyWithImpl<InvalidPassword>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) invalidEmail,
    required TResult Function(String message) invalidPassword,
  }) {
    return invalidPassword(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? invalidEmail,
    TResult Function(String message)? invalidPassword,
    required TResult orElse(),
  }) {
    if (invalidPassword != null) {
      return invalidPassword(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(InvalidPassword value) invalidPassword,
  }) {
    return invalidPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(InvalidPassword value)? invalidPassword,
    required TResult orElse(),
  }) {
    if (invalidPassword != null) {
      return invalidPassword(this);
    }
    return orElse();
  }
}

abstract class InvalidPassword implements Failure {
  factory InvalidPassword(String message) = _$InvalidPassword;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $InvalidPasswordCopyWith<InvalidPassword> get copyWith =>
      throw _privateConstructorUsedError;
}
