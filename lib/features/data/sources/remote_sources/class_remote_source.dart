import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/class.dart';
import 'package:get_it/get_it.dart';

abstract class ClassRemoteSource {
  Future<List<Class>> getListClass();
}

class ClassRemoteSourceImpl extends ClassRemoteSource {
  @override
  Future<List<Class>> getListClass() async {
    var res = await GetIt.instance<Dio>().
      get("/sotay/lop/giang-vien/search/"
        "available-class/current?maKyHoc=20202");
    return (res.data as List).map((e) => Class.fromJson(e)).toList();
  }

}