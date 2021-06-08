import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/custom_user.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/token.dart';

abstract class LoginRepository{
  Future<Either<Failure,Token>> loginWithEmailAndPassword(String email, String password);
  Future<Either<Failure,CustomUser>> googleSignIn();
  Future<Either<Failure,CustomUser>> facebookSignIn();
}