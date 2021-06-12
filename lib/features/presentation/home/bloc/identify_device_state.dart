import 'package:freezed_annotation/freezed_annotation.dart';
part 'identify_device_state.freezed.dart';
@freezed
abstract class IdentifyDeviceState with _$IdentifyDeviceState{
  factory IdentifyDeviceState.loading() = IdentifyDeviceLoadingState;
  factory IdentifyDeviceState.error(String message) = IdentifyDeviceErrorState;
  factory IdentifyDeviceState.successful() = IdentifyDeviceSuccessfulState;
}