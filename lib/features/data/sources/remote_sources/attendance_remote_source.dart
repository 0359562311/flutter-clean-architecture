import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/features/data/models/attendance_model.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/schedule.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/class.dart';
import 'package:get_it/get_it.dart';

class AttendanceRemoteSource {
  Future<String> attendIn(String maLopHoc, String maMonHoc, String thoiGianBatDau, String thoiGianKetThuc) async {
    var res = await GetIt.instance<Dio>().post("/attendance/register/me/in",data: {
      "otp": DateTime.now().toUtc().add(Duration(hours: 7)).millisecondsSinceEpoch,
      "maLopHoc": maLopHoc,
      "maMonHoc": maMonHoc,
      "studyFrom": thoiGianBatDau,
      "studyTo": thoiGianKetThuc
    });
    return res.data['data']['inResult'];
  }

  Future<List<AttendanceModel>> getAttendanceStat(Class cl, Schedule schedule, DateTime date) async {
    var res = await GetIt.instance<Dio>().get("/attendance/dashboard",queryParameters: {
      "maLopHoc": cl.maLopHoc,
      "studyFrom": schedule.thoiGianBatDau,
      "studyTo": schedule.thoiGianKetThuc,
      "date": date.day,
      "month": date.month-1,
      "year": date.year
    });
    return (res.data['data'] as List).map((json) => AttendanceModel.fromJson(json)).toList();
  }
}