import 'package:flutter_app_clean_architecture/app/domain/repositories/user_repository.dart';

class IdentifyDeviceUseCase {
  final UserRepository _repository;

  IdentifyDeviceUseCase(this._repository);

  Future<void> call(String password, String deviceId, String deviceName) => _repository.identifyDevice(password,deviceId,deviceName);
}