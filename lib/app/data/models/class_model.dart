import 'package:flutter_app_clean_architecture/app/data/models/schedule_model.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/class.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/schedule.dart';

class ClassModel extends Class {
  ClassModel(
      {
        required String id,
        required String maKyHoc,
        required String maLopHoc,
        required String tenLopHoc,
        required String maMonHoc,
        required String tenMonHoc,
        required List<Schedule> lichHoc
      }
      ) : super(
    id: id,
    maKyHoc: maKyHoc,
    maLopHoc: maLopHoc,
    tenLopHoc: tenLopHoc,
    maMonHoc: maMonHoc,
    tenMonHoc: tenMonHoc,
    lichHoc: lichHoc
  );

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
    id: json["_id"],
    maKyHoc: json["maKyHoc"],
    maLopHoc: json["maLopHoc"],
    tenLopHoc: json["tenLopHoc"],
    maMonHoc: json["maMonHoc"],
    tenMonHoc: json["tenMonHoc"],
    lichHoc: List<Schedule>.from(json["lichHoc"].map((x) => ScheduleModel.fromJson(x))),
  );

}