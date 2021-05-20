import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/features/home/domain/entities/user_in_home.dart';

abstract class HomeRepository{
  Future<Either<Failure,UserInHome>> getUserInfor();
}