import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_clean_architecture/app/presentation/setting.dart';
import 'package:flutter_app_clean_architecture/global_constants/app_routes.dart';
import 'package:get_it/get_it.dart';

import 'home/widget/home.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _index = 0;

  List<Widget> _screens = [Home(),Placeholder(color: Colors.white,), SettingScreen()];
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  void initState(){
    super.initState();
    GetIt.instance<StreamController<bool>>().stream.listen((event) {
      if (!event) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Login session expired"),
              content:
              Text("You need to log in to continue to use our app."),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.routeLogin, (route) => false);
                  },
                  child: Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    color: Colors.red,
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                )
              ],
            ));
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        children: _screens,
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: (value){
          setState(() {
            _index = value;
          });
        },
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          color: Colors.white
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(3, (index) {
            return GestureDetector(
              onTap: (){
                setState(() {
                  _index = index;
                  _pageController.animateToPage(_index, duration: Duration(milliseconds: 200), curve: Curves.elasticOut);
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: (_index == index? _itemBottom[index].activeColorPrimary:Colors.white).withOpacity(0.3)
                ),
                child: IntrinsicWidth(
                  child: Row(
                    children: [
                      Icon(_itemBottom[index].iconData,
                        color: _index == index? _itemBottom[index].activeColorPrimary:Colors.grey,
                      ),
                      if(index == _index) Text(_itemBottom[index].title,
                        style: TextStyle(
                          color: _index == index? _itemBottom[index].activeColorPrimary:Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  List<_BottomItem> _itemBottom = [
    _BottomItem(Colors.blue, "Trang chủ", Icons.home),
    _BottomItem(Colors.teal, "Thông báo", Icons.notifications),
    _BottomItem(Colors.red, "Cài đặt", Icons.settings),
  ];

}

class _BottomItem {
  final Color activeColorPrimary;
  final String title;
  final IconData iconData;

  _BottomItem(this.activeColorPrimary, this.title, this.iconData);
}
