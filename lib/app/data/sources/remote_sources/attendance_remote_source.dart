import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/app/data/models/attendance_model.dart';
import 'package:get_it/get_it.dart';

class AttendanceRemoteSource {
  Future<void> createAttendance(int scheduleId, int week) async {
    var res = await GetIt.instance<Dio>().post("/curriculum/schedule/attendance/",data: {
      "scheduleId": scheduleId,
      "week": week
    });
    return res.data['data']['inResult'];
  }

  Future<List<AttendanceModel>> getAttendanceStat(int scheduleId, int week) async {
    var res = await GetIt.instance<Dio>().get("/curriculum/schedule/attendance/$scheduleId/$week");
    return (res.data as List).map((json) => AttendanceModel.fromJson(json)).toList();
  }
}