import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_event.freezed.dart';
@freezed
abstract class SignUpEvent with _$SignUpEvent{
  factory SignUpEvent.signUp(String email, String password) = SignUpWithEmaiAndPasswordEvent;
}