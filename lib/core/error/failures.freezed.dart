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

  NetWorkDisconnected networkDisconnected(String message) {
    return NetWorkDisconnected(
      message,
    );
  }

  ServerSendsError serverSendsError(String message) {
    return ServerSendsError(
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
    required TResult Function(String message) networkDisconnected,
    required TResult Function(String message) serverSendsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? networkDisconnected,
    TResult Function(String message)? serverSendsError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetWorkDisconnected value) networkDisconnected,
    required TResult Function(ServerSendsError value) serverSendsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetWorkDisconnected value)? networkDisconnected,
    TResult Function(ServerSendsError value)? serverSendsError,
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
abstract class $NetWorkDisconnectedCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $NetWorkDisconnectedCopyWith(
          NetWorkDisconnected value, $Res Function(NetWorkDisconnected) then) =
      _$NetWorkDisconnectedCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class _$NetWorkDisconnectedCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res>
    implements $NetWorkDisconnectedCopyWith<$Res> {
  _$NetWorkDisconnectedCopyWithImpl(
      NetWorkDisconnected _value, $Res Function(NetWorkDisconnected) _then)
      : super(_value, (v) => _then(v as NetWorkDisconnected));

  @override
  NetWorkDisconnected get _value => super._value as NetWorkDisconnected;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(NetWorkDisconnected(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$NetWorkDisconnected implements NetWorkDisconnected {
  _$NetWorkDisconnected(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.networkDisconnected(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NetWorkDisconnected &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $NetWorkDisconnectedCopyWith<NetWorkDisconnected> get copyWith =>
      _$NetWorkDisconnectedCopyWithImpl<NetWorkDisconnected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) networkDisconnected,
    required TResult Function(String message) serverSendsError,
  }) {
    return networkDisconnected(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? networkDisconnected,
    TResult Function(String message)? serverSendsError,
    required TResult orElse(),
  }) {
    if (networkDisconnected != null) {
      return networkDisconnected(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetWorkDisconnected value) networkDisconnected,
    required TResult Function(ServerSendsError value) serverSendsError,
  }) {
    return networkDisconnected(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetWorkDisconnected value)? networkDisconnected,
    TResult Function(ServerSendsError value)? serverSendsError,
    required TResult orElse(),
  }) {
    if (networkDisconnected != null) {
      return networkDisconnected(this);
    }
    return orElse();
  }
}

abstract class NetWorkDisconnected implements Failure {
  factory NetWorkDisconnected(String message) = _$NetWorkDisconnected;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $NetWorkDisconnectedCopyWith<NetWorkDisconnected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerSendsErrorCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $ServerSendsErrorCopyWith(
          ServerSendsError value, $Res Function(ServerSendsError) then) =
      _$ServerSendsErrorCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class _$ServerSendsErrorCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements $ServerSendsErrorCopyWith<$Res> {
  _$ServerSendsErrorCopyWithImpl(
      ServerSendsError _value, $Res Function(ServerSendsError) _then)
      : super(_value, (v) => _then(v as ServerSendsError));

  @override
  ServerSendsError get _value => super._value as ServerSendsError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(ServerSendsError(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$ServerSendsError implements ServerSendsError {
  _$ServerSendsError(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.serverSendsError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ServerSendsError &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $ServerSendsErrorCopyWith<ServerSendsError> get copyWith =>
      _$ServerSendsErrorCopyWithImpl<ServerSendsError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) networkDisconnected,
    required TResult Function(String message) serverSendsError,
  }) {
    return serverSendsError(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? networkDisconnected,
    TResult Function(String message)? serverSendsError,
    required TResult orElse(),
  }) {
    if (serverSendsError != null) {
      return serverSendsError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetWorkDisconnected value) networkDisconnected,
    required TResult Function(ServerSendsError value) serverSendsError,
  }) {
    return serverSendsError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetWorkDisconnected value)? networkDisconnected,
    TResult Function(ServerSendsError value)? serverSendsError,
    required TResult orElse(),
  }) {
    if (serverSendsError != null) {
      return serverSendsError(this);
    }
    return orElse();
  }
}

abstract class ServerSendsError implements Failure {
  factory ServerSendsError(String message) = _$ServerSendsError;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $ServerSendsErrorCopyWith<ServerSendsError> get copyWith =>
      throw _privateConstructorUsedError;
}
