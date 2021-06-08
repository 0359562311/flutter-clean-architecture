import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/custom_user.dart';

abstract class UserRepository{
  Future<Either<Failure,CustomUser>> getUserInformation();
  Future<Either<Failure,CustomUser>> updateProfile(String address, String phoneNumber);
}