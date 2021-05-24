import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/features/profile/domain/entities/profile.dart';

class ProfileModel extends Profile {
  ProfileModel._({
    String? name,
    DateTime? dob,
    String? gender,
    String? phoneNumber,
    String? email,
    String? address,
  }) : super(
          name: name,
          dob: dob,
          gender: gender,
          phoneNumber: phoneNumber,
          email: email,
          address: address,
        );

  factory ProfileModel.fromResponse(Response response) {
    var data = response.data['data'];
    print(data);
    if (data == null)
      return ProfileModel._(
          name: "Nguyen Kiem Tan", dob: DateTime(2000, 12, 3), gender: "Nam");
    return ProfileModel._(
      name: data['firstname']??"" + " " + data['lastname']??"",
      dob: data['dateOfBirth'] ?? DateTime(2000, 12, 3),
      gender: data['gender'] ?? "Nam",
      phoneNumber: data['phoneNumber']??"",
      email: data['email']??"",
      address: data['address']??""
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'name': name,
      'dob': dob,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'email': email,
      'address': address,
    };
  }
}
