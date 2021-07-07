import 'package:flutter_app_clean_architecture/app/domain/entities/device_data.dart';

class DeviceDataModel extends DeviceData {
  DeviceDataModel({
    required int id,
    required String deviceId,
    required String deviceName,
  }): super(id: id, deviceId: deviceId, deviceName: deviceName);

  factory DeviceDataModel.fromJson(Map<String,dynamic> json) {
    return DeviceDataModel(id: json['id'], deviceName: json['deviceName'], deviceId: json['deviceId']);
  }
}