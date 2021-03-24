// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomUserModel _$CustomUserModelFromJson(Map<String, dynamic> json) {
  return CustomUserModel(
    uid: json['uid'] as String,
    name: json['name'] as String?,
    phone: json['phone'] as String?,
  );
}

Map<String, dynamic> _$CustomUserModelToJson(CustomUserModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'phone': instance.phone,
    };
