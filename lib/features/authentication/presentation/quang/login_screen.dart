import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginQuang extends StatefulWidget {
  @override
  _LoginQuangState createState() => _LoginQuangState();
}

class _LoginQuangState extends State<LoginQuang> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    String email, password;
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            //Header
            Container(
              height: size.height * 0.45,
              width: size.width,
              // color: Colors.blue,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/fake_slink/header.png'),
                      fit: BoxFit.fill)),
            ),
            //Account
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextFormField(
                obscureText: false,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: Colors.blue[600],
                    size: 28,
                  ),
                  labelText: 'Tài khoản',
                  contentPadding: EdgeInsets.only(left: 50),
                ),
                // style: TextStyle(fontSize: 18),
              ),
            ),
            //Password
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_outlined,
                    color: Colors.blue[600],
                    size: 28,
                  ),
                  suffixIcon: showPassword
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              showPassword = false;
                            });
                          },
                          icon: Icon(
                            Icons.visibility_off,
                            color: Colors.blue,
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              showPassword = true;
                            });
                          },
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: Colors.blue,
                          ),
                        ),
                  labelText: 'Mật khẩu',
                ),
                obscureText: showPassword ? false : true,
              ),
            ),
            //ForgetPassword
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Quên mật khẩu?',
                      style: TextStyle(
                        color: Colors.blue,
                        fontStyle: FontStyle.italic,
                        // fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //LoginButton
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                // margin: EdgeInsets.only(top: 30),
                width: size.width * 0.7,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      onPressed: () {},
                      color: Colors.blue[400],
                      child: Text(
                        'Đăng nhập',
                        style: TextStyle(color: Colors.white,fontSize: 18),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// icon: ImageIcon(
//   new AssetImage('assets/images/fake_slink/account.png'),
//   size: 20,
//   color: Colors.blue,
// ),
