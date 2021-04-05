import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/entities/custom_user.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/repositories/login_repository.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/usecases/login_with_email_and_password.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLoginRepository extends Mock with LoginRepository{}

void main(){
  MockLoginRepository mockLoginRepository = MockLoginRepository();
  LoginWithEmailAndPassword usecase = LoginWithEmailAndPassword(mockLoginRepository);
  setUp((){
    mockLoginRepository = MockLoginRepository();
    usecase = LoginWithEmailAndPassword(mockLoginRepository);
  });

  String email = "anhtanhangxom@gmail.com";
  String password = "password";

  group('login', (){
    test('should succeed', (){
      when(mockLoginRepository.loginWithEmailAndPassword(email, password)).
      thenAnswer((_) async => right(CustomUser(uid: "test uid")));
    });

    test('should fail',(){
      when(mockLoginRepository.loginWithEmailAndPassword(email, "")).
      thenAnswer((realInvocation) async => left(Failure.wrongCredentials("Wrong password")));
    });
  });

  test("test verify", () async {
    var res = await usecase(email: email, password: password);
    expect(res, null);
    // verify(mockLoginRepository.loginWithAccountAndPassword(email, password)).called(1);
    verify(mockLoginRepository.loginWithEmailAndPassword(email, password));//same with above
  });
}