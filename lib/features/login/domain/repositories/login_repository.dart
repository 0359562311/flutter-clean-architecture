import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/features/login/domain/entities/custom_user.dart';

abstract class LoginRepository{
  Future<Either<Failure,CustomUser>> loginWithAccountAndPassword(String email, String password);
}