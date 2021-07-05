import 'package:flutter_app_clean_architecture/app/domain/entities/custom_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';
@freezed
abstract class HomeState with _$HomeState{
  factory HomeState.getInforCompletely(CustomUser customUser) = HomeComplete;
  factory HomeState.error(String message) = HomeErrorState;
  factory HomeState.loading() = HomeLoading;
}