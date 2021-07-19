import 'package:flutter_app_clean_architecture/app/domain/entities/attendance.dart';

abstract class AttendanceRepository {
  Future<void> createAttendance(int scheduleId, int week);
  Future<List<Attendance>> getAttendanceStat(int scheduleId, int week);
}