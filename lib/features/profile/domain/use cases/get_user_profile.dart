import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/features/profile/domain/entities/profile.dart';
import 'package:flutter_app_clean_architecture/features/profile/domain/repositories/profile_repository.dart';

class GetUserProfile{
  final ProfileRepository repository;

  GetUserProfile({required this.repository});

  Future<Either<Failure,Profile>> call() => repository.getProfile();
}