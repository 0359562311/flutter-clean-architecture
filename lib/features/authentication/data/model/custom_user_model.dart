import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/entities/custom_user.dart';
// part 'custom_user_model.g.dart';

class CustomUserModel extends CustomUser{
  CustomUserModel({required String uid, String? name, String? deviceId, String? role})
      : super(uid: uid, name: name, deviceId: deviceId, role: role);

  // factory CustomUserModel.fromJson(Map<String,dynamic> map) => _$CustomUserModelFromJson(map);
  // Map<String,dynamic> toJson() => _$CustomUserModelToJson(this);

  void updateFromUserMe(Response response){
    this.role = (response.data?['data']['systemRoles'] as List).first;
    this.deviceId = response.data?['data']?['identifiedDeviceInfo']?['deviceId'];
  }
  void updateFromProfileMe(Response response){
    var data = response.data['data'];
    if(data == null)
      name = "user";
    else
      name = data['firstname'] + " " + data['lastname'];
  }
}