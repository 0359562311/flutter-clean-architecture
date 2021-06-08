import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/profile.dart';
import 'package:flutter_app_clean_architecture/features/domain/repositories/profile_repository.dart';

class UpdateUserProfile{
  final ProfileRepository repository;

  UpdateUserProfile({required this.repository});

  Future<Either<Failure,Profile>> call(Profile profile) => repository.updateProfile(profile);
}