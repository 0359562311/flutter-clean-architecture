import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/failures.dart';

abstract class LoginRepository{
  Future<Either<Failure,bool>> loginWithAccountAndPassword(String email, String password);
}