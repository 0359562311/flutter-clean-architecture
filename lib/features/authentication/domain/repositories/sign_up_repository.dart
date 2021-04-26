import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';

abstract class SignUpRepository{
  Future<Either<Failure,void>> signUpWithEmailAndPassword(String email, String password);
}