import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_clean_architecture/core/error/exceptions.dart';
import 'package:flutter_app_clean_architecture/core/platform/device_info.dart';
import 'package:flutter_app_clean_architecture/features/authentication/data/model/custom_user_model.dart';
import 'package:get_it/get_it.dart';

abstract class LoginRemoteDataSource{
  Future<CustomUserModel> loginWithEmailAndPassword(String email, String password);
  Future<CustomUserModel> googleSignIn();
  Future<CustomUserModel> facebookSignIn();
}

class LoginFirebaseSource extends LoginRemoteDataSource{
  final FirebaseAuth _auth;

  LoginFirebaseSource({required FirebaseAuth auth}): _auth = auth;

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
  Future<CustomUserModel> loginWithEmailAndPassword(String email, String password) async {
    var credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return CustomUserModel(uid: credential.user!.uid);
  }

}

class LoginAPISource with LoginRemoteDataSource{
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
  Future<CustomUserModel> loginWithEmailAndPassword(String email, String password) async {
    // TODO: implement loginWithEmailAndPassword
    try {
      var response = await GetIt.instance<Dio>().request("/auth/login/mobile/",data: {
          "username": "$email",
          "password": "$password",
          "deviceId": PlatformInfo.deviceId
        },
        options: Options(method: 'POST')
      );
      print(response);
      return CustomUserModel(uid: response.data['data']['accessToken']);
    } on DioError catch (e) {
      // TODO
      print(e);
      throw APIException(e.response?.data['message']??"Error message from API");
    }
  }

}