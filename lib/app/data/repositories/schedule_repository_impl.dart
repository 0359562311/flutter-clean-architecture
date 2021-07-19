import 'package:flutter_app_clean_architecture/app/domain/repositories/schedule_repository.dart';
import 'package:flutter_app_clean_architecture/app/data/sources/remote_sources/class_remote_source.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/class.dart';

class ScheduleRepositoryImpl extends ScheduleRepository {
  final ClassRemoteSource _remoteSource;

  ScheduleRepositoryImpl(this._remoteSource);

  @override
  Future<List<Class>> getListClass() {
    return _remoteSource.getListClass();
  }

}