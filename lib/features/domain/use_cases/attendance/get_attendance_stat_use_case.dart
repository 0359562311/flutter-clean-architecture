import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/attendance.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/class.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/schedule.dart';
import 'package:flutter_app_clean_architecture/features/domain/repositories/attendance_repository.dart';

class GetAttendanceStatUseCase {
  final AttendanceRepository repository;

  GetAttendanceStatUseCase(this.repository);

  Future<Either<Failure,List<Attendance>>> call(Class cl, Schedule schedule, DateTime date) 
    => repository.getAttendanceStat(cl, schedule, date);
}