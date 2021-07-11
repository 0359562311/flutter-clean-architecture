import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/app/domain/repositories/user_repository.dart';

class IdentifyDeviceUseCase {
  final UserRepository _repository;

  IdentifyDeviceUseCase(this._repository);

  Future<void> call(String password) => _repository.identifyDevice(password);
}