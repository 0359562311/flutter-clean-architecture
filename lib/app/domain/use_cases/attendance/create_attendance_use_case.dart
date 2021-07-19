import 'package:flutter_app_clean_architecture/app/domain/repositories/attendance_repository.dart';

class CreateAttendanceUseCase {
  final AttendanceRepository repository;

  CreateAttendanceUseCase(this.repository);

  Future<void> call(int scheduleId, int week)
  => repository.createAttendance(scheduleId, week);
}