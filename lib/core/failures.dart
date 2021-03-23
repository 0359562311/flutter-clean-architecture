import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  factory Failure.invalidEmail(String message) = InvalidEmail;
}