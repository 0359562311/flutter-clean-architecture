import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/attendance.dart';
import 'package:flutter_app_clean_architecture/features/domain/use_cases/attendance/get_attendance_stat_use_case.dart';
import 'package:flutter_app_clean_architecture/features/presentation/attendance_stat/bloc/attendance_stat_event.dart';
import 'package:flutter_app_clean_architecture/features/presentation/attendance_stat/bloc/attendance_stat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendanceStatBloc extends Bloc<AttendanceStatEvent,AttendanceStatState>{
  AttendanceStatBloc(this._useCase) : super(AttendanceLoadingState());

  final GetAttendanceStatUseCase _useCase;

  @override
  Stream<AttendanceStatState> mapEventToState(AttendanceStatEvent event) async* {
    if(event is AttendanceStatInitEvent) {
      yield* (await _useCase(event.cl, event.schedule, event.date)).fold(errorStream, expectStream);
    }
  }


  Stream<AttendanceStatState> expectStream(List<Attendance> r) async* {
    yield AttendanceCompleteState(r);
  }

  Stream<AttendanceStatState> errorStream(Failure l) async* {
    yield AttendanceErrorState(l.message);
  }
}