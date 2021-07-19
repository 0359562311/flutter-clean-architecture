import 'package:flutter_app_clean_architecture/app/domain/entities/attendance.dart';
import 'package:flutter_app_clean_architecture/app/domain/repositories/attendance_repository.dart';

class GetAttendanceStatUseCase {
  final AttendanceRepository repository;

  GetAttendanceStatUseCase(this.repository);

  Future<List<Attendance>> call(int scheduleId, int week)
    => repository.getAttendanceStat(scheduleId,week);
}