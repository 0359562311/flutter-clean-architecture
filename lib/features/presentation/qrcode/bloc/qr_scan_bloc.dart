import 'package:flutter_app_clean_architecture/core/error/failures.dart';
import 'package:flutter_app_clean_architecture/features/domain/use_cases/attendance/request_to_attend_use_case.dart';
import 'package:flutter_app_clean_architecture/features/presentation/qrcode/bloc/qr_scan_event.dart';
import 'package:flutter_app_clean_architecture/features/presentation/qrcode/bloc/qr_scan_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QRScanBloc extends Bloc<QRScanEvent,QRScanState> {
  QRScanBloc(this._requestToAttendUseCase) : super(QRScanInitState());

  final RequestToAttendUseCase _requestToAttendUseCase;

  @override
  Stream<QRScanState> mapEventToState(QRScanEvent event) async* {
    if(event is QRScanSendResultEvent){
      yield QRScanLoadingState();
      if(!event.qrCode.startsWith("/attendance/register/me/in")){
        yield QRScanErrorState("Mã QR không hợp lệ");
      } else {
        var data = event.qrCode.substring("/attendance/register/me/in/".length).split("/");
        yield* (await _requestToAttendUseCase(data[0],data[1],data[2],data[3])).fold(errorStream, expectStream);
      }
    }
  }

  Stream<QRScanState> expectStream(String r) async* {
    String status = "";
    switch(r.toLowerCase()){
      case "intime":
        status = "Đúng giờ";
        break;
      case "early":
        status = "Sớm";
        break;
      default:
        status = "Muộn";
    }
    yield QRScanCompleteState(status);
  }

  Stream<QRScanState> errorStream(Failure l) async* {
    yield QRScanErrorState(l.message);
  }
}