import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/device_data.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/custom_user.dart';

abstract class UserRepository{
  Future<CustomUser> getUserInformation();
  Future<CustomUser> updateProfile(String address, String phoneNumber);
  Future<Either<Failure,void>> identifyDevice(String password);
  Future<DeviceData> createDeviceData(String deviceId, String deviceName);
}