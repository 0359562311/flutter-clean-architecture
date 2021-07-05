import 'package:dio/dio.dart';

class Failure {
  final String message;
  Failure._(this.message);
  factory Failure.networkDisconnected() {
    return Failure._("No internet connection.");
  }
  factory Failure.serverSendsError(DioError dioError) {
    String message;
    switch(dioError.response?.data['errorCode']) {
      case "INVALID_INPUT":
        message = "";
        break;
      default:
        message = "Unknown error";
    }
    return Failure._(message);
  }
  factory Failure.unknownError() => Failure._("Unknown error");
}
