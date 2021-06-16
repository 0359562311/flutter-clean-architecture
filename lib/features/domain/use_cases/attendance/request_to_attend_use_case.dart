import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/features/domain/repositories/attendance_repository.dart';

class RequestToAttendUseCase {
  final AttendanceRepository repository;

  RequestToAttendUseCase(this.repository);

  Future<Either<Failure,String>> call(String maLopHoc, String maMonHoc,
      String thoiGianBatDau, String thoiGianKetThuc)
  => repository.attendIn(maLopHoc,maMonHoc, thoiGianBatDau, thoiGianKetThuc);
}