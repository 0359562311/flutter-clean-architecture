import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/core/platform/network_info.dart';
import 'package:flutter_app_clean_architecture/core/utils.dart';
import 'package:flutter_app_clean_architecture/features/data/sources/remote_sources/attendance_remote_source.dart';
import 'package:flutter_app_clean_architecture/features/domain/repositories/attendance_repository.dart';

class AttendanceRepositoryImpl extends AttendanceRepository{

  final AttendanceRemoteSource _remoteSource;

  AttendanceRepositoryImpl(this._remoteSource);

  @override
  Future<Either<Failure, void>> attendIn(String maLopHoc, String maMonHoc,
      String thoiGianBatDau, String thoiGianKetThuc) async {
    if(!NetworkInfo.instance.isConnecting)
      return left(Failure.networkDisconnected("No internet connection."));
    try {
      await _remoteSource.attendIn(maLopHoc, maMonHoc, thoiGianBatDau, thoiGianKetThuc);
      return right(null);
    } on DioError catch (e){
      print(e);
      return left(Failure.serverSendsError(mapErrorCode(e.response?.data['errorCode'])));
    } on Exception catch (_) {
      // TODO
      return left(Failure.serverSendsError("Đã có lỗi xảy ra"));
    }
  }
}