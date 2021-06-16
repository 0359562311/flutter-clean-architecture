import 'package:dio/dio.dart';
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
}