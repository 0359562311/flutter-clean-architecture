import 'package:shared_preferences/shared_preferences.dart';

abstract class SharePreferencesUtils {
  static late final SharedPreferences _instance;
  static Future init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static Future setInt(String key, int value) {
    return _instance.setInt(key, value).then((value) => _instance.reload());
  }

  static int? getInt(String key) {
    return _instance.getInt(key);
  }

  static Future setString(String key, String value) {
    return _instance.setString(key, value).then((value) => _instance.reload());
  }

  static String? getString(String key) {
    return _instance.getString(key);
  }

  static Future reset() {
    return _instance.clear();
  }

  static void clearSession() {
    _instance.remove("access");
    _instance.remove("refresh");
  }
}
