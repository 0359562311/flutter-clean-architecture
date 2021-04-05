import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_clean_architecture/features/authentication/data/model/custom_user_model.dart';

abstract class LoginRemoteDataSource{
  Future<CustomUserModel> loginWithEmailAndPassword(String email, String password);
  Future<CustomUserModel> googleSignIn();
  Future<CustomUserModel> facebookSignIn();
}

class LoginFirebaseSource extends LoginRemoteDataSource{
  final FirebaseAuth _auth = FirebaseAuth.instance;

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