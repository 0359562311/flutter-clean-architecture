import 'package:flutter_app_clean_architecture/features/domain/entities/attendance.dart';

class AttendanceModel extends Attendance {
  AttendanceModel(String maSV, DateTime? registerAt) : super(maSV, registerAt);

  factory AttendanceModel.fromJson(Map<String,dynamic> json) {
    return AttendanceModel(
      json['maSv'],
      json['registerAt'] == null ? null : DateTime.parse(json['registerAt']).add(Duration(hours: 7))
    );
  }
}