import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/repositories/login_repository.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/usecases/login_with_facebook.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLoginRepository extends Mock implements LoginRepository{}

void main(){
  late MockLoginRepository repository;
  late LoginWithFacebook loginWithFacebook;
  setUp((){
    repository = MockLoginRepository();
    loginWithFacebook = LoginWithFacebook(repository);
  });

  test("login with facebook fail", () async {
    when(repository.facebookSignIn()).thenAnswer((_) => Future.value(left(Failure.serverSendsError("fail"))));
    var expectation = await loginWithFacebook.call();
    expect(expectation,left(Failure.serverSendsError("fail")));
  });
}