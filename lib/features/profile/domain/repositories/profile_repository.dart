import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/features/profile/domain/entities/profile.dart';

abstract class ProfileRepository{
  Future<Either<Failure,Profile>> getProfile();
  Future<Either<Failure,Profile>> updateProfile(Profile profile);
}