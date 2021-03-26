import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/entities/custom_user.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/repositories/login_repository.dart';
import 'package:flutter_app_clean_architecture/features/login/domain/usecases/login_with_email_and_password.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLoginRepository extends Mock implements LoginRepository{}

void main(){
  MockLoginRepository repository = MockLoginRepository();
  LogInWithEmailAndPassword useCase = LogInWithEmailAndPassword(repository: repository);
  setUp((){
    repository = MockLoginRepository();
  });
  final email = "anhtanhangxom@gmail.com";
  final password = "password";

  group('login', (){
    test('should succeed', (){
      when(repository.loginWithAccountAndPassword(email, password)).
        thenAnswer((_) async => right(CustomUser(uid: "test uid")));
    });

    test('should fail',(){
      when(repository.loginWithAccountAndPassword(email, "")).
        thenAnswer((realInvocation) async => left(Failure.invalidPassword("Wrong password")));
    });
  });
}