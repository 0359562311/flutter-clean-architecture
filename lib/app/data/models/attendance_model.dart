import 'package:flutter_app_clean_architecture/app/domain/entities/attendance.dart';

class AttendanceModel extends Attendance {
  AttendanceModel(String maSV, DateTime? attendanceAt) : super(maSV, attendanceAt);

  factory AttendanceModel.fromJson(Map<String,dynamic> json) {
    return AttendanceModel(
      json['student']['email'],
      json['attendanceAt'] == null ? null : DateTime.parse(json['attendanceAt'])
    );
  }
}