abstract class QRScanEvent {}

class QRScanSendResultEvent extends QRScanEvent {
  final String qrCode;

  QRScanSendResultEvent(this.qrCode);
}