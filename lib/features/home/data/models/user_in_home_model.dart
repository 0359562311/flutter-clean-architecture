import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/features/home/domain/entities/user_in_home.dart';

class UserInHomeModel extends UserInHome{
  UserInHomeModel._(String? name, String? deviceID) : super(name: name,deviceID: deviceID);

  factory UserInHomeModel.fromResponse(
      Response userResponse, Response profileResponse){
    var data = profileResponse.data['data'];
    var name;
    if(data == null)
      name = "user";
    else
      name = data['firstname'] + " " + data['lastname'];
    return UserInHomeModel._(name, userResponse.data?['data']?['identifiedDeviceInfo']?['deviceId']);
  }
}