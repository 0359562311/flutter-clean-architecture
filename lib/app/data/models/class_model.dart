import 'package:flutter_app_clean_architecture/app/data/models/schedule_model.dart';
import 'package:flutter_app_clean_architecture/app/data/models/subject_model.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/class.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/schedule.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/subject.dart';

class ClassModel extends Class {
  ClassModel({
    required String classId,
    required List<Schedule> schedules,
    required Subject subject,
    required String className,
    required String semester,
  }): super(
    classId: classId,
    schedules: schedules,
    subject: subject,
    className: className,
    semester: semester,
  );

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
    classId: json["classId"],
    schedules: List<Schedule>.from(json["schedule"].map((x) => ScheduleModel.fromJson(x))),
    subject: SubjectModel.fromJson(json["subject"]),
    className: json["className"],
    semester: json["semester"],
  );
}
