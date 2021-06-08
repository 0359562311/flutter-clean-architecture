import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.freezed.dart';
@freezed
class ProfileEvent with _$ProfileEvent{
  factory ProfileEvent.getProfile() = GetProfileEvent;
  factory ProfileEvent.updateProfile(String address, String phoneNumber) = UpdateProfileEvent;
}