import 'package:flutter/material.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({Key? key}) : super(key: key);

  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  bool edit = false;
  @override
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
          child: Container(
              color: Colors.white,
              height: size.height,
              child: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildTextFormField('Họ và Tên', 'Lê Minh Quang', true),
                    buildTextFormField('Ngày sinh', '07/05/2000', true),
                    buildTextFormField('Giới tính', 'Nam', true),
                    buildTextFormField('Số điện thoại', '0363215756', edit),
                    buildTextFormField(
                        'Email', 'Leminhquang752000@gmail.com', edit),
                    buildTextFormField('Địa chỉ', 'Hà Nội', edit),
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
                            if(edit) edit = false;
                            else edit = true;
                          });
                        },
                        child:  Text( (edit == false) ? 'Chỉnh sửa' : 'Hoàn tất'),
                      ),
                    ),
                  ],
                  // ),
                ),
              )),
        ),
      ),
    );
  }
}

Widget buildTextFormField(String labelText, String hintText, bool read) {
  return Padding(
    padding: const EdgeInsets.only(top: 5.0),
    child: TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      readOnly: read,
    ),
  );
}
