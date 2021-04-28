class NetworkException implements Exception{}

class WrongCredentialsException implements Exception{}

class APIException implements Exception{
  final String message;

  APIException(this.message);
}