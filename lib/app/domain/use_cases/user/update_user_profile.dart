import 'package:flutter_app_clean_architecture/app/domain/entities/custom_user.dart';
import 'package:flutter_app_clean_architecture/app/domain/repositories/user_repository.dart';

class UpdateUserProfileUseCase {
  final UserRepository repository;

  UpdateUserProfileUseCase({required this.repository});

  Future<CustomUser> call(String address, String phoneNumber) =>
      repository.updateProfile(address, phoneNumber);
}
