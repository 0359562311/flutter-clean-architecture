import 'package:flutter/material.dart';

class LoginQuang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 15, left: 20, right: 20),
            child: Column(
              children: <Widget>[
                //logo
                Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: Container(
                    width: 100,
                    height: 140,
                    color: Colors.red,
                  ),
                ),
                //account
                RoundedInputFiled(
                  icon: Icons.person,
                  hintText: 'Tài khoản',
                  onChanged: (value) {},
                ),
                //password
                RoundedPasswordField(
                  onChanged: (value) {},
                ),
                //forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Quên mật khẩu?',
                        style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
                //loginbutton
                LoginButton(),
                //image
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    width: 250,
                    height: 90,
                    color: Colors.red,
                  ),
                ),
                //support
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.red.shade100,
                            radius: 24,
                            child: Icon(
                              Icons.account_balance_wallet_rounded,
                              color: Colors.red,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Hướng dẫn sử dụng",
                              style: TextStyle(
                                  fontSize:12
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.red.shade100,
                            radius: 24,
                            child: Icon(
                              Icons.help_center,
                              color: Colors.red,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Hỗ trợ kỹ thuật",
                              style: TextStyle(
                                  fontSize:12
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: 'Mật khẩu',
            icon: Icon(
              Icons.lock,
              color: Colors.grey,
            ),
            suffixIcon: Icon(
              Icons.visibility,
              color: Colors.grey,
            ),
            border: InputBorder.none),
      ),
    );
  }
}

class RoundedInputFiled extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const RoundedInputFiled({
    Key? key,
    required this.hintText,
    required this.icon ,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: Colors.grey,
            ),
            hintText: hintText,
            border: InputBorder.none),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: size.width * 0.7,
      height: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
            onPressed: () {},
            color: Colors.red,
            child: Text(
              'Đăng nhập',
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({Key? key,required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 54,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: child,
    );
  }
}
