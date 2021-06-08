import 'package:flutter_app_clean_architecture/features/domain/entities/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';
@freezed
class ProfileState with _$ProfileState{
  factory ProfileState.loading() = ProfileLoadingState;
  factory ProfileState.complete(Profile profile) = ProfileCompleteState;
  factory ProfileState.error(String message) = ProfileErrorState;
}