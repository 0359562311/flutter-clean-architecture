import 'package:flutter_app_clean_architecture/app/data/sources/remote_sources/attendance_remote_source.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/attendance.dart';
import 'package:flutter_app_clean_architecture/app/domain/repositories/attendance_repository.dart';

class AttendanceRepositoryImpl with AttendanceRepository{

  final AttendanceRemoteSource _remoteSource;

  AttendanceRepositoryImpl(this._remoteSource);

  @override
  Future<List<Attendance>> getAttendanceStat(int scheduleId, int week) {
    return _remoteSource.getAttendanceStat(scheduleId, week);
  }

  @override
  Future<void> createAttendance(int scheduleId, int week) {
    return _remoteSource.createAttendance(scheduleId, week);
  }
}