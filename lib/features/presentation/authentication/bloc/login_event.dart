import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.freezed.dart';
@freezed
abstract class LogInEvent with _$LogInEvent{
  factory LogInEvent.logInWithEmailAndPassWord(String email, String password) = LogInByEmailEvent;
  factory LogInEvent.googleSignIn() = LogInByGoogleEvent;
  factory LogInEvent.facebookSignIn() = LogInByFacebookEvent;
}