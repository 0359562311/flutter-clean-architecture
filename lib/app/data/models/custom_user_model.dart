import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/app/data/models/device_data_model.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/custom_user.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/device_data.dart';

class CustomUserModel extends CustomUser{

  CustomUserModel({
    required int id,
    required String role,
    required String name,
    DeviceData? deviceData,
    required DateTime dob,
    required String gender,
    String? phoneNumber,
    String? address,
  }): super(
    id: id,
    role: role,
    name: name,
    deviceData: deviceData,
    dob: dob,
    gender: gender,
    phoneNumber: phoneNumber,
    address: address,
  );

  factory CustomUserModel.fromResponse(Response responseMe, Response responseDeviceData){
    var getMe = responseMe.data['data'];
    var getDeviceData = responseDeviceData.data['data'];
    return CustomUserModel(
      id: getMe['id'],
      role: getMe['role'],
      name: getMe['name'],
      gender: getMe['gender'] = "Male",
      dob: DateTime.parse(getMe['dob']??"2000-12-03T00:00:00.000Z"),
      address: getMe['address'],
      phoneNumber: getMe['phoneNumber'],
      deviceData: responseDeviceData.data['data'].length == 0 ? null : DeviceDataModel.fromJson(getDeviceData)
    );
  }
}