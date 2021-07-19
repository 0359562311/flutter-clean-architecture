import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/app/data/models/class_model.dart';
import 'package:get_it/get_it.dart';


class ClassRemoteSource {
  Future<List<ClassModel>> getListClass() async {
    var res = await GetIt.instance<Dio>().
      get("/curriculum/schedule/20211");
    return (res.data as List).map((e) => ClassModel.fromJson(e)).toList();
  }
}