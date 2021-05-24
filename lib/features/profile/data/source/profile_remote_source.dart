import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/features/profile/data/models/profile_model.dart';
import 'package:get_it/get_it.dart';

class ProfileAPISource {
  Future<ProfileModel> getUserProfile() async{
    var response = await GetIt.instance<Dio>().get("/profile/me/");
    return ProfileModel.fromResponse(response);
  }

  Future<ProfileModel> updateUserProfile(ProfileModel profile) async{
    var response = await GetIt.instance<Dio>().put("/profile/me/",data: profile.toJson());
    return ProfileModel.fromResponse(response);
  }
}