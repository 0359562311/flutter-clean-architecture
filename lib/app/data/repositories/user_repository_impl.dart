import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/core/utils/network_info.dart';
import 'package:flutter_app_clean_architecture/core/utils.dart';
import 'package:flutter_app_clean_architecture/app/data/models/custom_user_model.dart';
import 'package:flutter_app_clean_architecture/app/data/sources/remote_sources/user_remote_source.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/custom_user.dart';
import 'package:flutter_app_clean_architecture/app/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository{
  final UserRemoteSource remoteSource;

  UserRepositoryImpl({required this.remoteSource});

  @override
  Future<Either<Failure, CustomUserModel>> getUserInformation() async {
    // TODO: implement getUserInfor
    if(!NetworkInfo.instance.isConnecting)
      return left(Failure.networkDisconnected());
    try {
      var user = await remoteSource.getUserInfo();
      return right(user);
    } on DioError catch (e){
      print(e);
      return left(Failure.serverSendsError(e));
    } on Exception catch (_) {
      // TODO
      return left(Failure.unknownError());
    }
  }

  @override
  Future<Either<Failure, CustomUser>> updateProfile(String address, String phoneNumber) async {
    if(!NetworkInfo.instance.isConnecting)
      return left(Failure.networkDisconnected());
    try {
      var user = await remoteSource.updateProfile(address, phoneNumber);
      return right(user);
    } on DioError catch (e){
      print(e);
      return left(Failure.serverSendsError(e));
    } on Exception catch (_) {
      // TODO
      return left(Failure.unknownError());
    }
  }

  @override
  Future<Either<Failure,void>> identifyDevice(String password) async {
    if(!NetworkInfo.instance.isConnecting)
      return left(Failure.networkDisconnected());
    try {
      var user = await remoteSource.identifyDevice(password);
      return right(user);
    } on DioError catch (e){
      print(e);
      return left(Failure.serverSendsError(e));
    } on Exception catch (_) {
      // TODO
      return left(Failure.unknownError());
    }
  }

}