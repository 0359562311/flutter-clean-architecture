import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/attendance.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/class.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/schedule.dart';

abstract class AttendanceRepository {
  Future<Either<Failure,String>> attendIn(String maLopHoc, String maMonHoc,
      String thoiGianBatDau, String thoiGianKetThuc);
  Future<Either<Failure,List<Attendance>>> getAttendanceStat(Class cl, Schedule schedule, DateTime date);
}