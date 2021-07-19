import 'package:flutter_app_clean_architecture/app/domain/entities/schedule.dart';

import 'subject.dart';

class Class {
  Class({
    required this.classId,
    required this.schedules,
    required this.subject,
    required this.className,
    required this.semester,
  });

  String classId;
  List<Schedule> schedules;
  Subject subject;
  String className;
  String semester;
}
