import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_clean_architecture/features/presentation/schedule/widget/attendance.dart';
import 'package:flutter_app_clean_architecture/global/app_routes.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class ClassDetail extends StatefulWidget {
  const ClassDetail({Key? key}) : super(key: key);

  @override
  _ClassDetailState createState() => _ClassDetailState();
}

class _ClassDetailState extends State<ClassDetail> {

  _Classroom _classroom =_Classroom(idClass: 'INT1340-20202-06',
      idSubject: 'INT1340', nameSubject: 'Công nghệ phần mềm', room: '205-A3',
      day: '2', timeStart: '18:00', timeEnd: '19:50');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Chi tiết lớp học'),
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
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Color(0xFFEDF7FC),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Container(
              height: 290,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color:
                    Colors.lightBlueAccent.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  buildText('Môn học: ' + _classroom.nameSubject,22.0),
                  buildText('Mã lớp: ' + _classroom.idClass,22.0),
                  buildText('Mã môn: ' + _classroom.idSubject,22.0),
                  buildText('Phòng học: ' + _classroom.room,22.0),
                  buildText('Thứ: ' + _classroom.day,22.0),
                  buildText('Thời gian bắt đầu: ' + _classroom.timeStart,22.0),
                  buildText('Thời gian kết thúc: ' + _classroom.timeEnd,22.0),

                ],
              ),
            ),
            SizedBox(height: 40,),
            SizedBox(
              height: 50,
              width: 230,
              child: ElevatedButton(
                onPressed: () {
                  pushNewScreenWithRouteSettings(
                    context,
                    settings: RouteSettings(name: AppRoutes.routeAttendance),
                    withNavBar: false,
                    screen: Attendance(),
                    pageTransitionAnimation: PageTransitionAnimation.rotate,
                  );
                },
                child: Text(
                  'Xem Thống kê',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shadowColor: Colors.blueAccent,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildText(String text, var size) {
    return Padding(
        padding: EdgeInsets.only(left: 10,top: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.w400
        ),
      ),
    );
  }
}

class _Classroom{
  late String idClass;
  late String idSubject;
  late String nameSubject;
  late String room;
  late String day;
  late String timeStart;
  late String timeEnd;

  _Classroom({required this.idClass, required this.idSubject, required this.nameSubject,
    required this.room, required this.day, required this.timeStart, required this.timeEnd});
}