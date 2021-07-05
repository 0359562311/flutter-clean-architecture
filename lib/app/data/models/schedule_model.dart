import 'package:flutter_app_clean_architecture/app/domain/entities/schedule.dart';

class ScheduleModel extends Schedule {
  ScheduleModel({
    required List<int> tuanHoc,
    required String phongHoc,
    required int thuHoc,
    required int tietBatDau,
    required int tietKetThuc,
    required String thoiGianBatDau,
    required String thoiGianKetThuc,
  }) : super(
    tuanHoc: tuanHoc,
    phongHoc: phongHoc,
    thuHoc: thuHoc,
    tietBatDau: tietBatDau,
    tietKetThuc: tietKetThuc,
    thoiGianBatDau: thoiGianBatDau,
    thoiGianKetThuc: thoiGianKetThuc
  );

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
    tuanHoc: List<int>.from(json["tuanHoc"].map((x) => x)),
    phongHoc: json["phongHoc"],
    thuHoc: json["thuHoc"],
    tietBatDau: json["tietBatDau"],
    tietKetThuc: json["tietKetThuc"],
    thoiGianBatDau: json["thoiGianBatDau"],
    thoiGianKetThuc: json["thoiGianKetThuc"],
  );

}