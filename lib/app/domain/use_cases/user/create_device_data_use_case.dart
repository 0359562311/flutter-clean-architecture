import 'package:flutter_app_clean_architecture/app/domain/entities/device_data.dart';
import 'package:flutter_app_clean_architecture/app/domain/repositories/user_repository.dart';

class CreateDeviceDataUseCase {
  final UserRepository userRepository;

  CreateDeviceDataUseCase(this.userRepository);

  Future<DeviceData> call(String deviceId, String deviceName) =>
      userRepository.createDeviceData(deviceId, deviceName);
}