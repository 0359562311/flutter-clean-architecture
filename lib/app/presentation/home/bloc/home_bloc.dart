import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/custom_user.dart';
import 'package:flutter_app_clean_architecture/app/domain/use_cases/user/get_user_info.dart';
import 'package:flutter_app_clean_architecture/app/presentation/home/bloc/home_events.dart';
import 'package:flutter_app_clean_architecture/app/presentation/home/bloc/home_state.dart';
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
    try {
      CustomUser user = await getUserInformation.call();
      if(GetIt.instance.isRegistered<CustomUser>())
        GetIt.instance.unregister<CustomUser>();
      GetIt.instance.registerSingleton<CustomUser>(user);
      yield HomeState.getInforCompletely(user);
    } on DioError catch (e) {
      yield HomeState.error(e.message);
    } on Exception catch (e) {
      yield HomeState.error(e.toString());
    }
  }
}