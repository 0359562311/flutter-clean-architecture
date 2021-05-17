import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/entities/custom_user.dart';

abstract class HomeRepository{
  Future<Either<Failure,CustomUser>> getUserInfor();
}