import 'package:flutter_app_clean_architecture/features/home/domain/entities/user_in_home.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';
@freezed
abstract class HomeState with _$HomeState{
  factory HomeState.getInforCompletely(UserInHome userInHome) = HomeComplete;
  factory HomeState.error(String message) = HomeErrorState;
  factory HomeState.loading() = HomeLoading;
}