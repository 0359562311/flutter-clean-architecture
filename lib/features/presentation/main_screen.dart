import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_clean_architecture/global/app_routes.dart';
import 'package:flutter_app_clean_architecture/features/presentation/profile/widget/user_infomation_screen.dart';
import 'package:flutter_app_clean_architecture/features/presentation/setting.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'home/widget/home.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _index = 0;

  List<Widget> _screens = [Home(),Home(), SettingScreen()];
  List<PersistentBottomNavBarItem> _itemBottom = [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.home),
      title: "Trang chủ",
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: Colors.grey,
      inactiveColorSecondary: Colors.purple,
      // routeAndNavigatorSettings: RouteAndNavigatorSettings(
      //   routes: {
      //     Constants.routeQRGenerator: (context) => QRGenerator(),//don't know why these things here.
      //     Constants.routeQROptions: (context) => QROptions(),
      //   },
      // ),
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.notifications),
      title: ("Thông báo"),
      activeColorPrimary: Colors.teal,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("Cài đặt"),
        activeColorPrimary: Colors.blueAccent,
        activeColorSecondary: Colors.red,
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          // initialRoute: '/',
          routes: {
            AppRoutes.routeUserInfor: (context) => UserInformation(),
          },
        ),
        // onPressed: (context) {
          // pushDynamicScreen(context!,
          //     screen: SampleModalScreen(), withNavBar: true);
        // }
    ),
  ];
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                      Icon(_iconData[index],
                        color: _index == index? _itemBottom[index].activeColorPrimary:Colors.grey,
                      ),
                      if(index == _index) Text(_itemBottom[index].title!,
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

  List<IconData> _iconData = [
    Icons.home,
    Icons.notifications,
    Icons.settings
  ];
}
