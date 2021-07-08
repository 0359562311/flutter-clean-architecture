
import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/app/domain/use_cases/user/create_device_data_use_case.dart';
import 'package:flutter_app_clean_architecture/app/presentation/home/bloc/create_device_data_events.dart';
import 'package:flutter_app_clean_architecture/app/presentation/home/bloc/create_device_data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateDeviceDataBloc extends Bloc<CreateDeviceDataEvents, CreateDeviceDataState>{
  CreateDeviceDataBloc(this.createDeviceDataUseCase ) : super( CreateDeviceDataInitState());
  final CreateDeviceDataUseCase createDeviceDataUseCase;

  @override
  Stream<CreateDeviceDataState> mapEventToState(CreateDeviceDataEvents event) async* {
    yield CreateDeviceDataLoadingState();
    try{
      if(event is CreateDeviceDataOnClickEvents){
        var createDeviceDataOnClickEvents =  await createDeviceDataUseCase(event.deviceId,event.deviceName);
        yield CreateDeviceDataSuccessState(createDeviceDataOnClickEvents);
      }
    }on DioError catch (e) {
      // TODO
      yield CreateDeviceDataErrorState(e.message);
    }


  }
}