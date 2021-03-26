import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/core/platform/network_info.dart';
import 'package:flutter_app_clean_architecture/features/authentication/data/model/custom_user_model.dart';
import 'package:flutter_app_clean_architecture/features/authentication/data/sources/remote_sources.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/repositories/login_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLoginRepositoryImpl extends Mock implements LoginRepository{
}

class MockNetWorkInfo extends Mock implements NetworkInfo{
}

void main(){
  MockLoginRepositoryImpl repositoryImpl = MockLoginRepositoryImpl();
  MockNetWorkInfo mockNetWorkInfo = MockNetWorkInfo();

  final email = "anhtanhangxom@gmail.com";
  final rightPassword = "password";
  final wrongPassword = "";

  group("test login online", (){
    when(mockNetWorkInfo.isConnecting).thenReturn(true);

    test("should succeed", (){
      when(repositoryImpl.loginWithEmailAndPassword(email, rightPassword)).
        thenAnswer((realInvocation) async => right(CustomUserModel(uid: "uid")));
      verifyNever(repositoryImpl.loginWithEmailAndPassword(email, rightPassword));
    });

    group("should fail because of providing wrong credentials", (){
      test(" wrong password", (){
        when(repositoryImpl.loginWithEmailAndPassword(email, wrongPassword)).
          thenAnswer((realInvocation) async => left(Failure.wrongCredentials("wrong password")));
        verifyNever(repositoryImpl.loginWithEmailAndPassword(email, wrongPassword));
      });

      test("wrong email", (){
        when(repositoryImpl.loginWithEmailAndPassword("", rightPassword)).
        thenAnswer((realInvocation) async => left(Failure.wrongCredentials("wrong email")));
        verifyNever(repositoryImpl.loginWithEmailAndPassword("", rightPassword));
      });
    });
  });

  group("offline test ", (){
    when(mockNetWorkInfo.isConnecting).thenReturn(false);
    test("fail", (){
      when(repositoryImpl.loginWithEmailAndPassword(email, rightPassword)).
        thenAnswer((realInvocation) async => left(Failure.networkDisconnected("Please turn on network connection.")));
    });
  });
}