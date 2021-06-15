import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/features/data/models/class_model.dart';
import 'package:get_it/get_it.dart';


class ClassRemoteSource {
  Future<List<ClassModel>> getListClass() async {
    var res = await GetIt.instance<Dio>().
      get("/sotay/lop/giang-vien/search/"
        "available-class/current?maKyHoc=20202");
    return (res.data as List).map((e) => ClassModel.fromJson(e)).toList();
  }
}