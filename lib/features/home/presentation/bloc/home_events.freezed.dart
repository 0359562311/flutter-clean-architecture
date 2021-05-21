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

  HomeInitEvent init() {
    return HomeInitEvent();
  }
}

/// @nodoc
const $HomeEvent = _$HomeEventTearOff();

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUserInfor,
    required TResult Function() init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUserInfor,
    TResult Function()? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeGetInfoEvent value) getUserInfor,
    required TResult Function(HomeInitEvent value) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeGetInfoEvent value)? getUserInfor,
    TResult Function(HomeInitEvent value)? init,
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
    required TResult Function() init,
  }) {
    return getUserInfor();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUserInfor,
    TResult Function()? init,
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
    required TResult Function(HomeInitEvent value) init,
  }) {
    return getUserInfor(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeGetInfoEvent value)? getUserInfor,
    TResult Function(HomeInitEvent value)? init,
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

/// @nodoc
abstract class $HomeInitEventCopyWith<$Res> {
  factory $HomeInitEventCopyWith(
          HomeInitEvent value, $Res Function(HomeInitEvent) then) =
      _$HomeInitEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeInitEventCopyWithImpl<$Res> extends _$HomeEventCopyWithImpl<$Res>
    implements $HomeInitEventCopyWith<$Res> {
  _$HomeInitEventCopyWithImpl(
      HomeInitEvent _value, $Res Function(HomeInitEvent) _then)
      : super(_value, (v) => _then(v as HomeInitEvent));

  @override
  HomeInitEvent get _value => super._value as HomeInitEvent;
}

/// @nodoc
class _$HomeInitEvent implements HomeInitEvent {
  _$HomeInitEvent();

  @override
  String toString() {
    return 'HomeEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is HomeInitEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUserInfor,
    required TResult Function() init,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUserInfor,
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
    required TResult Function(HomeGetInfoEvent value) getUserInfor,
    required TResult Function(HomeInitEvent value) init,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeGetInfoEvent value)? getUserInfor,
    TResult Function(HomeInitEvent value)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class HomeInitEvent implements HomeEvent {
  factory HomeInitEvent() = _$HomeInitEvent;
}
