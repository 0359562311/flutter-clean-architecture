import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/core/utils.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/class.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/schedule.dart';
import 'package:flutter_app_clean_architecture/features/domain/use_cases/class/get_list_class_use_case.dart';
import 'package:flutter_app_clean_architecture/features/presentation/schedule/bloc/list_class_event.dart';
import 'package:flutter_app_clean_architecture/features/presentation/schedule/bloc/list_class_state.dart';
import 'package:flutter_app_clean_architecture/features/presentation/schedule/widget/list_class.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListClassBloc extends Bloc<ListClassEvent,ListClassState>{
  ListClassBloc(this._useCase) : super(ListClassLoadingState());
  GetListClassUseCase _useCase;
  List<Class> _listClasses = [];

  List<Class> get listClasses => _listClasses;

  @override
  Stream<ListClassState> mapEventToState(ListClassEvent event) async* {
    if(event is ListClassFetchAllEvent){
      var either = await _useCase.call();
      yield* either.fold(errorStream, expectedStream);
    } else if (event is ListClassFilterEvent) {
      var temp = _listClasses.where(
              (c) => c.lichHoc.where(
                      (Schedule lichhoc) => lichhoc.tuanHoc.contains(
                              event.week
                      )
              ).isNotEmpty
      );
      List<Classroom> res = [];
      temp.forEach((cl) {
        cl.lichHoc.forEach((schedule) {
          if(schedule.tuanHoc.contains(event.week))
            res.add(
              Classroom(
                id: cl.id,
                timeStart: schedule.thoiGianBatDau,
                timeEnd: schedule.thoiGianKetThuc,
                name: cl.tenMonHoc,
                date: startDate.add(Duration(days: 7*(event.week-1) + schedule.thuHoc-1))
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

  Stream<ListClassState> errorStream(Failure failure) async* {
    yield ListClassErrorState(failure.message);
  }


  Stream<ListClassState> expectedStream(List<Class> r) async* {
    _listClasses = r;
    add(ListClassFilterEvent(1));
  }
}