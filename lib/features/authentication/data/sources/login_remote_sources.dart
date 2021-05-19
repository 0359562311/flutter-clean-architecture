import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_clean_architecture/core/error/exceptions.dart';
import 'package:flutter_app_clean_architecture/core/platform/device_info.dart';
import 'package:flutter_app_clean_architecture/features/authentication/data/model/custom_user_model.dart';
import 'package:flutter_app_clean_architecture/features/authentication/data/model/token_model.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/entities/custom_user.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/entities/token.dart';
import 'package:get_it/get_it.dart';

abstract class LoginRemoteDataSource {
  Future<TokenModel> loginWithEmailAndPassword(String email, String password);
  Future<CustomUserModel> googleSignIn();
  Future<CustomUserModel> facebookSignIn();
}

class LoginFirebaseSource extends LoginRemoteDataSource {
  final FirebaseAuth _auth;

  LoginFirebaseSource({required FirebaseAuth auth}) : _auth = auth;

  @override
  Future<CustomUserModel> facebookSignIn() {
    // TODO: implement facebookSignIn
    throw UnimplementedError();
  }

  @override
  Future<CustomUserModel> googleSignIn() {
    // TODO: implement googleSignIn
    throw UnimplementedError();
  }

  @override
  Future<TokenModel> loginWithEmailAndPassword(
      String email, String password) async {
    var credential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return (Token("token") as TokenModel);
  }
}

class LoginAPISource with LoginRemoteDataSource {
  @override
  Future<CustomUserModel> facebookSignIn() {
    // TODO: implement facebookSignIn
    throw UnimplementedError();
  }

  @override
  Future<CustomUserModel> googleSignIn() {
    // TODO: implement googleSignIn
    throw UnimplementedError();
  }

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
    // GetIt.instance<Dio>().options.headers['Authorization'] =
    //     'Bearer ${response.data['data']['accessToken']}';
    return TokenModel.fromResponse(response);
  }
}
