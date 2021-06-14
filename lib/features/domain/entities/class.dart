import 'schedule.dart';

class Class {
  Class({
    required this.id,
    required this.maKyHoc,
    required this.maLopHoc,
    required this.tenLopHoc,
    required this.maMonHoc,
    required this.tenMonHoc,
    required this.lichHoc,
  });

  final String id;
  final String maKyHoc;
  final String maLopHoc;
  final String tenLopHoc;
  final String maMonHoc;
  final String tenMonHoc;
  final List<Schedule> lichHoc;

  factory Class.fromJson(Map<String, dynamic> json) => Class(
    id: json["_id"],
    maKyHoc: json["maKyHoc"],
    maLopHoc: json["maLopHoc"],
    tenLopHoc: json["tenLopHoc"],
    maMonHoc: json["maMonHoc"],
    tenMonHoc: json["tenMonHoc"],
    lichHoc: List<Schedule>.from(json["lichHoc"].map((x) => Schedule.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "maKyHoc": maKyHoc,
    "maLopHoc": maLopHoc,
    "tenLopHoc": tenLopHoc,
    "maMonHoc": maMonHoc,
    "tenMonHoc": tenMonHoc,
    "lichHoc": List<dynamic>.from(lichHoc.map((x) => x.toJson())),
  };
}


