import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../home/presentation/home.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<Widget> screens = List.generate(3, (index) => Home());
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
      routeAndNavigatorSettings: RouteAndNavigatorSettings(
        initialRoute: '/',
        routes: {
          '/first': (context) => MainScreen2(),//don't know why these things here.
          '/second': (context) => MainScreen3(),
        },
      ),
    ),
    PersistentBottomNavBarItem(
        icon: Icon(Icons.account_circle_rounded),
        title: ("Thông tin"),
        activeColorPrimary: Colors.blueAccent,
        activeColorSecondary: Colors.red,
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            '/first': (context) => MainScreen2(),
            '/second': (context) => MainScreen3(),
          },
        ),
        // onPressed: (context) {
          // pushDynamicScreen(context!,
          //     screen: SampleModalScreen(), withNavBar: true);
        // }
    ),
    // PersistentBottomNavBarItem(
    //   icon: Icon(Icons.message),
    //   title: ("Messages"),
    //   activeColorPrimary: Colors.deepOrange,
    //   inactiveColorPrimary: Colors.grey,
    //   routeAndNavigatorSettings: RouteAndNavigatorSettings(
    //     initialRoute: '/',
    //     routes: {
    //       '/first': (context) => MainScreen2(),
    //       '/second': (context) => MainScreen3(),
    //     },
    //   ),
    // ),
    // PersistentBottomNavBarItem(
    //   icon: Icon(Icons.settings),
    //   title: ("Settings"),
    //   activeColorPrimary: Colors.indigo,
    //   inactiveColorPrimary: Colors.grey,
    //   routeAndNavigatorSettings: RouteAndNavigatorSettings(
    //     initialRoute: '/',
    //     routes: {
    //       '/first': (context) => MainScreen2(),
    //       '/second': (context) => MainScreen3(),
    //     },
    //   ),
    // ),
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


class MainScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("MainScreen2"),
      ),
    );
  }
}

class MainScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("MainScreen2"),
      ),
    );
  }
}
