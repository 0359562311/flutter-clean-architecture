import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/token.dart';

abstract class LoginRepository{
  Future<Either<Failure,Token>> loginWithUsernameAndPassword(String email, String password);
}