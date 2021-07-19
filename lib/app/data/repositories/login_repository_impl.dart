import 'package:flutter_app_clean_architecture/app/data/sources/remote_sources/login_remote_sources.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/session.dart';
import 'package:flutter_app_clean_architecture/app/domain/repositories/login_repository.dart';

/// can decide whether to use remote
/// or local data source to cache (if network is not connected)
class LoginRepositoryImpl extends LoginRepository{
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl(this.remoteDataSource);

  @override
  Future<Session> loginWithUsernameAndPassword(String email, String password) {
    return remoteDataSource.loginWithEmailAndPassword(email, password);
  }
}
