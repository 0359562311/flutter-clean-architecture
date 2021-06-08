import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_clean_architecture/core/platform/device_info.dart';
import 'package:flutter_app_clean_architecture/features/data/models/token_model.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/token.dart';
import 'package:get_it/get_it.dart';

abstract class LoginRemoteDataSource {
  Future<TokenModel> loginWithEmailAndPassword(String email, String password);
}

class LoginFirebaseSource extends LoginRemoteDataSource {
  final FirebaseAuth _auth;

  LoginFirebaseSource({required FirebaseAuth auth}) : _auth = auth;

  @override
  Future<TokenModel> loginWithEmailAndPassword(
      String email, String password) async {
    var credential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return (Token(credential.credential?.token.toString()??"") as TokenModel);
  }
}

class LoginAPISource with LoginRemoteDataSource {

  @override
  Future<TokenModel> loginWithEmailAndPassword(
      String email, String password) async {
    var response = await GetIt.instance<Dio>().post(
      "/auth/login/mobile/",
      data: {
        "username": "$email",
        "password": "$password",
        "deviceId": PlatformInfo.deviceId
      },
    );
    return TokenModel.fromResponse(response);
  }
}
