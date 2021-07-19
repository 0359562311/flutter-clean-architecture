import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    int scheduleId = (ModalRoute.of(context)?.settings.arguments as Map)['scheduleId'];
    int week = (ModalRoute.of(context)?.settings.arguments as Map)['week'];
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
            data: "/curriculum/schedule/attendance/$scheduleId/$week",
            // version: QrVersions.auto,
            size: 250,
          ),
        ),
        ),
    );
  }
}
