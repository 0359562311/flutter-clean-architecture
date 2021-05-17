import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';
@freezed
abstract class HomeState with _$HomeState{
  factory HomeState.init() = HomeInitState;
  factory HomeState.getInforCompletely() = HomeComplete;
  factory HomeState.error(String message) = HomeErrorState;
  factory HomeState.loading() = HomeLoading;
}