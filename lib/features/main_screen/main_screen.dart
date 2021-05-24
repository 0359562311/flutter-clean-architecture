import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_clean_architecture/constants.dart';
import 'package:flutter_app_clean_architecture/features/setting/setting.dart';
import 'file:///F:/programming/AndroidStudio%20Projects/flutter-clean-architecture/lib/features/profile/presentation/pages/user_infomation_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../home/presentation/widgets/home.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [Home(),Home(), SettingScreen()];
  PersistentTabController tabController = PersistentTabController();
  List<PersistentBottomNavBarItem> itemBottom = [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.home),
      title: "Trang chủ",
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: Colors.grey,
      inactiveColorSecondary: Colors.purple,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.notifications),
      title: ("Thông báo"),
      activeColorPrimary: Colors.teal,
      inactiveColorPrimary: Colors.grey,
      // routeAndNavigatorSettings: RouteAndNavigatorSettings(
      //   initialRoute: '/',
      //   routes: {
      //     '/first': (context) => MainScreen2(),//don't know why these things here.
      //     '/second': (context) => MainScreen3(),
      //   },
      // ),
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
            Constants.routeUserInfor: (context) => UserInformation(),
          },
        ),
        // onPressed: (context) {
          // pushDynamicScreen(context!,
          //     screen: SampleModalScreen(), withNavBar: true);
        // }
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PersistentTabView(context, screens: screens,
        controller: tabController,
        items: itemBottom,
        backgroundColor: Colors.white,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style1,
      ),
    );
  }
}
