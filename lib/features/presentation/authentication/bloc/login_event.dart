import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.freezed.dart';
@freezed
abstract class LogInEvent with _$LogInEvent{
  factory LogInEvent.logInWithUsernameAndPassWord(String email, String password) = LogInByEmailEvent;
}