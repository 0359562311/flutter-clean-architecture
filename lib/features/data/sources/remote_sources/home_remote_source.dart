import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/features/data/models/user_in_home_model.dart';
import 'package:get_it/get_it.dart';

abstract class HomeRemoteSource{
  Future<UserInHomeModel> getUserInfo();
}

class HomeAPISource extends HomeRemoteSource{
  @override
  Future<UserInHomeModel> getUserInfo() async {
    var dio = GetIt.instance<Dio>();
    var userResponse = await dio.get("/user/me/",);
    var profileResponse = await dio.get("/profile/me/",);
    return UserInHomeModel.fromResponse(userResponse, profileResponse);
  }
}