import 'package:flutter_app_clean_architecture/app/domain/entities/custom_user.dart';

class Schedule {
  Schedule({
    required this.id,
    required this.lecturer,
    required this.weeks,
    required this.classroom,
    required this.startAt,
    required this.endAt,
    required this.dayOfWeek,
  });

  int id;
  CustomUser lecturer;
  List<int> weeks;
  String classroom;
  String startAt;
  String endAt;
  int dayOfWeek;
}