import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/features/authentication/data/model/custom_user_model.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/entities/custom_user.dart';
import 'package:get_it/get_it.dart';

abstract class HomeRemoteSource{
  Future<CustomUserModel> getUserInfo();
}

class HomeAPISource extends HomeRemoteSource{
  @override
  Future<CustomUserModel> getUserInfo() async {
    var dio = GetIt.instance<Dio>();
    var response = await dio.get("/user/me/",);
    print(response.data);
    CustomUserModel customUserModel = GetIt.instance<CustomUser>() as CustomUserModel;
    customUserModel.updateFromUserMe(response);
    response = await dio.get("/profile/me/",);
    customUserModel.updateFromProfileMe(response);
    return customUserModel;
  }
}