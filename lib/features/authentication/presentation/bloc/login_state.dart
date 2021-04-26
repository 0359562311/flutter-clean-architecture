import 'package:flutter_app_clean_architecture/features/authentication/domain/entities/custom_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';
@freezed
abstract class LoginState with _$LoginState{
  factory LoginState.init() = LogInInit;
  factory LoginState.loadingState() = LoadingState;
  factory LoginState.logInSuccessful(CustomUser user) = LogInSuccess;
  factory LoginState.getError(String message) = LogInError;
}