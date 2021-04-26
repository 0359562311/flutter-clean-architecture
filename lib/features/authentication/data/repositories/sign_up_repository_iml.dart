import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/core/platform/network_info.dart';
import 'package:flutter_app_clean_architecture/features/authentication/data/sources/sign_up_remote_source.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/repositories/sign_up_repository.dart';

class SignUpRepositoryImpl extends SignUpRepository{
  SignUpRemoteSource remoteSource;

  SignUpRepositoryImpl(this.remoteSource);

  @override
  Future<Either<Failure, void>> signUpWithEmailAndPassword(String email, String password) async {
    // TODO: implement signUpWithEmailAndPassword
     if(NetworkInfo.instance.isConnecting){
       try {
         return right(await remoteSource.signUpWithEmailAndPassword(email, password));
       } on FirebaseAuthException catch (e) {
         // TODO
         return left(Failure.serverSendsError(e.message??"Server error"));
       }
     }else{
       return left(Failure.networkDisconnected("Please turn on network connection."));
     }
  }

}