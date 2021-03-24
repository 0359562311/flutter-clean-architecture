import 'package:flutter_app_clean_architecture/features/authentication/domain/entities/custom_user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'custom_user_model.g.dart';

@JsonSerializable()
class CustomUserModel extends CustomUser{
  CustomUserModel({required String uid, String? name, String? phone})
      : super(uid: uid, name: name, phone: phone);

  factory CustomUserModel.fromJson(Map<String,dynamic> map) => _$CustomUserModelFromJson(map);
  Map<String,dynamic> toJson() => _$CustomUserModelToJson(this);

  @override
  String toString() {
    return super.toString();
  }
}