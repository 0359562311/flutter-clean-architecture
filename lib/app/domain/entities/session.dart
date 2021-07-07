import 'package:flutter_app_clean_architecture/core/utils/share_preferences.dart';

class Session {
  final String access;
  final String refresh;

  Session({required this.access, required this.refresh}){
    SharePreferencesUtils.setString("refresh", refresh);
    SharePreferencesUtils.setString("access", access);
  }
}