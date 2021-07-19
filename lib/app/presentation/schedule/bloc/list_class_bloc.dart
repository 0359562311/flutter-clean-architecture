import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/core/utils.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/class.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/schedule.dart';
import 'package:flutter_app_clean_architecture/app/domain/use_cases/class/get_list_class_use_case.dart';
import 'package:flutter_app_clean_architecture/app/presentation/schedule/bloc/list_class_event.dart';
import 'package:flutter_app_clean_architecture/app/presentation/schedule/bloc/list_class_state.dart';
import 'package:flutter_app_clean_architecture/app/presentation/schedule/widget/list_schedule.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListClassBloc extends Bloc<ListClassEvent,ListClassState>{
  ListClassBloc(this._useCase) : super(ListClassLoadingState());
  GetListClassUseCase _useCase;
  List<Class> _listClasses = [];

  List<Class> get listClasses => _listClasses;

  @override
  Stream<ListClassState> mapEventToState(ListClassEvent event) async* {
    if(event is ListClassFetchAllEvent){
      try {
        _listClasses = await _useCase.call();
        add(ListClassFilterEvent(1));
      } on DioError catch (e) {
        yield ListClassErrorState(e.response?.data['detail']??"Unknown error");
      }
    } else if (event is ListClassFilterEvent) {
      var temp = _listClasses.where(
              (c) => c.schedules.where(
                      (Schedule schedule) => schedule.weeks.contains(
                              event.week
                      )
              ).isNotEmpty
      );
      List<Classroom> res = [];
      temp.forEach((cl) {
        cl.schedules.forEach((schedule) {
          if(schedule.weeks.contains(event.week))
            res.add(
              Classroom(
                inClass: cl,
                timeStart: schedule.startAt,
                timeEnd: schedule.endAt,
                name: cl.subject.subjectName,
                date: startDate.add(Duration(days: 7*(event.week-1) + schedule.dayOfWeek)),
                schedule: schedule
              )
            );
        });
      });
      res.sort((a,b) {
        if(a.date.compareTo(b.date) == 0) {
          return a.timeStart.compareTo(b.timeStart);
        }
        return a.date.compareTo(b.date);
      });
      yield ListClassCompleteState(res);
    }
  }
}