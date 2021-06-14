import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/class.dart';
import 'package:flutter_app_clean_architecture/features/domain/repositories/class_repository.dart';

class GetListClassUseCase{
  final ClassRepository repository;

  GetListClassUseCase(this.repository);

  Future<Either<Failure, Class>> call() => repository.
}