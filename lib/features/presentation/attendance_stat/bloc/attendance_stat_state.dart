import 'package:flutter_app_clean_architecture/features/domain/entities/attendance.dart';

abstract class AttendanceStatState {}

class AttendanceLoadingState extends AttendanceStatState {}

class AttendanceErrorState extends AttendanceStatState {
  final String message;

  AttendanceErrorState(this.message);
}

class AttendanceCompleteState extends AttendanceStatState {
  final List<Attendance> attendances;
  AttendanceCompleteState(this.attendances);
}