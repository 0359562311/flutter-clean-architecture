import 'package:device_info/device_info.dart';

class PlatformInfo{
  static late String deviceId;

  static Future init() async{
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceId = androidInfo.id;
  }
}