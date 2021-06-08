import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/user_in_home.dart';
import 'package:flutter_app_clean_architecture/features/domain/repositories/home_repository.dart';

class GetUserInformation{
  final HomeRepository repository;

  GetUserInformation({required this.repository});

  Future<Either<Failure,UserInHome>> call(){
    return repository.getUserInfor();
  }
}