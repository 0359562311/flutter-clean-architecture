import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/entities/custom_user.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/repositories/login_repository.dart';

class LoginRepositoryImp implements LoginRepository{
  @override
  Future<Either<Failure, CustomUser>> facebookSignIn() {
    // TODO: implement facebookSignIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CustomUser>> googleSignIn() {
    // TODO: implement googleSignIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CustomUser>> loginWithAccountAndPassword(String email, String password) {
    // TODO: implement loginWithAccountAndPassword
    throw UnimplementedError();
  }

}
