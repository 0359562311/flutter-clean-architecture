import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';

abstract class AttendanceRepository {
  Future<Either<Failure,void>> attendIn(String maLopHoc, String maMonHoc,
      String thoiGianBatDau, String thoiGianKetThuc);
}