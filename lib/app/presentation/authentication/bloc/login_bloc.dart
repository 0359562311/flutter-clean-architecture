import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/session.dart';
import 'package:flutter_app_clean_architecture/app/domain/use_cases/authentication/login_with_email_and_password.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LogInEvent,LoginState>{
  LoginBloc({required this.loginWithEmailAndPassword,}) : super(LogInInit());
  final LoginWithUserNameAndPasswordUseCase loginWithEmailAndPassword;

  @override
  Stream<LoginState> mapEventToState(LogInEvent event) async* {
    yield* event.map(
        logInWithUsernameAndPassWord: (param) async* {
          yield(LoginState.loadingState());
          try {
            var res = await loginWithEmailAndPassword(email: param.email,password: param.password);
            if(GetIt.instance.isRegistered<Session>())
              GetIt.instance.unregister<Session>();
            GetIt.instance.registerSingleton<Session>(res);
            yield LogInSuccess();
          } on DioError catch (e) {
            yield(LogInError(e.response?.data['detail']??"Unknown error"));
          }
        },
      )
    ;
  }
}