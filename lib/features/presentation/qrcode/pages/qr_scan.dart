import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_clean_architecture/features/presentation/qrcode/bloc/qr_scan_bloc.dart';
import 'package:flutter_app_clean_architecture/features/presentation/qrcode/bloc/qr_scan_event.dart';
import 'package:flutter_app_clean_architecture/features/presentation/qrcode/bloc/qr_scan_state.dart';
import 'package:flutter_app_clean_architecture/global/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScan extends StatefulWidget {
  const QRScan({Key? key}) : super(key: key);
  @override
  _QRScanState createState() => _QRScanState();
}

class _QRScanState extends State<QRScan> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? barcode;
  QRViewController? controller;
  late QRScanBloc _bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = QRScanBloc(GetIt.instance());
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  Future _showDialog(context, message) {
    return showDialog(context: context, builder: (context) => AlertDialog(
      content: Text(message),
      actions: [
        GestureDetector(
          onTap: (){
            Navigator.popUntil(context, ModalRoute.withName(AppRoutes.routeMain));
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4,vertical: 4),
            child: Text("Đóng",
              style: TextStyle(
                  color: Colors.red
              ),
            ),
          ),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('QR Scan'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
            size: 23,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocConsumer<QRScanBloc, QRScanState>(
        bloc: _bloc,
        listener: (_, state)  {
          if (state is QRScanErrorState) {
            _showDialog(context, state.message);
          } else if (state is QRScanCompleteState) {
            _showDialog(context, "Điểm danh thành công: ${state.status}");
          }
        },
        buildWhen: (pre, next) {
          return (next is QRScanInitState || next is QRScanLoadingState);
        },
        builder: (_, state) {
          if (state is QRScanInitState)
            return Stack(
              alignment: Alignment.topCenter,
              children: [
                buildQrView(context),
                Positioned(bottom: 10, child: buildResult()),
              ],
            );
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    ));
  }

  Widget buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        overlayColor: Colors.blue.shade100,
        borderColor: Colors.blue,
        borderLength: 30,
        borderRadius: 10,
        borderWidth: 10,
        cutOutSize: MediaQuery.of(context).size.width * 0.8,
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    this.controller?.scannedDataStream.listen((barcode) {
      this.barcode = barcode;
      if (this.barcode != null)
        this.controller?.pauseCamera();
      else
        this.controller?.resumeCamera();
      _bloc.add(QRScanSendResultEvent(barcode.code));
    });
  }

  buildResult() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Text(
        barcode != null
            ? 'Result : ${barcode!.code}'
            : 'Bạn phải quét từ ứng dụng để thực hiện điểm danh được.',
        maxLines: 3,
      ),
    );
  }

  @override
  void dispose() {
    _bloc.close();
    controller?.dispose();
    super.dispose();
  }
}
