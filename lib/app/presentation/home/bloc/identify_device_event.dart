abstract class IdentifyDeviceEvent{}

class IdentifyDeviceConfirmEvent extends IdentifyDeviceEvent{
  final String password;
  IdentifyDeviceConfirmEvent(this.password);
}