import 'package:flutter_app_clean_architecture/features/profile/domain/entities/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.freezed.dart';
@freezed
class ProfileEvent with _$ProfileEvent{
  factory ProfileEvent.getProfile() = GetProfileEvent;
  factory ProfileEvent.updateProfile(Profile profile) = UpdateProfileEvent;
}