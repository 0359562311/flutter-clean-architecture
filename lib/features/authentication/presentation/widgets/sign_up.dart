import 'package:flutter/material.dart';
import 'package:flutter_app_clean_architecture/core/custom/custom_background.dart';

import '../../../../consts.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final passwordCondition = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
  final emailRegex = RegExp(r'^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$');
  bool showRPassword = false;
  bool showConfirmPassword = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final bodyProgress = Scaffold(
        body: Container(
          child: new Stack(
            children: <Widget>[
              new Container(
                alignment: AlignmentDirectional.center,
                decoration: new BoxDecoration(
                  color: Colors.white70,
                ),
                child: new Container(
                  decoration: new BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: new BorderRadius.circular(10.0)
                  ),
                  width: 300.0,
                  height: 200.0,
                  alignment: AlignmentDirectional.center,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Center(
                        child: new SizedBox(
                          height: 50.0,
                          width: 50.0,
                          child: new CircularProgressIndicator(
                            value: null,
                            strokeWidth: 7.0,
                          ),
                        ),
                      ),
                      new Container(
                        margin: const EdgeInsets.only(top: 25.0),
                        child: new Center(
                          child: new Text(
                            "Đang đăng kí",
                            style: new TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Đăng ký"),
        backgroundColor: Consts.appbarColor,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white,),
        ),
      ),
      body: Stack(
        children: <Widget>[
          /// Custom_background
          // Widget được viết ở lib/widgets/custom_background.dart
          CustomBackground(singleChildScrollView:true, content: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  /// logo
                  Padding(
                    padding: EdgeInsets.only(top:40),
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.white),
                      ),
                      child: Center(
                        child: Image(
                          height: 75,
                          image: AssetImage('images/logo_white.png'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  /// email
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      controller: emailController,
                      validator: (val){
                        return emailRegex.hasMatch(val??"") && val!=null?null:"email không hợp lệ";
                      },
                      style: TextStyle(
                          color: Colors.white
                      ),
                      decoration: buildInputDecoration().copyWith(
                          labelText: "Email"
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  /// password
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: showRPassword?false:true,
                      validator: (val){
                        return passwordCondition.hasMatch(val??"")? null:"ít nhất 8 kí tự bao gồm chữ và số";
                      },
                      style: TextStyle(
                          color: Colors.white
                      ),
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide:BorderSide(
                                width: 2,
                                color: Colors.redAccent
                            )
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide:BorderSide(
                                width: 2,
                                color: Colors.lightBlue[800]!
                            )
                        ),
                        suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              showRPassword = !showRPassword;
                            });
                          },
                          icon: Icon(
                            Icons.remove_red_eye,color: Colors.white,
                          ),
                        ),
                        contentPadding: EdgeInsets.only(left: 20),
                        labelText: "Mật khẩu",
                        alignLabelWithHint: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide:BorderSide(
                                width: 2,
                                color: Colors.white
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide:BorderSide(
                                width: 2,
                                color: Colors.lightBlue[800]!
                            )
                        ),
                        labelStyle: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  /// confirm
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      obscureText: showConfirmPassword?false:true,
                      validator: (val){
                        return passwordController.text==val?null:"mật khẩu không khớp";
                      },
                      style: TextStyle(
                          color: Colors.white
                      ),
                      decoration: InputDecoration(
                        suffixIcon: showConfirmPassword?IconButton(
                          onPressed: (){
                            setState(() {
                              showConfirmPassword = false;
                            });
                          },
                          icon: Icon(
                            Icons.remove_red_eye,color: Colors.white,
                          ),
                        ):
                        IconButton(
                          onPressed: (){
                            setState(() {
                              showConfirmPassword = true;
                            });
                          },
                          icon: Icon(
                            Icons.visibility_off,color: Colors.white,
                          ),
                        ),
                        contentPadding: EdgeInsets.only(left: 20),
                        labelText: "Nhập lại mật khẩu",
                        alignLabelWithHint: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide:BorderSide(
                                width: 2,
                                color: Colors.white
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide:BorderSide(
                                width: 2,
                                color: Colors.lightBlue[800]!
                            )
                        ),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide:BorderSide(
                                width: 2,
                                color: Colors.redAccent
                            )
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide:BorderSide(
                                width: 2,
                                color: Colors.lightBlue[800]!
                            )
                        ),
                        labelStyle: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(60, 45, 60, 0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.resolveWith<double>((states){
                          if (states.contains(MaterialState.pressed)
                              ||  states.contains(MaterialState.disabled)) {
                            return 0;
                          }
                          return 5;
                        }),
                      ),
                      onPressed: () async {
                        if(_formKey.currentState!.validate()){

                        }
                      },
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: <Color>[
                              Consts.buttonColor1,
                              Consts.buttonColor2,
                            ],
                          ),
                        ),
                        padding:EdgeInsets.all(10.0),
                        child: Center(
                            child: Text('Đăng ký', style: TextStyle(fontSize: 20))
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),)
        ],
      ),
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      contentPadding: EdgeInsets.only(left: 20),
      labelText: "",
      alignLabelWithHint: true,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide:BorderSide(
              width: 2,
              color: Colors.white
          )
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide:BorderSide(
              width: 2,
              color: Colors.lightBlue[800]!
          )
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide:BorderSide(
              width: 2,
              color: Colors.redAccent
          )
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide:BorderSide(
              width: 2,
              color: Colors.lightBlue[800]!
          )
      ),
      labelStyle: TextStyle(
          color: Colors.white
      ),
    );
  }
}
