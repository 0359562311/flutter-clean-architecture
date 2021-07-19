import 'package:device_info/device_info.dart';

class PlatformInfo{
  static String deviceId = "";
  static String deviceName = "";

  static Future init() async{
    try {
      final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.androidId;
      deviceName = androidInfo.device;
    } on Exception catch (e) {
    }
  }
}