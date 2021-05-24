import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/features/profile/domain/entities/profile.dart';

class ProfileModel extends Profile {
  ProfileModel._({
    String? name,
    String? dob,
    String? gender,
    String? phoneNumber,
    String? address,
  }) : super(
          name: name,
          dob: dob,
          gender: gender,
          phoneNumber: phoneNumber,
          address: address,
        );

  factory ProfileModel.fromResponse(Response response) {
    var data = response.data['data'];
    print(data);
    if (data == null)
      return ProfileModel._(
          name: "Nguyen Kiem Tan", dob: "03/12/2000", gender: "Nam");
    return ProfileModel._(
      name: data['firstname']??"" + " " + data['lastname']??"",
      dob: data['dateOfBirth'].toString().substring(0,10),
      gender: data['gender'],
      phoneNumber: data['phoneNumber'],
      address: data['address']
    );
  }

  factory ProfileModel.fromProfile(Profile profile) => ProfileModel._(
    name: profile.name,
    dob: profile.dob,
    gender: profile.gender,
    phoneNumber: profile.phoneNumber,
    address: profile.address,
  );

  Map<String,dynamic> toJson(){
    return {
      'phoneNumber': phoneNumber,
      'address': address,
    };
  }
}
