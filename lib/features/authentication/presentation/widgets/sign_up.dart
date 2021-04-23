import 'package:flutter/material.dart';
import 'package:flutter_app_clean_architecture/core/custom/custom_background.dart';
import 'package:flutter_app_clean_architecture/features/authentication/presentation/bloc/sign_up_bloc.dart';
import 'package:flutter_app_clean_architecture/features/authentication/presentation/bloc/sign_up_event.dart';
import 'package:flutter_app_clean_architecture/features/authentication/presentation/bloc/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../consts.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final passwordCondition = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
  final emailRegex = RegExp(r'^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$');
  // bool showRPassword = false;
  bool showConfirmPassword = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final SignUpBloc _bloc;

  void initState(){
    super.initState();
    _bloc = GetIt.instance.get<SignUpBloc>();
  }

  @override
  Widget build(BuildContext context) {

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
      body: BlocProvider.value(
        value: _bloc,
        child: BlocConsumer<SignUpBloc,SignUpState>(
          listener: (context,state){
            if (state is SignUpErrorState){
              Navigator.push(context, MaterialPageRoute(
                  builder: (dialogueContext) => AlertDialog(
                    content: Text(state.message),
                    actions: [
                      TextButton(
                          onPressed: (){
                            Navigator.pop(dialogueContext);
                          },
                          child: Text("Close")
                      )
                    ],
                  )
              ));
            }
            else if (state is SignUpSuccessfulState){
              Navigator.push(context, MaterialPageRoute(
                  builder: (dialogueContext) => AlertDialog(
                    content: Text("Sign up successful"),
                    actions: [                        
                      TextButton(
                          onPressed: (){
                            Navigator.popUntil(context, (route) => route.settings.name == '/');
                          },
                          child: Text("Close")
                      )
                    ],
                  )
              ));
            }
          },
          buildWhen: (_,current){
            return current is SignUpLoadingState || current is SignUpErrorState;
          },
          builder: (context,state){
            if(state is SignUpLoadingState)
              return Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
              );
            return Stack(
              children: <Widget>[
                /// Custom_background
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
                            obscureText: showConfirmPassword,
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
                                    showConfirmPassword = !showConfirmPassword;
                                  });
                                },
                                icon: Icon(
                                  showConfirmPassword?Icons.remove_red_eye:Icons.visibility_off,color: Colors.white,
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
                            obscureText: showConfirmPassword,
                            validator: (val){
                              return passwordController.text==val?null:"mật khẩu không khớp";
                            },
                            style: TextStyle(
                                color: Colors.white
                            ),
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: (){
                                  setState(() {
                                    showConfirmPassword = !showConfirmPassword;
                                  });
                                },
                                icon: Icon(
                                  showConfirmPassword?Icons.remove_red_eye:Icons.visibility_off,color: Colors.white,
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
                          child: GestureDetector(
                            onTap: () async {
                              if(_formKey.currentState!.validate()){
                                _bloc.add(SignUpEvent.signUp(emailController.text, passwordController.text));
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
                                  child: Text('Đăng ký', style: TextStyle(fontSize: 20, color: Colors.white))
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),)
              ],
            );
          }
        ),
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
