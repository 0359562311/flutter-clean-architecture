import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/core/platform/network_info.dart';
import 'package:flutter_app_clean_architecture/core/utils.dart';
import 'package:flutter_app_clean_architecture/features/data/sources/remote_sources/class_remote_source.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/class.dart';
import 'package:flutter_app_clean_architecture/features/domain/repositories/class_repository.dart';

class ClassRepositoryImpl extends ClassRepository {
  final ClassRemoteSource _remoteSource;

  ClassRepositoryImpl(this._remoteSource);

  @override
  Future<Either<Failure, List<Class>>> getListClass() async {
    if(!NetworkInfo.instance.isConnecting)
      return left(Failure.networkDisconnected("No internet connection."));
    try {
      var res = await _remoteSource.getListClass();
      return right(res);
    } on DioError catch (e){
      print(e);
      return left(Failure.serverSendsError(mapErrorCode(e.response?.data['errorCode'])));
    } on Exception catch (_) {
      // TODO
      return left(Failure.serverSendsError("Đã có lỗi xảy ra"));
    }
  }

}