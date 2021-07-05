import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/core/utils/network_info.dart';
import 'package:flutter_app_clean_architecture/features/data/sources/remote_sources/attendance_remote_source.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/schedule.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/class.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/attendance.dart';
import 'package:flutter_app_clean_architecture/features/domain/repositories/attendance_repository.dart';

class AttendanceRepositoryImpl extends AttendanceRepository{

  final AttendanceRemoteSource _remoteSource;

  AttendanceRepositoryImpl(this._remoteSource);

  @override
  Future<Either<Failure, String>> attendIn(String maLopHoc, String maMonHoc,
      String thoiGianBatDau, String thoiGianKetThuc) async {
    if(!NetworkInfo.instance.isConnecting)
      return left(Failure.networkDisconnected());
    try {
      var res = await _remoteSource.attendIn(maLopHoc, maMonHoc, thoiGianBatDau, thoiGianKetThuc);
      return right(res);
    } on DioError catch (e){
      print(e);
      return left(Failure.serverSendsError(e));
    } on Exception catch (_) {
      // TODO
      return left(Failure.unknownError());
    }
  }

  @override
  Future<Either<Failure, List<Attendance>>> getAttendanceStat(Class cl, Schedule schedule, DateTime date) async {
    if(!NetworkInfo.instance.isConnecting)
      return left(Failure.networkDisconnected());
    try {
      var res = await _remoteSource.getAttendanceStat(cl,schedule,date);
      return right(res);
    } on DioError catch (e){
      print(e);
      return left(Failure.serverSendsError(e));
    } on Exception catch (_) {
      // TODO
      return left(Failure.unknownError());
    }
  }
}