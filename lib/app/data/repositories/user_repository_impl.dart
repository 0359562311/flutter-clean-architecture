import 'package:flutter_app_clean_architecture/app/data/sources/remote_sources/user_remote_source.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/custom_user.dart';
import 'package:flutter_app_clean_architecture/app/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository{
  final UserRemoteSource remoteSource;

  UserRepositoryImpl({required this.remoteSource});

  @override
  Future<CustomUser> getUserInformation() {
    return remoteSource.getUserInfo();
  }

  @override
  Future<CustomUser> updateProfile(String address, String phoneNumber) {
    return remoteSource.updateProfile(address, phoneNumber);
  }

  @override
  Future<void> identifyDevice(String password, String deviceId, String deviceName) {
    return remoteSource.identifyDevice(password, deviceId, deviceName);
  }
}