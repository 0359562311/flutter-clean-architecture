
abstract class CreateDeviceDataEvents{
}

class CreateDeviceDataOnClickEvents extends CreateDeviceDataEvents{
  final String deviceId;
  final String deviceName;
  CreateDeviceDataOnClickEvents(this.deviceId, this.deviceName);
}