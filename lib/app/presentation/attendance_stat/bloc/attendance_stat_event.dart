import 'package:flutter_app_clean_architecture/app/domain/entities/class.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/schedule.dart';

abstract class AttendanceStatEvent{}

class AttendanceStatInitEvent extends AttendanceStatEvent{
  final Class cl;
  final Schedule schedule;
  final DateTime date;

  AttendanceStatInitEvent(this.cl, this.schedule, this.date);
}