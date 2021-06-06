import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCreate extends StatefulWidget {
  const QRCreate({Key? key}) : super(key: key);

  @override
  _QRCreateState createState() => _QRCreateState();
}

class _QRCreateState extends State<QRCreate> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('QR Code Generator'),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QrImage(
                  data: controller.text,
                  version: QrVersions.auto,
                  size: 200,
                  gapless: false,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
