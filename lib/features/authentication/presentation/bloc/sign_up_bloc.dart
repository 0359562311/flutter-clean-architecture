import 'package:flutter_app_clean_architecture/features/authentication/domain/repositories/sign_up_repository.dart';
import 'package:flutter_app_clean_architecture/features/authentication/presentation/bloc/sign_up_event.dart';
import 'package:flutter_app_clean_architecture/features/authentication/presentation/bloc/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent,SignUpState>{
  final SignUpRepository repository;
  SignUpBloc(this.repository) : super(SignUpState.init());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    yield* event.map(signUp: (ev) async*{
      yield(SignUpState.loading());
      var res = await repository.signUpWithEmailAndPassword(ev.email, ev.password);
      yield* res.fold(
              (l) async* {
                yield (SignUpState.error(l.message));
              },
              (r) async*{
                yield (SignUpState.success());
              }
      );
    });
  }

}