import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_clean_architecture/features/presentation/qrcode/bloc/qr_scan_bloc.dart';
import 'package:flutter_app_clean_architecture/features/presentation/qrcode/bloc/qr_scan_event.dart';
import 'package:flutter_app_clean_architecture/features/presentation/qrcode/bloc/qr_scan_state.dart';
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
      body:
          BlocConsumer<QRScanBloc,QRScanState>(
            bloc: _bloc,
            listener: (_, state){
              if(state is QRScanErrorState){
                Navigator.of(context).pop(state.message);
              } else if (state is QRScanCompleteState) {
                Navigator.of(context).pop("Điểm danh thành công");
              }
            },
            buildWhen: (pre,next){
              return (next is QRScanInitState || next is QRScanLoadingState);
            },
            builder: (_,state) {
              if(state is QRScanInitState)
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
      _bloc.add(QRScanSendResultEvent(barcode.code));
    });
  }

  buildResult() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Text(
        barcode != null ? 'Result : ${barcode!.code}' : 'Bạn phải quét từ ứng dụng để thực hiện điểm danh được.',
        maxLines: 3,
      ),
    );
  }

  //
  // BuildControlButtons() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 15),
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(15), color: Colors.white60),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         IconButton(
  //             onPressed: () async {
  //               await controller?.toggleFlash();
  //               setState(() {});
  //             },
  //             icon: FutureBuilder<bool?>(
  //                 future: controller!.getFlashStatus(),
  //                 builder: (context, snapshot) {
  //                   if (snapshot.data != null)
  //                     return Icon(
  //                         snapshot.data! ? Icons.flash_on : Icons.flash_off);
  //                   else
  //                     return Container();
  //                 })),
  //         IconButton(
  //             onPressed: () async {
  //               await controller?.flipCamera();
  //               setState(() {});
  //             },
  //             icon: FutureBuilder(
  //                 future: controller!.getCameraInfo(),
  //                 builder: (context, snapshot) {
  //                   if (snapshot.data != null)
  //                     return Icon(Icons.switch_camera);
  //                   else
  //                     return Container();
  //                 }))
  //       ],
  //     ),
  //   );
  // }

  @override
  void dispose() {
    _bloc.close();
    controller?.dispose();
    super.dispose();
  }
}
