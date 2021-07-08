
import 'package:flutter_app_clean_architecture/app/domain/entities/device_data.dart';

abstract class CreateDeviceDataState{}

class CreateDeviceDataInitState extends CreateDeviceDataState{}

class CreateDeviceDataLoadingState extends CreateDeviceDataState{}

class CreateDeviceDataSuccessState extends CreateDeviceDataState{
  DeviceData deviceData;
  CreateDeviceDataSuccessState(this.deviceData);
}

class CreateDeviceDataErrorState extends CreateDeviceDataState{
  String mess;
    CreateDeviceDataErrorState(this.mess);
}


