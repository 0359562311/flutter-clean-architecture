import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/entities/custom_user.dart';

abstract class LoginRepository{
  Future<Either<Failure,CustomUser>> loginWithEmailAndPassword(String email, String password);
  Future<Either<Failure,CustomUser>> googleSignIn();
  Future<Either<Failure,CustomUser>> facebookSignIn();
}