import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/core/platform/network_info.dart';
import 'package:flutter_app_clean_architecture/core/utils.dart';
import 'package:flutter_app_clean_architecture/features/data/models/custom_user_model.dart';
import 'package:flutter_app_clean_architecture/features/data/sources/remote_sources/user_remote_source.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/custom_user.dart';
import 'package:flutter_app_clean_architecture/features/domain/repositories/user_repository.dart';

class HomeRepositoryImpl extends UserRepository{
  final UserRemoteSource remoteSource;

  HomeRepositoryImpl({required this.remoteSource});

  @override
  Future<Either<Failure, CustomUserModel>> getUserInformation() async {
    // TODO: implement getUserInfor
    if(!NetworkInfo.instance.isConnecting)
      return left(Failure.networkDisconnected("No internet connection."));
    try {
      var user = await remoteSource.getUserInfo();
      return right(user);
    } on DioError catch (e){
      print(e);
      return left(Failure.serverSendsError(mapErrorCode(e.response?.data['errorCode'])));
    } on Exception catch (_) {
      // TODO
      return left(Failure.serverSendsError("Đã có lỗi xảy ra"));
    }
  }

  @override
  Future<Either<Failure, CustomUser>> updateProfile(String address, String phoneNumber) async {
    if(!NetworkInfo.instance.isConnecting)
      return left(Failure.networkDisconnected("No internet connection."));
    try {
      var user = await remoteSource.updateProfile(address, phoneNumber);
      return right(user);
    } on DioError catch (e){
      print(e);
      return left(Failure.serverSendsError(mapErrorCode(e.response?.data['errorCode'])));
    } on Exception catch (_) {
      // TODO
      return left(Failure.serverSendsError("Đã có lỗi xảy ra"));
    }
  }

}