
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';
@freezed
abstract class LoginState with _$LoginState{
  factory LoginState.init() = LogInInit;
  factory LoginState.loadingState() = LoadingState;
  factory LoginState.logInSuccessful() = LogInSuccess;
  factory LoginState.getError(String message) = LogInError;
}