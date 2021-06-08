import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/features/domain/use_cases/authentication/login_with_email_and_password.dart';
import 'package:flutter_app_clean_architecture/features/domain/use_cases/authentication/login_with_facebook.dart';
import 'package:flutter_app_clean_architecture/features/domain/use_cases/authentication/login_with_google.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LogInEvent,LoginState>{
  LoginBloc({required this.loginWithEmailAndPassword,
        required this.loginWithGoogle, required this.loginWithFacebook}) : super(LogInInit());
  final LoginWithEmailAndPassword loginWithEmailAndPassword;
  final LoginWithGoogle loginWithGoogle;
  final LoginWithFacebook loginWithFacebook;

  @override
  Stream<LoginState> mapEventToState(LogInEvent event) async* {
    yield* event.map(
        logInWithEmailAndPassWord: (param) async* {
          yield(LoginState.loadingState());
          var res = await loginWithEmailAndPassword(email: param.email,password: param.password);
          yield* res.fold(
              (left) async*{
                yield(LogInError(left.message));
              },
              (right) async*{
                GetIt.instance<Dio>().interceptors.add(InterceptorsWrapper(
                  onRequest: (option, handler){
                    option.headers['Authorization'] = 'Bearer ${right.token}';
                    return handler.next(option);
                  }
                ));
                yield LogInSuccess();
              }
          );
        },
        googleSignIn: (_) async* {
          yield(LoginState.loadingState());
          var res = await loginWithGoogle();
          yield* res.fold(
                  (left) async*{
                yield(LogInError(left.message));
              },
                  (right) async*{
                yield(LogInSuccess());
              }
          );
        },
        facebookSignIn: (_) async* {
          yield(LoginState.loadingState());
          var res = await loginWithFacebook();
          yield* res.fold(
                  (left) async*{
                yield(LogInError(left.message));
              },
                  (right) async*{
                yield(LogInSuccess());
              }
          );
        },
      )
    ;
  }
}