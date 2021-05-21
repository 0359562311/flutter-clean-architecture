import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/entities/token.dart';

class TokenModel extends Token {
  const TokenModel._(String token) : super(token);
  factory TokenModel.fromResponse(Response response) =>
      TokenModel._(response.data['data']['accessToken']);
}
