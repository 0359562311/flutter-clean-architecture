import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/features/login/domain/entities/custom_user.dart';
import 'package:flutter_app_clean_architecture/features/login/domain/repositories/login_repository.dart';

class LoginWithEmailAndPassword{
  final LoginRepository repository;

  LoginWithEmailAndPassword(this.repository);

  Future<Either<Failure, CustomUser>> call({required String email, required String password}) {
    return repository.loginWithAccountAndPassword(email, password);
  }
}