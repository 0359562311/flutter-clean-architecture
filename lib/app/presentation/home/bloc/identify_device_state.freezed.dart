// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'identify_device_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$IdentifyDeviceStateTearOff {
  const _$IdentifyDeviceStateTearOff();

  IdentifyDeviceLoadingState loading() {
    return IdentifyDeviceLoadingState();
  }

  IdentifyDeviceErrorState error(String message) {
    return IdentifyDeviceErrorState(
      message,
    );
  }

  IdentifyDeviceSuccessfulState successful() {
    return IdentifyDeviceSuccessfulState();
  }
}

/// @nodoc
const $IdentifyDeviceState = _$IdentifyDeviceStateTearOff();

/// @nodoc
mixin _$IdentifyDeviceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? successful,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdentifyDeviceLoadingState value) loading,
    required TResult Function(IdentifyDeviceErrorState value) error,
    required TResult Function(IdentifyDeviceSuccessfulState value) successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdentifyDeviceLoadingState value)? loading,
    TResult Function(IdentifyDeviceErrorState value)? error,
    TResult Function(IdentifyDeviceSuccessfulState value)? successful,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdentifyDeviceStateCopyWith<$Res> {
  factory $IdentifyDeviceStateCopyWith(
          IdentifyDeviceState value, $Res Function(IdentifyDeviceState) then) =
      _$IdentifyDeviceStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$IdentifyDeviceStateCopyWithImpl<$Res>
    implements $IdentifyDeviceStateCopyWith<$Res> {
  _$IdentifyDeviceStateCopyWithImpl(this._value, this._then);

  final IdentifyDeviceState _value;
  // ignore: unused_field
  final $Res Function(IdentifyDeviceState) _then;
}

/// @nodoc
abstract class $IdentifyDeviceLoadingStateCopyWith<$Res> {
  factory $IdentifyDeviceLoadingStateCopyWith(IdentifyDeviceLoadingState value,
          $Res Function(IdentifyDeviceLoadingState) then) =
      _$IdentifyDeviceLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$IdentifyDeviceLoadingStateCopyWithImpl<$Res>
    extends _$IdentifyDeviceStateCopyWithImpl<$Res>
    implements $IdentifyDeviceLoadingStateCopyWith<$Res> {
  _$IdentifyDeviceLoadingStateCopyWithImpl(IdentifyDeviceLoadingState _value,
      $Res Function(IdentifyDeviceLoadingState) _then)
      : super(_value, (v) => _then(v as IdentifyDeviceLoadingState));

  @override
  IdentifyDeviceLoadingState get _value =>
      super._value as IdentifyDeviceLoadingState;
}

/// @nodoc
class _$IdentifyDeviceLoadingState implements IdentifyDeviceLoadingState {
  _$IdentifyDeviceLoadingState();

  @override
  String toString() {
    return 'IdentifyDeviceState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is IdentifyDeviceLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() successful,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? successful,
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
    required TResult Function(IdentifyDeviceLoadingState value) loading,
    required TResult Function(IdentifyDeviceErrorState value) error,
    required TResult Function(IdentifyDeviceSuccessfulState value) successful,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdentifyDeviceLoadingState value)? loading,
    TResult Function(IdentifyDeviceErrorState value)? error,
    TResult Function(IdentifyDeviceSuccessfulState value)? successful,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class IdentifyDeviceLoadingState implements IdentifyDeviceState {
  factory IdentifyDeviceLoadingState() = _$IdentifyDeviceLoadingState;
}

/// @nodoc
abstract class $IdentifyDeviceErrorStateCopyWith<$Res> {
  factory $IdentifyDeviceErrorStateCopyWith(IdentifyDeviceErrorState value,
          $Res Function(IdentifyDeviceErrorState) then) =
      _$IdentifyDeviceErrorStateCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$IdentifyDeviceErrorStateCopyWithImpl<$Res>
    extends _$IdentifyDeviceStateCopyWithImpl<$Res>
    implements $IdentifyDeviceErrorStateCopyWith<$Res> {
  _$IdentifyDeviceErrorStateCopyWithImpl(IdentifyDeviceErrorState _value,
      $Res Function(IdentifyDeviceErrorState) _then)
      : super(_value, (v) => _then(v as IdentifyDeviceErrorState));

  @override
  IdentifyDeviceErrorState get _value =>
      super._value as IdentifyDeviceErrorState;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(IdentifyDeviceErrorState(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$IdentifyDeviceErrorState implements IdentifyDeviceErrorState {
  _$IdentifyDeviceErrorState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'IdentifyDeviceState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is IdentifyDeviceErrorState &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $IdentifyDeviceErrorStateCopyWith<IdentifyDeviceErrorState> get copyWith =>
      _$IdentifyDeviceErrorStateCopyWithImpl<IdentifyDeviceErrorState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() successful,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? successful,
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
    required TResult Function(IdentifyDeviceLoadingState value) loading,
    required TResult Function(IdentifyDeviceErrorState value) error,
    required TResult Function(IdentifyDeviceSuccessfulState value) successful,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdentifyDeviceLoadingState value)? loading,
    TResult Function(IdentifyDeviceErrorState value)? error,
    TResult Function(IdentifyDeviceSuccessfulState value)? successful,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class IdentifyDeviceErrorState implements IdentifyDeviceState {
  factory IdentifyDeviceErrorState(String message) = _$IdentifyDeviceErrorState;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdentifyDeviceErrorStateCopyWith<IdentifyDeviceErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdentifyDeviceSuccessfulStateCopyWith<$Res> {
  factory $IdentifyDeviceSuccessfulStateCopyWith(
          IdentifyDeviceSuccessfulState value,
          $Res Function(IdentifyDeviceSuccessfulState) then) =
      _$IdentifyDeviceSuccessfulStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$IdentifyDeviceSuccessfulStateCopyWithImpl<$Res>
    extends _$IdentifyDeviceStateCopyWithImpl<$Res>
    implements $IdentifyDeviceSuccessfulStateCopyWith<$Res> {
  _$IdentifyDeviceSuccessfulStateCopyWithImpl(
      IdentifyDeviceSuccessfulState _value,
      $Res Function(IdentifyDeviceSuccessfulState) _then)
      : super(_value, (v) => _then(v as IdentifyDeviceSuccessfulState));

  @override
  IdentifyDeviceSuccessfulState get _value =>
      super._value as IdentifyDeviceSuccessfulState;
}

/// @nodoc
class _$IdentifyDeviceSuccessfulState implements IdentifyDeviceSuccessfulState {
  _$IdentifyDeviceSuccessfulState();

  @override
  String toString() {
    return 'IdentifyDeviceState.successful()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is IdentifyDeviceSuccessfulState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() successful,
  }) {
    return successful();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? successful,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdentifyDeviceLoadingState value) loading,
    required TResult Function(IdentifyDeviceErrorState value) error,
    required TResult Function(IdentifyDeviceSuccessfulState value) successful,
  }) {
    return successful(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdentifyDeviceLoadingState value)? loading,
    TResult Function(IdentifyDeviceErrorState value)? error,
    TResult Function(IdentifyDeviceSuccessfulState value)? successful,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful(this);
    }
    return orElse();
  }
}

abstract class IdentifyDeviceSuccessfulState implements IdentifyDeviceState {
  factory IdentifyDeviceSuccessfulState() = _$IdentifyDeviceSuccessfulState;
}
