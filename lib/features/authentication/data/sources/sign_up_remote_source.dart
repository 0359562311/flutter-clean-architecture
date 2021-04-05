import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpRemoteSource{
  Future<void> signUpWithEmailAndPassword(String email, String password);
}

class SignUpFirebaseSource extends SignUpRemoteSource{
  FirebaseAuth? auth;

  SignUpFirebaseSource({this.auth}){
    auth = auth??FirebaseAuth.instance;
  }

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    // TODO: implement signUpWithEmailAndPassword
    await auth!.createUserWithEmailAndPassword(email: email, password: password);
  }

}