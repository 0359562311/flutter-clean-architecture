import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/app/domain/use_cases/user/identify_device_use_case.dart';
import 'package:flutter_app_clean_architecture/app/presentation/home/bloc/identify_device_event.dart';
import 'package:flutter_app_clean_architecture/app/presentation/home/bloc/identify_device_state.dart';
import 'package:flutter_app_clean_architecture/core/utils/device_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class IdentifyDeviceBloc extends Bloc<IdentifyDeviceEvent, IdentifyDeviceState>{
  IdentifyDeviceBloc() : super(IdentifyDeviceState.successful());

  final IdentifyDeviceUseCase _useCase = GetIt.instance<IdentifyDeviceUseCase>();

  @override
  Stream<IdentifyDeviceState> mapEventToState(IdentifyDeviceEvent event) async* {
    // TODO: implement mapEventToState
    if(event is IdentifyDeviceConfirmEvent){
      if (PlatformInfo.deviceId.isNotEmpty) {
        try {
          await _useCase(event.password, PlatformInfo.deviceId, PlatformInfo.deviceName);
          yield IdentifyDeviceState.successful();
        } on DioError catch (e) {
          yield IdentifyDeviceState.error(e.response?.data['detail']);
        }
      } else {
        yield IdentifyDeviceState.error("Không thể lấy mã số thiết bị.\n Hãy thử lại sau.");
      }
    }
  }
}