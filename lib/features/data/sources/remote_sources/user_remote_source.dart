import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/features/data/models/custom_user_model.dart';
import 'package:get_it/get_it.dart';

abstract class UserRemoteSource{
  Future<CustomUserModel> getUserInfo();
  Future<CustomUserModel> updateProfile(String address, String phoneNumber);
}

class UserAPISource extends UserRemoteSource{
  @override
  Future<CustomUserModel> getUserInfo() async {
    var dio = GetIt.instance<Dio>();
    var userResponse = await dio.get("/user/me/",);
    var profileResponse = await dio.get("/profile/me/",);
    return CustomUserModel.fromResponse(userResponse, profileResponse);
  }

  @override
  Future<CustomUserModel> updateProfile(String address, String phoneNumber) async {
    var dio = GetIt.instance<Dio>();
    await dio.put("/profile/me/",data:{
      "address": address,
      "phoneNumber": phoneNumber
    });
    var userResponse = await dio.get("/user/me/",);
    var profileResponse = await dio.get("/profile/me/",);
    return CustomUserModel.fromResponse(userResponse, profileResponse);
  }
}