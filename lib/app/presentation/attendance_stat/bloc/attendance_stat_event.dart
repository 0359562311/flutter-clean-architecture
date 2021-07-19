import 'package:flutter_app_clean_architecture/app/domain/entities/class.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/schedule.dart';

abstract class AttendanceStatEvent{}

class AttendanceStatInitEvent extends AttendanceStatEvent{
  final int scheduleId;
  final int week;

  AttendanceStatInitEvent(this.scheduleId, this.week);
}