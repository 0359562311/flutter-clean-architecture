import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/app/domain/use_cases/attendance/create_attendance_use_case.dart';
import 'package:flutter_app_clean_architecture/app/presentation/qrcode/bloc/qr_scan_event.dart';
import 'package:flutter_app_clean_architecture/app/presentation/qrcode/bloc/qr_scan_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QRScanBloc extends Bloc<QRScanEvent,QRScanState> {
  QRScanBloc(this._requestToAttendUseCase) : super(QRScanInitState());

  final CreateAttendanceUseCase _requestToAttendUseCase;

  @override
  Stream<QRScanState> mapEventToState(QRScanEvent event) async* {
    if(event is QRScanSendResultEvent){
      yield QRScanLoadingState();
      if(!event.qrCode.startsWith("/curriculum/schedule/attendance/")){
        yield QRScanErrorState("Mã QR không hợp lệ");
      } else {
        var data = event.qrCode.substring("/curriculum/schedule/attendance/".length).split("/");
        try {
          await _requestToAttendUseCase(int.parse(data[0]),int.parse(data[1]));
          yield QRScanCompleteState("");
        } on FormatException catch (_) {
          yield QRScanErrorState("Mã QR không hợp lệ");
        } on DioError catch (e) {
          yield QRScanErrorState(e.response?.data['detail']??"UNKNOWN_ERROR");
        }
      }
    }
  }
}