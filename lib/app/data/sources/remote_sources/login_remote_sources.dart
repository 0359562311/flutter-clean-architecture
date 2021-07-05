import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/core/utils/device_info.dart';
import 'package:flutter_app_clean_architecture/app/data/models/session_model.dart';
import 'package:get_it/get_it.dart';

abstract class LoginRemoteDataSource {
  Future<SessionModel> loginWithEmailAndPassword(String email, String password);
}

class LoginAPISource with LoginRemoteDataSource {

  @override
  Future<SessionModel> loginWithEmailAndPassword(
      String email, String password) async {
    var response = await GetIt.instance<Dio>().post(
      "/auth/jwt/create/",
      data: {
        "email": "$email",
        "password": "$password",
        // "deviceId": PlatformInfo.deviceId
      },
    );
    return SessionModel.fromResponse(response);
  }
}
