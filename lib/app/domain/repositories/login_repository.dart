import 'package:flutter_app_clean_architecture/app/domain/entities/session.dart';

abstract class LoginRepository{
  Future<Session> loginWithUsernameAndPassword(String email, String password);
}