import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/entities/custom_user.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/repositories/login_repository.dart';

class LoginWithFacebook{
  final LoginRepository repository;

  LoginWithFacebook(this.repository);

  Future<Either<Failure, CustomUser>> call() {
    return repository.facebookSignIn();
  }
}