import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/custom_user.dart';
import 'package:flutter_app_clean_architecture/app/domain/repositories/user_repository.dart';

class GetUserInformationUseCase{
  final UserRepository repository;

  GetUserInformationUseCase({required this.repository});

  Future<CustomUser> call(){
    return repository.getUserInformation();
  }
}