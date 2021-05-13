// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'home_events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeEventTearOff {
  const _$HomeEventTearOff();

  HomeGetInfoEvent getUserInfor() {
    return HomeGetInfoEvent();
  }
}

/// @nodoc
const $HomeEvent = _$HomeEventTearOff();

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUserInfor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUserInfor,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeGetInfoEvent value) getUserInfor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeGetInfoEvent value)? getUserInfor,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res> implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  final HomeEvent _value;
  // ignore: unused_field
  final $Res Function(HomeEvent) _then;
}

/// @nodoc
abstract class $HomeGetInfoEventCopyWith<$Res> {
  factory $HomeGetInfoEventCopyWith(
          HomeGetInfoEvent value, $Res Function(HomeGetInfoEvent) then) =
      _$HomeGetInfoEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeGetInfoEventCopyWithImpl<$Res> extends _$HomeEventCopyWithImpl<$Res>
    implements $HomeGetInfoEventCopyWith<$Res> {
  _$HomeGetInfoEventCopyWithImpl(
      HomeGetInfoEvent _value, $Res Function(HomeGetInfoEvent) _then)
      : super(_value, (v) => _then(v as HomeGetInfoEvent));

  @override
  HomeGetInfoEvent get _value => super._value as HomeGetInfoEvent;
}

/// @nodoc
class _$HomeGetInfoEvent implements HomeGetInfoEvent {
  _$HomeGetInfoEvent();

  @override
  String toString() {
    return 'HomeEvent.getUserInfor()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is HomeGetInfoEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUserInfor,
  }) {
    return getUserInfor();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUserInfor,
    required TResult orElse(),
  }) {
    if (getUserInfor != null) {
      return getUserInfor();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeGetInfoEvent value) getUserInfor,
  }) {
    return getUserInfor(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeGetInfoEvent value)? getUserInfor,
    required TResult orElse(),
  }) {
    if (getUserInfor != null) {
      return getUserInfor(this);
    }
    return orElse();
  }
}

abstract class HomeGetInfoEvent implements HomeEvent {
  factory HomeGetInfoEvent() = _$HomeGetInfoEvent;
}
