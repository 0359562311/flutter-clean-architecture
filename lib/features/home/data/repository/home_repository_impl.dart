import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/core/platform/network_info.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/entities/custom_user.dart';
import 'package:flutter_app_clean_architecture/features/home/data/source/home_remote_source.dart';
import 'package:flutter_app_clean_architecture/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository{
  final HomeRemoteSource remoteSource;

  HomeRepositoryImpl({required this.remoteSource});

  @override
  Future<Either<Failure, CustomUser>> getUserInfor() async {
    // TODO: implement getUserInfor
    if(!NetworkInfo.instance.isConnecting)
      return left(Failure.networkDisconnected("No internet connection."));
    try {
      var user = await remoteSource.getUserInfo();
      return right(user);
    } on DioError catch (e){
      print(e);
      return left(Failure.serverSendsError(e.response?.data['message']??"message from api"));
    } on Exception catch (e) {
      // TODO
      return left(Failure.serverSendsError(e.toString()));
    }
  }

}