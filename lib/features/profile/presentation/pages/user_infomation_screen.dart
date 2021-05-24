import 'package:flutter/material.dart';
import 'package:flutter_app_clean_architecture/features/profile/domain/entities/profile.dart';
import 'package:flutter_app_clean_architecture/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter_app_clean_architecture/features/profile/presentation/bloc/profile_event.dart';
import 'package:flutter_app_clean_architecture/features/profile/presentation/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({Key? key}) : super(key: key);

  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  late final ProfileBloc _bloc;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  bool edit = false;
  @override

  void initState(){
    super.initState();
    _bloc = GetIt.instance<ProfileBloc>()..add(GetProfileEvent());
  }

  void dispose(){
    super.dispose();
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Color(0xFF2F82FF),
          leadingWidth: 50,
          titleSpacing: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
              size: 23,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Tài khoản',
            style: TextStyle(
                color: Colors.white, fontSize: 23, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          child: BlocConsumer<ProfileBloc,ProfileState>(
            bloc: _bloc,
            buildWhen: (_,newState) => !(newState is ProfileErrorState),
            listener: (context, state){
              if(state is ProfileErrorState){
                Navigator.push(
                    context,
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
              }
            },
            builder: (context, state){
              print(state);
              if(state is ProfileLoadingState)
                return Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                    )
                );
              Profile profile = (state as ProfileCompleteState).profile;
              DateFormat dateFormat = DateFormat("dd/MM/yyyy");
              return Container(
                  color: Colors.white,
                  height: size.height,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        buildTextFormField('Họ và Tên', profile.name??"", false,nameController),
                        buildTextFormField('Ngày sinh', dateFormat.format(profile.dob??DateTime(2000,12,3)), false,dobController),
                        buildTextFormField('Giới tính', profile.gender??"", false,genderController),
                        buildTextFormField('Số điện thoại', profile.phoneNumber??"", edit,phoneNumberController),
                        buildTextFormField(
                            'Email', profile.email??"", edit,emailController),
                        buildTextFormField('Địa chỉ', profile.address??"", edit,addressController),
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          width: 180,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueAccent,
                                textStyle: const TextStyle(fontSize: 22),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                            ),
                            onPressed: () {
                              setState(() {
                                edit = !edit;
                              });
                            },
                            child:  Text( (edit == false) ? 'Chỉnh sửa' : 'Hoàn tất'),
                          ),
                        ),
                      ],
                      // ),
                    ),
                  ));
            }
          ),
        ),
      ),
    );
  }
}

Widget buildTextFormField(String labelText, String hintText, bool edit, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.only(top: 5.0),
    child: TextFormField(
      controller: controller,
      autofocus: true,
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
        enabled: edit
      ),
      readOnly: !edit,
    ),
  );
}
