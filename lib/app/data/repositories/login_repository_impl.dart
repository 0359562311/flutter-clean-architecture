import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/core/utils/network_info.dart';
import 'package:flutter_app_clean_architecture/core/utils.dart';
import 'package:flutter_app_clean_architecture/app/data/sources/remote_sources/login_remote_sources.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/session.dart';
import 'package:flutter_app_clean_architecture/app/domain/repositories/login_repository.dart';

/// can decide whether to use remote
/// or local data source to cache (if network is not connected)
class LoginRepositoryImpl extends LoginRepository{
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Session>> loginWithUsernameAndPassword(String email, String password) async {
    if(NetworkInfo.instance.isConnecting){
      try{
        return right(await remoteDataSource.loginWithEmailAndPassword(email, password));
      } on DioError catch (e){
        return left(Failure.serverSendsError(e));
      } on Exception catch(_){
        return left(Failure.unknownError());
      }
    } else {
      return left(Failure.networkDisconnected());
    }
  }

}
