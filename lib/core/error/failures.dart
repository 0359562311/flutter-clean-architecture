import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  factory Failure.wrongCredentials(String message) = WrongCredentials;
  factory Failure.networkDisconnected(String message) = NetWorkDisconnected;
}