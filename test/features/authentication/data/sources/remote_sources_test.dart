import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_clean_architecture/features/data/sources/remote_sources/login_remote_sources.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLoginRemoteDataSource extends Mock implements LoginRemoteDataSource{}

class MockFirebaseAuth extends Mock implements FirebaseAuth{}

void main() async {
  MockFirebaseAuth mockFirebaseAuth = MockFirebaseAuth();
  LoginRemoteDataSource remoteDataSource = MockLoginRemoteDataSource();
  final email = "anhtanhangxom@gmail.com";
  final rightPassword = "password";
  final wrongPassword = "";

  // test("should succeed", () async {
  //   var user = await remoteDataSource.loginWithEmailAndPassword(email, rightPassword);
  //   verify(remoteDataSource.loginWithEmailAndPassword(email, rightPassword));
  //   expect(user.uid, "uid");
  // });

}