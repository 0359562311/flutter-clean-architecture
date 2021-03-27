import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_clean_architecture/core/error/exceptions.dart' ;
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/core/platform/network_info.dart';
import 'package:flutter_app_clean_architecture/features/authentication/data/sources/remote_sources.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/entities/custom_user.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/repositories/login_repository.dart';

/// can decide whether to use remote
/// or local data source to cache (if network is not connected)
class LoginRepositoryImpl extends LoginRepository{
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, CustomUser>> facebookSignIn() async {

    return left(Failure.wrongCredentials("message"));
  }

  @override
  Future<Either<Failure, CustomUser>> googleSignIn() async {
    return left(Failure.wrongCredentials("message"));
  }

  @override
  Future<Either<Failure, CustomUser>> loginWithEmailAndPassword(String email, String password) async {
    if(NetworkInfo.instance.isConnecting){
      try{
        return right(await remoteDataSource.loginWithEmailAndPassword(email, password));
      } on WrongCredentialsException {
        return left(Failure.wrongCredentials("Invalid email or wrong password combination."));
      } on FirebaseAuthException catch (ex){
        return left(Failure.serverSendsError(ex.code));
      }
    } else {
      return left(Failure.networkDisconnected("Please turn on network connection."));
    }
  }

}