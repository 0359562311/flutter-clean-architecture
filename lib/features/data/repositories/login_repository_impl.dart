import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/core/platform/network_info.dart';
import 'package:flutter_app_clean_architecture/core/utils.dart';
import 'package:flutter_app_clean_architecture/features/data/sources/remote_sources/login_remote_sources.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/token.dart';
import 'package:flutter_app_clean_architecture/features/domain/repositories/login_repository.dart';

/// can decide whether to use remote
/// or local data source to cache (if network is not connected)
class LoginRepositoryImpl extends LoginRepository{
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Token>> loginWithUsernameAndPassword(String email, String password) async {
    if(NetworkInfo.instance.isConnecting){
      try{
        return right(await remoteDataSource.loginWithEmailAndPassword(email, password));
      } on DioError catch (ex){
        return left(Failure.serverSendsError(mapErrorCode(ex.response?.data['errorCode'])));
      } on Exception catch(_){
        return left(Failure.serverSendsError("Đã có lỗi xảy ra"));
      }
    } else {
      return left(Failure.networkDisconnected("Please turn on network connection."));
    }
  }

}
