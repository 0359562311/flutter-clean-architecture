import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/custom_user.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/session.dart';
import 'package:flutter_app_clean_architecture/app/domain/repositories/login_repository.dart';

class LoginWithUserNameAndPasswordUseCase{
  final LoginRepository repository;

  LoginWithUserNameAndPasswordUseCase(this.repository);

  Future<Either<Failure, Session>> call({required String email, required String password}) {
    return repository.loginWithUsernameAndPassword(email, password);
  }
}