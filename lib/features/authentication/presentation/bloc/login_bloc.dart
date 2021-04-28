import 'package:flutter_app_clean_architecture/features/authentication/domain/entities/custom_user.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/repositories/login_repository.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/usecases/login_with_email_and_password.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/usecases/login_with_facebook.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/usecases/login_with_google.dart';
import 'package:flutter_app_clean_architecture/features/authentication/presentation/bloc/login_event.dart';
import 'package:flutter_app_clean_architecture/features/authentication/presentation/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

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
                GetIt.instance<CustomUser>().uid = right.uid;
                yield(LogInSuccess(right));
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
                yield(LogInSuccess(right));
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
                yield(LogInSuccess(right));
              }
          );
        },
      )
    ;
  }

}