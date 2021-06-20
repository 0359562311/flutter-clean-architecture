import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_clean_architecture/global/app_routes.dart';
import 'package:flutter_app_clean_architecture/features/presentation/authentication/bloc/login_bloc.dart';
import 'package:flutter_app_clean_architecture/features/presentation/authentication/bloc/login_event.dart';
import 'package:flutter_app_clean_architecture/features/presentation/authentication/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // final passwordCondition = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
  bool showPassword = false;
  late LoginBloc _bloc;
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

  void initState() {
    super.initState();
    _bloc = LoginBloc(loginWithEmailAndPassword: GetIt.instance());
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  void dispose() {
    super.dispose();
    _bloc.close();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: BlocProvider<LoginBloc>.value(
            value: _bloc,
            child: BlocConsumer<LoginBloc, LoginState>(
              listener: (_, state) {
                if (state is LogInError)
                  showDialog(context: context, builder: (context) => AlertDialog(
                    content: Text(state.message),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Close"))
                    ],
                  ));
                else if (state is LogInSuccess)
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.routeMain, (route) => false,);
              },
              buildWhen: (previous, current) {
                return !(current is LogInSuccess);
              },
              builder: (context, state) {
                if (state is LoadingState)
                  return Center(
                      child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(),
                  ));
                return Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      //Header
                      Container(
                        height: size.height * 0.45,
                        width: size.width,
                        // color: Colors.blue,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/fake_slink/header.jpg'),
                                fit: BoxFit.fill)),
                      ),
                      //Account
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: TextFormField(
                          controller: _usernameController,
                          obscureText: false,
                          validator: (value) {
                            if(value == null || value.isEmpty) {
                              return "Không được bỏ trống.";
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: Colors.blue[600],
                              size: 28,
                            ),
                            labelText: 'Tài khoản',
                            contentPadding: EdgeInsets.only(left: 50),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)
                              )
                          ),
                          // style: TextStyle(fontSize: 18),
                        ),
                      ),
                      //Password
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
                        child: TextFormField(
                          controller: _passwordController,
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Mật khẩu không được bỏ trống";
                            }
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
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)
                            )
                          ),
                          obscureText: showPassword ? false : true,
                        ),
                      ),
                      //ForgetPassword
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       vertical: 20, horizontal: 20),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     children: <Widget>[
                      //       InkWell(
                      //         onTap: () {},
                      //         child: Text(
                      //           'Quên mật khẩu?',
                      //           style: TextStyle(
                      //               color: Colors.blue,
                      //               fontStyle: FontStyle.italic,
                      //               // fontWeight: FontWeight.bold,
                      //               fontSize: 15),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
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
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _bloc.add(LogInEvent.logInWithUsernameAndPassWord(
                                        _usernameController.text,
                                        _passwordController.text));
                                  }
                                },
                                color: Colors.blue[400],
                                child: Text(
                                  'Đăng nhập',
                                  style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
