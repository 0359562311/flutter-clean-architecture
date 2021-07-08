import 'package:device_info/device_info.dart';

class PlatformInfo{
  static late String deviceId;
  static late String deviceName;

  static Future init() async{
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceId = androidInfo.androidId;
    deviceName = androidInfo.model;
    print(deviceId);
  }
}