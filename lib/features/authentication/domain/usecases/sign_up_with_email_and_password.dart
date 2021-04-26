import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/repositories/sign_up_repository.dart';

class SignUpWithEmailAndPassword {
  final SignUpRepository repository;

  SignUpWithEmailAndPassword(this.repository);

  Future<Either<Failure,void>> call(String email, String password){
    return repository.signUpWithEmailAndPassword(email, password);
  }
}