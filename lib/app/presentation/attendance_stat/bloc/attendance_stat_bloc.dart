import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/attendance.dart';
import 'package:flutter_app_clean_architecture/app/domain/use_cases/attendance/get_attendance_stat_use_case.dart';
import 'package:flutter_app_clean_architecture/app/presentation/attendance_stat/bloc/attendance_stat_event.dart';
import 'package:flutter_app_clean_architecture/app/presentation/attendance_stat/bloc/attendance_stat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendanceStatBloc extends Bloc<AttendanceStatEvent,AttendanceStatState>{
  AttendanceStatBloc(this._useCase) : super(AttendanceLoadingState());

  final GetAttendanceStatUseCase _useCase;

  @override
  Stream<AttendanceStatState> mapEventToState(AttendanceStatEvent event) async* {
    if(event is AttendanceStatInitEvent) {
      try {
        final res = await _useCase(event.scheduleId, event.week);
        yield AttendanceCompleteState(res);
      } on DioError catch (e) {
        yield AttendanceErrorState(e.response?.data['detail']??"Unknown error");
      }
    }
  }
}