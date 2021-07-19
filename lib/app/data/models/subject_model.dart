import 'package:flutter_app_clean_architecture/app/domain/entities/subject.dart';

class SubjectModel extends Subject {
  SubjectModel({
    required String subjectId,
    required String subjectName,
    required int coefficient,
  }): super(
    subjectId: subjectId,
    subjectName: subjectName,
    coefficient: coefficient
  );
  factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
    subjectId: json["subjectId"],
    subjectName: json["subjectName"],
    coefficient: json["coefficient"],
  );
}