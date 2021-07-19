import 'package:flutter_app_clean_architecture/app/data/models/custom_user_model.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/custom_user.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/schedule.dart';

class ScheduleModel extends Schedule {
  ScheduleModel({
    required this.id,
    required this.lecturer,
    required this.weeks,
    required this.classroom,
    required this.startAt,
    required this.endAt,
    required this.dayOfWeek,
  }):super(
    id: id,
    lecturer: lecturer,
    weeks: weeks,
    classroom: classroom,
    startAt: startAt,
    endAt: endAt,
    dayOfWeek: dayOfWeek,
  );

  int id;
  CustomUser lecturer;
  List<int> weeks;
  String classroom;
  String startAt;
  String endAt;
  int dayOfWeek;

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
    id: json["id"],
    lecturer: CustomUserModel.fromJsonListSchedule(json["lecturer"]),
    weeks: List<int>.from(json["weeks"].map((x) => x)),
    classroom: json["classroom"],
    startAt: json["startAt"],
    endAt: json["endAt"],
    dayOfWeek: json["dayOfWeek"],
  );
}