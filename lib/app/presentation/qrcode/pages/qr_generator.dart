import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_clean_architecture/app/presentation/profile/widget/user_infomation_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRGenerator extends StatefulWidget {
  const QRGenerator({Key? key}) : super(key: key);

  @override
  _QRGeneratorState createState() => _QRGeneratorState();
}

class _QRGeneratorState extends State<QRGenerator> {
  final controller = TextEditingController();
  FocusNode focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    String maLopHoc = (ModalRoute.of(context)?.settings.arguments as Map)['maLopHoc'];
    String maMonHoc = (ModalRoute.of(context)?.settings.arguments as Map)['maMonHoc'];
    String thoiGianBatDau = (ModalRoute.of(context)?.settings.arguments as Map)['thoiGianBatDau'];
    String thoiGianKetThuc = (ModalRoute.of(context)?.settings.arguments as Map)['thoiGianKetThuc'];
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.blue,
              size: 23,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('QR Code Generator',style: TextStyle(color:Colors.blue),),
        ),
        body: Center(
          child: QrImage(
            data: "/attendance/register/me/in/$maLopHoc/$maMonHoc/$thoiGianBatDau/$thoiGianKetThuc",
            // version: QrVersions.auto,
            size: 250,
          ),
        ),
        ),
    );
  }
}
