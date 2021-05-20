import 'package:flutter/material.dart';
import 'package:flutter_app_clean_architecture/constants.dart';
import 'package:flutter_app_clean_architecture/features/authentication/presentation/bloc/login_bloc.dart';
import 'package:flutter_app_clean_architecture/features/authentication/presentation/bloc/login_event.dart';
import 'package:flutter_app_clean_architecture/features/authentication/presentation/bloc/login_state.dart';
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
  late final TextEditingController accountController;
  late final TextEditingController passwordController;

  void initState() {
    super.initState();
    _bloc = GetIt.instance<LoginBloc>();
    accountController = TextEditingController();
    passwordController = TextEditingController();
  }

  void dispose() {
    super.dispose();
    _bloc.close();
    accountController.dispose();
    passwordController.dispose();
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
              listener: (context1, state) {
                if (state is LogInError)
                  Navigator.push(
                      context1,
                      MaterialPageRoute(
                          builder: (dialogueContext) => AlertDialog(
                                content: Text(state.message),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(dialogueContext);
                                      },
                                      child: Text("Close"))
                                ],
                              )));
                else if (state is LogInSuccess)
                  Navigator.pushNamedAndRemoveUntil(
                      context1, Constants.routeMain, (route) => false);
              },
              buildWhen: (previous, current) {
                return !(current is LogInSuccess);
              },
              builder: (context, state) {
                print(state);
                if (state is LoadingState)
                  return Center(
                      child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(),
                  ));
                return Column(
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
                        controller: accountController,
                        obscureText: false,
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
                      padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
                      child: TextFormField(
                        controller: passwordController,
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
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
                                  fontSize: 15),
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
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              onPressed: () {
                                _bloc.add(LogInEvent.logInWithEmailAndPassWord(
                                    accountController.text,
                                    passwordController.text));
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
