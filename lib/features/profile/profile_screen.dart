import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_clean_architecture/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/fake_slink/yabure.jpg'),
                        ),
                        Positioned(
                            right: 1,
                            bottom: -1,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Color(0xFFF5F6F9),
                                  borderRadius: BorderRadius.circular(90)
                              ),
                              child: IconButton(
                                padding: EdgeInsets.all(0),
                                icon: Icon(Icons.camera, color: Colors.black,size: 35,),
                                onPressed: () {  },
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                  //account
                  SizedBox(height: 60,),
                  Profile_Menu(size: size, text: 'Tài khoản', icon: Icon(Icons.person_outline,size: 30,color: Colors.blue,)),
                  Profile_Menu(size: size, text: 'Thông báo', icon: Icon(Icons.notifications_outlined,size: 30,color:  Colors.blue,)),
                  Profile_Menu(size: size, text: 'Trợ giúp', icon: Icon(Icons.contact_support_outlined,size: 30,color: Colors.blue,)),
                  Profile_Menu(size: size, text: 'Đăng xuất', icon: Icon(Icons.exit_to_app_outlined,size: 30,color:  Colors.blue,)),

                ],

          ),
        ),
      ),
    );
  }
}

class Profile_Menu extends StatelessWidget {
  const Profile_Menu({
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