import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/custom_user.dart';

class CustomUserModel extends CustomUser{

  CustomUserModel({
    required String id,
    required String role,
    required String name,
    String? deviceId,
    required DateTime dob,
    required String gender,
    String? phoneNumber,
    String? address,
  }): super(
    id: id,
    role: role,
    name: name,
    deviceId: deviceId,
    dob: dob,
    gender: gender,
    phoneNumber: phoneNumber,
    address: address,
  );

  factory CustomUserModel.fromResponse(Response responseMe, Response responseProfile){
    var data1 = responseMe.data['data'];
    var data2 = responseProfile.data['data'];
    return CustomUserModel(
      id: data1['id'],
      role: data1['systemRoles'].first,
      name: data2['firstname'] + data2['lastname'],
      gender: data2['gender'] == "Male"?"Nam":"Nữ",
      dob: DateTime.parse(data2['dateOfBirth']??"2000-12-03T00:00:00.000Z"),
      address: data2['address'],
      phoneNumber: data2['phoneNumber'],
      deviceId: data1?['identifiedDeviceInfo']?['deviceId']
    );
  }
}