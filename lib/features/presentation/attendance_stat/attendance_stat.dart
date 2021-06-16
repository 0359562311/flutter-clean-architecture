import 'package:flutter/material.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/attendance.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/class.dart';
import 'package:flutter_app_clean_architecture/features/domain/entities/schedule.dart';
import 'package:flutter_app_clean_architecture/features/presentation/attendance_stat/bloc/attendance_stat_bloc.dart';
import 'package:flutter_app_clean_architecture/features/presentation/attendance_stat/bloc/attendance_stat_event.dart';
import 'package:flutter_app_clean_architecture/features/presentation/attendance_stat/bloc/attendance_stat_state.dart';
import 'package:flutter_app_clean_architecture/global/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class AttendanceStat extends StatefulWidget {
  const AttendanceStat({Key? key}) : super(key: key);

  @override
  _AttendanceStatState createState() => _AttendanceStatState();
}

class _AttendanceStatState extends State<AttendanceStat> {

  late AttendanceStatBloc _bloc;

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
    
      _bloc = AttendanceStatBloc(GetIt.instance());
    }
  
  @override
    void dispose() {
      // TODO: implement dispose
      _bloc.close();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    Class cl = (ModalRoute.of(context)?.settings.arguments as Map)['class'];
    Schedule schedule = (ModalRoute.of(context)?.settings.arguments as Map)['schedule'];
    DateTime dateTime = (ModalRoute.of(context)?.settings.arguments as Map)['date'];
    _bloc.add(AttendanceStatInitEvent(cl, schedule, dateTime));
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
        child: BlocConsumer<AttendanceStatBloc,AttendanceStatState>(
          bloc: _bloc,
          listener: (_, state) {
            if(state is AttendanceErrorState)
              showDialog(context: context, builder: (context) => AlertDialog(
                content: Text(state.message),
                actions: [
                  GestureDetector(
                    onTap: (){
                      Navigator.popUntil(context, ModalRoute.withName(AppRoutes.routeClassDetail));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                      child: Text("Đóng"),
                    ),
                  )
                ],
              ));
          },
          buildWhen: (prev, next) {
            return !(next is AttendanceErrorState);
          },
          builder: (context, state) {
            if(state is AttendanceCompleteState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  buildListAttendance('Đã điểm danh', state.attendances.where((element) => element.registerAt != null).toList(),false),
                  SizedBox(height: 20,),
                  buildListAttendance('Chưa điểm danh', state.attendances.where((element) => element.registerAt == null).toList(),true),
                ],
              );
            }
            return Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }

  buildListAttendance(String title, List<Attendance> list, bool isNull) {
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
                itemCount: list.length,
                itemBuilder: (context, position){
                  return Padding(
                      padding: EdgeInsets.all(8),
                    child: Text(
                      _getAttendanceItem(list, position, isNull),
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

  String _getAttendanceItem(List<Attendance> list, int position, bool isNull) {
    var temp = isNull?"":"${DateFormat("HH:mm").format(list[position].registerAt!)}\n";
    return "${list[position].maSV}\n" + temp;
  }
}
