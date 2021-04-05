import 'package:flutter/material.dart';
import 'package:flutter_app_clean_architecture/consts.dart';
import 'package:flutter_app_clean_architecture/core/custom/custom_background.dart';
import 'package:flutter_app_clean_architecture/features/authentication/data/repositories/login_repository_impl.dart';
import 'package:flutter_app_clean_architecture/features/authentication/data/sources/login_remote_sources.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/usecases/login_with_email_and_password.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/usecases/login_with_facebook.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/usecases/login_with_google.dart';
import 'package:flutter_app_clean_architecture/features/authentication/presentation/bloc/login_bloc.dart';
import 'package:flutter_app_clean_architecture/features/authentication/presentation/bloc/login_event.dart';
import 'package:flutter_app_clean_architecture/features/authentication/presentation/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final passwordCondition = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
  final emailRegex = RegExp(r'^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$');
  bool showPassword = false;
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final bodyProgress = Scaffold(
    body: Container(
      child: new Stack(
        children: <Widget>[
          new Container(
            alignment: AlignmentDirectional.center,
            decoration: new BoxDecoration(
              color: Consts.appbarColor,
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
                        "Đang đăng nhập",
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

  late LoginBloc _bloc;

  void initState(){
    super.initState();
    final _repository = LoginRepositoryImpl(LoginFirebaseSource());
    _bloc = LoginBloc(
      loginWithEmailAndPassword: LoginWithEmailAndPassword(_repository),
      loginWithFacebook: LoginWithFacebook(_repository),
      loginWithGoogle: LoginWithGoogle(_repository)
    );
  }

  void dispose(){
    super.dispose();
    _bloc.close();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Đăng nhập"),
          backgroundColor: Consts.appbarColor,
          elevation: 0,
        ),
        body: BlocProvider<LoginBloc>.value(
          value: _bloc,
          child: BlocConsumer<LoginBloc,LoginState>(
            listener: (context1,state){
              if(state is LogInError) Navigator.push(context1, MaterialPageRoute(
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
              else if (state is LogInSuccess) Navigator.push(context1, MaterialPageRoute(
                  builder: (dialogueContext) => AlertDialog(
                    content: Text("Log in successful"),
                    actions: [
                      TextButton(
                          onPressed: (){
                            Navigator.pushNamedAndRemoveUntil(dialogueContext, 'home', (route) => false);
                          },
                          child: Text("Close")
                      )
                    ],
                  )
              ));
            },
            buildWhen: (previous,current){
              return false;
            },
            builder: (context,state){
              if(state is LoadingState)
                return Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(),
                  )
                );
              return CustomBackground(
                singleChildScrollView: true,
                content: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      /// logo
                      Padding(
                        padding: const EdgeInsets.only(top: 30,bottom: 15),
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: (Colors.lightBlueAccent[200])!,
                                  blurRadius: 20,
                                  offset: Offset(0,0)
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Image(
                              image: AssetImage("images/logo_color.png"),
                            ),
                          ),
                        ),
                      ),
                      /// app name
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Text("ĐỘI NGŨ GIA SƯ 4.0",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          ),
                        ),
                      ),
                      /// email
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          validator: (val) => !emailRegex.hasMatch(emailController.text)? "Email không hợp lệ":null,
                          controller: emailController,
                          style: TextStyle(
                              color: Colors.white
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 20),
                            labelText: "Email",
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
                                    color: (Colors.lightBlue[800])!
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
                                    color: (Colors.lightBlue[800])!
                                )
                            ),
                            labelStyle: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      /// password
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          // validator: (val) => !passwordCondition.hasMatch(val)?"Mật khẩu không hợp lệ":null,
                          controller: passwordController,
                          style: TextStyle(
                              color: Colors.white
                          ),
                          decoration: InputDecoration(
                            suffixIcon: showPassword?IconButton(
                              onPressed: (){
                                setState(() {
                                  showPassword = false;
                                });
                              },
                              icon: Icon(
                                Icons.remove_red_eye,color: Colors.white,
                              ),
                            ):IconButton(
                              onPressed: (){
                                setState(() {
                                  showPassword = true;
                                });
                              },
                              icon: Icon(
                                Icons.visibility_off,color: Colors.white,
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
                                    color: (Colors.lightBlue[800])!
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
                                    color: (Colors.lightBlue[800])!
                                )
                            ),
                            labelStyle: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          obscureText: showPassword?false:true,
                        ),
                      ),
                      /// quen mat khau (forgot password)
                      Padding(
                        padding: EdgeInsets.only(right: 45),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            child: Text("Quên mật khẩu?",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                decoration: TextDecoration.underline,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: (){
                              print("pressed Quen mat khau");
                              Navigator.pushNamed(context, Consts.routeforgot_password);
                            },
                          ),
                        ),
                      ),
                      /// Đăng nhập
                      Container(
                        height: 40,
                        width: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Consts.buttonColor1,
                                  Consts.buttonColor2,
                                ]
                            )
                        ),
                        child: TextButton(
                          child: Text("Đăng nhập",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16
                            ),
                          ),
                          onPressed: () async {
                            if(_formKey.currentState!.validate()){
                              _bloc.add(LogInEvent.logInWithEmailAndPassWord(emailController.text, passwordController.text));
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      /// Đăng ký
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "____________",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 3,
                                      decorationColor: Colors.white,
                                      fontSize: 12
                                  ),
                                ),
                              ),
                              TextButton(
                                child: Text(
                                  "Đăng ký",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16
                                  ),
                                ),
                                onPressed: (){
                                  Navigator.pushNamed(context, Consts.routeregister);
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "____________",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 3,
                                      decorationColor: Colors.white,
                                      fontSize: 12
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
            },
          ),
        )
    );
  }
}
