import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_clean_architecture/core/utils.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/class.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/custom_user.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/schedule.dart';
import 'package:flutter_app_clean_architecture/global/app_routes.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class ClassDetail extends StatefulWidget {
  const ClassDetail({Key? key}) : super(key: key);

  @override
  _ClassDetailState createState() => _ClassDetailState();
}

class _ClassDetailState extends State<ClassDetail> {

  void _showDialog(context, message) {
    showDialog(context: context, builder: (context) => AlertDialog(
      content: Text(message),
      actions: [
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4,vertical: 4),
            child: Text("Đóng"),
          ),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    Class cl = (ModalRoute.of(context)!.settings.arguments as Map)['class'];
    DateTime date = (ModalRoute.of(context)!.settings.arguments as Map)['date'];
    Schedule schedule = (ModalRoute.of(context)!.settings.arguments as Map)['schedule'];
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  buildText('Môn học: ' + cl.tenMonHoc,22.0),
                  buildText('Mã lớp: ' + cl.maLopHoc,22.0),
                  buildText('Mã môn: ' + cl.maMonHoc,22.0),
                  buildText('Phòng học: ' + schedule.phongHoc,22.0),
                  buildText('Thứ: ${schedule.thuHoc}',22.0),
                  buildText('Thời gian bắt đầu: ' + schedule.thoiGianBatDau,22.0),
                  buildText('Thời gian kết thúc: ' + schedule.thoiGianKetThuc,22.0),
                  buildText('Ngày: ${DateFormat("dd-MM-yyyy").format(date)}',22.0),
                ],
              ),
            ),
            SizedBox(height: 40,),
            buildButton(content:  'Xem Thống kê',callback: (){
              Navigator.of(context).pushNamed(AppRoutes.routeAttendance,arguments: {
                "class": cl,
                "schedule": schedule,
                "date": date
              });
            },),
            SizedBox(height: 20,),
            if(GetIt.instance<CustomUser>().role == "GiangVien") buildButton(content:  'Tạo mã điểm danh',
              callback: (){
                var now = DateTime.now().toUtc().add(Duration(hours: 7));
                if(now.
                  isBefore(
                      date.add(
                          Duration(
                              hours: int.parse(schedule.thoiGianBatDau.substring(0,2)),
                            minutes: int.parse(schedule.thoiGianBatDau.substring(3))
                          )
                      )
                  ) ||
                    now.
                    isAfter(
                        date.add(
                            Duration(
                                hours: int.parse(schedule.thoiGianKetThuc.substring(0,2)),
                                minutes: int.parse(schedule.thoiGianKetThuc.substring(3))
                            )
                        )
                    )
                ){
                  _showDialog(context, "Không thể tạo mã điểm danh ngoài giờ học");
                } else {
                  Navigator.of(context).pushNamed(AppRoutes.routeQRGenerator, arguments: {
                    "maLopHoc": cl.maLopHoc,
                    "maMonHoc": cl.maMonHoc,
                    "thoiGianBatDau": schedule.thoiGianBatDau,
                    "thoiGianKetThuc": schedule.thoiGianKetThuc
                  });
                }
              },
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
        maxLines: 3,
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.w400
        ),
      ),
    );
  }
}

class buildButton extends StatelessWidget {
  final String content;
  final VoidCallback? callback;
  const buildButton({
    Key? key, required this.content, this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 200,
      child: ElevatedButton(
        onPressed: callback,
        child: Text(
          content,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20
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
      //Qr Generate
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