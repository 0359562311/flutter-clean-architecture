import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_clean_architecture/global/app_routes.dart';
import 'package:flutter_app_clean_architecture/features/presentation/profile/widget/user_infomation_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          decoration: BoxDecoration(
            // color: Color(0xFFEFEFEF),
              image: DecorationImage(
                  image: AssetImage('assets/images/fake_slink/back_ground.jpg'),
                  fit: BoxFit.fill)
                  ),
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 60,),
                  //avatar
                  SizedBox(
                    height: 115,
                    width: 115,
                    child: CircleAvatar(
                      foregroundImage: AssetImage('assets/images/fake_slink/icon_user.png',),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                    ),
                  ),
                  //account
                  SizedBox(height: 60,),
                  InkWell(
                      onTap: (){
                        pushNewScreenWithRouteSettings(
                          context,
                          settings: RouteSettings(name: AppRoutes.routeUserInfor),
                          withNavBar: false,
                          screen: UserInformation(),
                          pageTransitionAnimation: PageTransitionAnimation.fade,
                        );
                        // Navigator.of(context).pushNamed(Constants.routeUserInfor);
                      },
                      child: ProfileMenu(
                          size: size, text: 'Tài khoản', 
                          icon: Icon(Icons.person_outline,size: 30,color: Colors.blue,))
                  ),
                  // Profile_Menu(size: size, text: 'Thông báo', icon: Icon(Icons.notifications_outlined,size: 30,color:  Colors.blue,)),
                  ProfileMenu(size: size, text: 'Trợ giúp', icon: Icon(Icons.contact_support_outlined,size: 30,color: Colors.blue,)),
                  ProfileMenu(size: size, text: 'Đăng xuất', icon: Icon(Icons.exit_to_app_outlined,size: 30,color:  Colors.blue,)),
                ],

          ),
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.size,required this.text, required this.icon,
  }) : super(key: key);

  final Size size;
  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: icon,
            ),
            Text(text,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 15,
                  fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),
      ),
    );
  }
}
