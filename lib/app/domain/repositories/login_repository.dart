import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/session.dart';

abstract class LoginRepository{
  Future<Either<Failure,Session>> loginWithUsernameAndPassword(String email, String password);
}