import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/core/utils/network_info.dart';
import 'package:flutter_app_clean_architecture/app/data/sources/remote_sources/class_remote_source.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/class.dart';
import 'package:flutter_app_clean_architecture/app/domain/repositories/class_repository.dart';

class ClassRepositoryImpl extends ClassRepository {
  final ClassRemoteSource _remoteSource;

  ClassRepositoryImpl(this._remoteSource);

  @override
  Future<Either<Failure, List<Class>>> getListClass() async {
    if(!NetworkInfo.instance.isConnecting)
      return left(Failure.networkDisconnected());
    try {
      var res = await _remoteSource.getListClass();
      return right(res);
    } on DioError catch (e){
      return left(Failure.serverSendsError(e));
    } on Exception catch (_) {
      // TODO
      return left(Failure.unknownError());
    }
  }

}