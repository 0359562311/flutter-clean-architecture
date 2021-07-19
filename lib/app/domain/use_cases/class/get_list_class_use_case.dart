import 'package:flutter_app_clean_architecture/app/domain/entities/class.dart';
import 'package:flutter_app_clean_architecture/app/domain/repositories/schedule_repository.dart';

class GetListClassUseCase{
  final ScheduleRepository repository;

  GetListClassUseCase(this.repository);

  Future<List<Class>> call() => repository.getListClass();
}