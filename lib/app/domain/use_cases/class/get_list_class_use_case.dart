import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/class.dart';
import 'package:flutter_app_clean_architecture/app/domain/repositories/class_repository.dart';

class GetListClassUseCase{
  final ClassRepository repository;

  GetListClassUseCase(this.repository);

  Future<Either<Failure, List<Class>>> call() => repository.getListClass();
}