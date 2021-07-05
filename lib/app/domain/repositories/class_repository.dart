import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/class.dart';

abstract class ClassRepository {
  Future<Either<Failure, List<Class>>> getListClass();
}