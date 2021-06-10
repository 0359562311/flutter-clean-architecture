import 'package:flutter/material.dart';
import 'package:flutter_app_clean_architecture/features/qrcode/presentation/pages/qr_scan.dart';
import 'package:flutter_app_clean_architecture/global/app_routes.dart';
import 'package:flutter_app_clean_architecture/features/qrcode/presentation/pages/qr_generator.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class QROptions extends StatefulWidget {
  const QROptions({Key? key}) : super(key: key);

  @override
  _QROptionsState createState() => _QROptionsState();
}

class _QROptionsState extends State<QROptions> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Color(0xFF2F82FF),
          leadingWidth: 50,
          titleSpacing: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
              size: 23,
            ),
            onPressed: () {},
          ),
          title: Text(
            'QR Options',
            style: TextStyle(
                color: Colors.white, fontSize: 23, fontWeight: FontWeight.w500),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                // color: Colors.blue,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/fake_slink/handwithqr.jpg'),
                        fit: BoxFit.cover)),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        pushNewScreenWithRouteSettings(
                          context,
                          settings: RouteSettings(name: AppRoutes.routeQRScan),
                          withNavBar: false,
                          screen: QRScan(),
                          pageTransitionAnimation: PageTransitionAnimation.fade,
                        );
                      },
                      child: Text(
                        'QR Scanner',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 22
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red[100],
                        shadowColor: Colors.blueAccent,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        pushNewScreenWithRouteSettings(
                          context,
                          settings: RouteSettings(name: AppRoutes.routeQRGenerator),
                          withNavBar: false,
                          screen: QRGenerator(),
                          pageTransitionAnimation: PageTransitionAnimation.fade,
                        );
                      },
                      child: Text(
                        'QR Generator',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 22
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[100],
                        shadowColor: Colors.redAccent,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
