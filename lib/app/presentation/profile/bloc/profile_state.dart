import 'package:flutter_app_clean_architecture/app/domain/entities/custom_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';
@freezed
class ProfileState with _$ProfileState{
  factory ProfileState.loading() = ProfileLoadingState;
  factory ProfileState.complete(CustomUser user) = ProfileCompleteState;
  factory ProfileState.error(String message) = ProfileErrorState;
}