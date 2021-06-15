import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/custom_user.dart';
import 'package:flutter_app_clean_architecture/features/domain/use_cases/user/get_user_info.dart';
import 'package:flutter_app_clean_architecture/features/presentation/home/bloc/home_events.dart';
import 'package:flutter_app_clean_architecture/features/presentation/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeBloc({required this.getUserInformation}) : super(HomeState.loading());
  GetUserInformationUseCase getUserInformation;
  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if(event is HomeInitEvent){
      yield HomeState.loading();
    }
    yield* (await getUserInformation()).fold(
            errorStream,
            expectStream
    );
  }

  Stream<HomeState> errorStream(Failure l) async*{
    yield HomeState.error(l.message);
  }

  Stream<HomeState> expectStream(CustomUser r) async* {
    if(GetIt.instance.isRegistered<CustomUser>())
      GetIt.instance.unregister<CustomUser>();
    GetIt.instance.registerSingleton<CustomUser>(r);
    print("home bloc $r");
    yield HomeState.getInforCompletely(r);
  }
}