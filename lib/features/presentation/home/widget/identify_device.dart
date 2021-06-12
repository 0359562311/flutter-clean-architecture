import 'package:flutter/material.dart';
import 'package:flutter_app_clean_architecture/features/presentation/home/bloc/identify_device_bloc.dart';
import 'package:flutter_app_clean_architecture/features/presentation/home/bloc/identify_device_event.dart';
import 'package:flutter_app_clean_architecture/features/presentation/home/bloc/identify_device_state.dart';
import 'package:flutter_app_clean_architecture/global/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IdentifyDeviceDialog extends StatefulWidget {
  const IdentifyDeviceDialog({Key? key}) : super(key: key);

  @override
  _IdentifyDeviceDialogState createState() => _IdentifyDeviceDialogState();
}

class _IdentifyDeviceDialogState extends State<IdentifyDeviceDialog> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final IdentifyDeviceBloc _bloc = IdentifyDeviceBloc();

  @override
  void dispose() {
    // TODO: implement dispose
    _passwordController.dispose();
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<IdentifyDeviceBloc, IdentifyDeviceState>(
      bloc: _bloc,
      listener: (context,state){
        if(state is IdentifyDeviceSuccessfulState){
          showDialog(context: context, builder:(context) => AlertDialog(
            content: Text("Định danh thành công"),
            actions: [
              GestureDetector(
                onTap: (){
                  Navigator.popUntil(context, (route) => route.settings.name == AppRoutes.routeMain);
                },
                child: Text("Đóng",
                  style: TextStyle(color: Colors.red),
                ),
              )
            ],
          ));
        } else if (state is IdentifyDeviceErrorState) {
          showDialog(context: context, builder:(context) => AlertDialog(
            title: Text("Lỗi"),
            content: Text(state.message),
            actions: [
              GestureDetector(
                onTap: (){
                  Navigator.popUntil(context, (route) => route.settings.name == AppRoutes.routeMain);
                },
                child: Text("Đóng",
                  style: TextStyle(color: Colors.red),
                ),
              )
            ],
          ));
        }
      },
      builder:(context,state) => Container(
        width: MediaQuery.of(context).size.width-50,
        height: 200,
        child: Dialog(
          insetAnimationCurve: Curves.fastOutSlowIn,
          insetAnimationDuration: Duration(milliseconds: 300),
          shape: Border.symmetric(),
          child: Column(
            children: [
              Text("Thiết bị của bạn chưa bị định danh."),
              Text("Nhập mật khẩu để định danh bằng thiết bị này"),
              Form(
                key: _formKey,
                child: TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value){
                    if(value == null || value.isEmpty) {
                      return "Không được để trống.";
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Mật khẩu",
                    errorStyle: TextStyle(color: Colors.red),
                    prefixIcon: Icon(Icons.lock)
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      if(!(state is IdentifyDeviceLoadingState) && _formKey.currentState!.validate()){
                        _bloc.add(IdentifyDeviceConfirmEvent(_passwordController.text));
                      }
                    },
                    child: Text(
                      "Định danh",
                      style: TextStyle(
                        color: state is IdentifyDeviceLoadingState?Colors.grey:Colors.blue
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Hủy",
                      style: TextStyle(
                          color: Colors.blue
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}