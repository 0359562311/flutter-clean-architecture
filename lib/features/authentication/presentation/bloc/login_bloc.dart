import 'package:flutter_app_clean_architecture/features/authentication/domain/repositories/login_repository.dart';
import 'package:flutter_app_clean_architecture/features/authentication/presentation/bloc/login_event.dart';
import 'package:flutter_app_clean_architecture/features/authentication/presentation/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LogInEvent,LoginState>{
  LoginBloc(LoginState initialState, this.repository) : super(LogInInit());
  LoginRepository repository;

  @override
  Stream<LoginState> mapEventToState(LogInEvent event) async* {
    yield* event.map(
        logInWithEmailAndPassWord: (param) async* {
          yield(LoginState.loadingState());
          var res = await repository.loginWithEmailAndPassword(param.email, param.password);
          yield* res.fold(
              (left) async*{
                yield(LogInError(left.message));
              },
              (right) async*{
                yield(LogInSuccess(right));
              }
          );
        },
        googleSignIn: (_) async* {
          yield(LoginState.loadingState());
          var res = await repository.googleSignIn();
          yield* res.fold(
                  (left) async*{
                yield(LogInError(left.message));
              },
                  (right) async*{
                yield(LogInSuccess(right));
              }
          );
        },
        facebookSignIn: (_) async* {
          yield(LoginState.loadingState());
          var res = await repository.facebookSignIn();
          yield* res.fold(
                  (left) async*{
                yield(LogInError(left.message));
              },
                  (right) async*{
                yield(LogInSuccess(right));
              }
          );
        },
      )
    ;
  }

}