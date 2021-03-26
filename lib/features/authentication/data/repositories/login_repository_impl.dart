import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_architecture/core/error/exceptions.dart' ;
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/core/platform/network_info.dart';
import 'package:flutter_app_clean_architecture/features/authentication/data/sources/remote_sources.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/entities/custom_user.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/repositories/login_repository.dart';

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
      } on WrongCredentialsException catch(e) {
        return left(Failure.wrongCredentials("Invalid email or password combination."));
      }
    } else {
      return left(Failure.networkDisconnected("Please turn on network connection."));
    }
  }

}