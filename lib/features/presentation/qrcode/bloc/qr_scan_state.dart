abstract class QRScanState {}

class QRScanLoadingState extends QRScanState {}

class QRScanInitState extends QRScanState {}

class QRScanErrorState extends QRScanState {
  final String message;
  QRScanErrorState(this.message);
}

class QRScanCompleteState extends QRScanState{
  final String status;
  QRScanCompleteState(this.status);
}