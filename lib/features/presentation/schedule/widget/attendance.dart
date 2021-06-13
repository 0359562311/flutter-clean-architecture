import 'package:flutter/material.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  List<String> student = List.generate(20, (index) => 'Student $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thống kê điểm danh'),
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
            buildListAttendance('Đã điểm danh', student),
            SizedBox(height: 20,),
            buildListAttendance('Chưa điểm danh', student),
          ],
        ),
      ),
    );
  }

  buildListAttendance(String title, List<String> list) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height/2.7,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(title, style: TextStyle(fontSize: 15),),
          ),
          Container(
            height: MediaQuery.of(context).size.height/3.3,
            margin: EdgeInsets.only(right: 10,left: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFFEDF7FC),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListView.builder(
                itemCount: student.length,
                itemBuilder: (context, position){
                  return Padding(
                      padding: EdgeInsets.all(8),
                    child: Text(
                      list[position],
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
