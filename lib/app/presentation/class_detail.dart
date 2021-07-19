import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/custom_user.dart';
import 'package:flutter_app_clean_architecture/app/presentation/schedule/widget/list_schedule.dart';
import 'package:flutter_app_clean_architecture/global_constants/app_routes.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class ClassDetail extends StatefulWidget {
  const ClassDetail({Key? key}) : super(key: key);

  @override
  _ClassDetailState createState() => _ClassDetailState();
}

class _ClassDetailState extends State<ClassDetail> {
  late Classroom _classroom;

  void initState(){
    super.initState();
  }

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
    _classroom = (ModalRoute.of(context)!.settings.arguments as Map)['classroom'];
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
                  buildText('Môn học: ' + _classroom.inClass.subject.subjectName,22.0),
                  buildText('Mã lớp: ' + _classroom.inClass.classId,22.0),
                  buildText('Mã môn: ' + _classroom.inClass.subject.subjectId,22.0),
                  buildText('Phòng học: ' + _classroom.schedule.classroom,22.0),
                  buildText('Thứ: ${_classroom.schedule.dayOfWeek}',22.0),
                  buildText('Thời gian bắt đầu: ' + _classroom.schedule.startAt,22.0),
                  buildText('Thời gian kết thúc: ' + _classroom.schedule.endAt,22.0),
                  buildText('Ngày: ${DateFormat("dd-MM-yyyy").format(_classroom.date)}',22.0),
                ],
              ),
            ),
            SizedBox(height: 40,),
            BuildButton(content:  'Xem Thống kê',callback: (){
              Navigator.of(context).pushNamed(AppRoutes.routeAttendance,arguments: {
                "scheduleId": _classroom.schedule.id,
                "week": (ModalRoute.of(context)!.settings.arguments as Map)['week']
              });
            },),
            SizedBox(height: 20,),
            if(GetIt.instance<CustomUser>().role == "GiangVien") BuildButton(content:  'Tạo mã điểm danh',
              callback: (){
                var now = DateTime.now().toUtc().add(Duration(hours: 7));
                if(now.
                  isBefore(
                      _classroom.date.add(
                          Duration(
                              hours: int.parse(_classroom.schedule.startAt.substring(0,2)),
                            minutes: int.parse(_classroom.schedule.startAt.substring(3))
                          )
                      )
                  ) ||
                    now.
                    isAfter(
                        _classroom.date.add(
                            Duration(
                                hours: int.parse(_classroom.schedule.endAt.substring(0,2)),
                                minutes: int.parse(_classroom.schedule.endAt.substring(3))
                            )
                        )
                    )
                ){
                  _showDialog(context, "Không thể tạo mã điểm danh ngoài giờ học");
                } else {
                  Navigator.of(context).pushNamed(AppRoutes.routeQRGenerator, arguments: {
                    "scheduleId": _classroom.schedule.id,
                    "week": (ModalRoute.of(context)!.settings.arguments as Map)['week']
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

class BuildButton extends StatelessWidget {
  final String content;
  final VoidCallback? callback;
  const BuildButton({
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