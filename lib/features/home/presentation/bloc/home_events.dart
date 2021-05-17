import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_events.freezed.dart';
@freezed
abstract class HomeEvent with _$HomeEvent{
  factory HomeEvent.getUserInfor() = HomeGetInfoEvent;
}