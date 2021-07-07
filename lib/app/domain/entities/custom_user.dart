import 'package:flutter_app_clean_architecture/app/domain/entities/device_data.dart';

class CustomUser{
  int id;
  String role;
  String name;
  DeviceData? deviceData;
  DateTime dob;
  String gender;
  String? phoneNumber;
  String? address;


  CustomUser(
      {required this.id,
      required this.role,
        required this.name,
        required this.deviceData,
        required this.dob,
        required this.gender,
      this.phoneNumber,
      this.address});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomUser &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          role == other.role &&
          name == other.name;

  @override
  int get hashCode =>
      id.hashCode ^ role.hashCode ^ name.hashCode ^ deviceData.hashCode;

}