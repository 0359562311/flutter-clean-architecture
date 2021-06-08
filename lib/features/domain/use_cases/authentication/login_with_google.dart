import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/custom_user.dart';
import 'package:flutter_app_clean_architecture/features/domain/repositories/login_repository.dart';

class LoginWithGoogle{
  final LoginRepository repository;

  LoginWithGoogle(this.repository);

  Future<Either<Failure, CustomUser>> call() {
    return repository.googleSignIn();
  }
}