import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/core/platform/network_info.dart';
import 'package:flutter_app_clean_architecture/features/profile/data/models/profile_model.dart';
import 'package:flutter_app_clean_architecture/features/profile/data/source/profile_remote_source.dart';
import 'package:flutter_app_clean_architecture/features/profile/domain/entities/profile.dart';
import 'package:flutter_app_clean_architecture/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileAPISource apiSource;

  ProfileRepositoryImpl(this.apiSource);

  @override
  Future<Either<Failure, Profile>> getProfile() async {
    // TODO: implement getProfile
    if (NetworkInfo.instance.isConnecting) {
      try {
        return right(await apiSource.getUserProfile());
      } on DioError catch (e) {
        return left(Failure.serverSendsError(
            e.response?.data['message'] ?? "Loi khi thuc hien yeu cau."));
      } on Exception catch (e) {
        return left(Failure.serverSendsError(e.toString()));
      }
    } else {
      return left(
          Failure.networkDisconnected("Please turn on network connection."));
    }
  }

  @override
  Future<Either<Failure, Profile>> updateProfile(Profile profile) async {
    if (NetworkInfo.instance.isConnecting) {
      try {
        return right(
            await apiSource.updateUserProfile(profile as ProfileModel));
      } on DioError catch (e) {
        return left(Failure.serverSendsError(
            e.response?.data['message'] ?? "Loi khi thuc hien yeu cau."));
      } on Exception catch (e) {
        return left(Failure.serverSendsError(e.toString()));
      }
    } else {
      return left(
          Failure.networkDisconnected("Please turn on network connection."));
    }
  }
}
