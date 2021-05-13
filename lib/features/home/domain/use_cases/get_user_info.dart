import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/entities/custom_user.dart';
import 'package:flutter_app_clean_architecture/features/home/domain/repository/home_repository.dart';

class GetUserInformation{
  final HomeRepository repository;

  GetUserInformation({required this.repository});

  Future<Either<Failure,CustomUser>> call(){
    return repository.getUserInfor();
  }
}