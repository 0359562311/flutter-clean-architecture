import 'package:flutter_app_clean_architecture/app/domain/entities/class.dart';

abstract class ScheduleRepository {
  Future<List<Class>> getListClass();
}