import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_state.freezed.dart';

@freezed
abstract class SignUpState with _$SignUpState{
  factory SignUpState.error(String message) = SignUpErrorState;
  factory SignUpState.success() = SignUpSuccessfulState;
  factory SignUpState.loading() = SignUpLoadingState;
  factory SignUpState.init() = SignUpInitState;
}