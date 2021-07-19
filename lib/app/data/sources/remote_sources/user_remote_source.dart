import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/app/data/models/custom_user_model.dart';
import 'package:flutter_app_clean_architecture/core/utils/device_info.dart';
import 'package:get_it/get_it.dart';

abstract class UserRemoteSource{
  Future<CustomUserModel> getUserInfo();
  Future<CustomUserModel> updateProfile(String address, String phoneNumber);
  Future<void> identifyDevice(String password, String deviceId, String deviceName);
}

class UserAPISource extends UserRemoteSource{
  @override
  Future<CustomUserModel> getUserInfo() async {
    var dio = GetIt.instance<Dio>();
    var getMeResponse = await dio.get("/user/me/");
    try {
      var deviceDataResponse = await dio.get("/device-data",);
      return CustomUserModel.fromResponse(getMeResponse, deviceDataResponse);
    } on DioError catch (_) {
      return CustomUserModel.fromResponse(getMeResponse, null);
    }
  }

  @override
  Future<CustomUserModel> updateProfile(String address, String phoneNumber) async {
    var dio = GetIt.instance<Dio>();
    var responseMe= await dio.put("/user/me/",data:{
      "address": address,
      "phoneNumber": phoneNumber
    });
    var deviceDataResponse = await dio.get("/device-data");
    return CustomUserModel.fromResponse(responseMe, deviceDataResponse);
  }

  @override
  Future<void> identifyDevice(String password, String deviceId, String deviceName) async {
    var dio = GetIt.instance<Dio>();
    await dio.post("/device-data/",data: {
      "password": password,
      "deviceId": deviceId,
      "deviceName": deviceName
    });
  }
}