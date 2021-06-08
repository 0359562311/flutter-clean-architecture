import 'package:flutter_app_clean_architecture/features/domain/use_cases/home/get_user_info.dart';
import 'package:flutter_app_clean_architecture/features/presentation/home/bloc/home_events.dart';
import 'package:flutter_app_clean_architecture/features/presentation/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeBloc({required this.getUserInformation}) : super(HomeState.loading());
  GetUserInformation getUserInformation;
  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if(event is HomeInitEvent){
      yield HomeState.loading();
    }
    yield* (await getUserInformation()).fold(
            (l) async*{
          yield HomeState.error(l.message);
        },
            (r) async*{
          yield HomeState.getInforCompletely(r);
        }
    );
  }
}