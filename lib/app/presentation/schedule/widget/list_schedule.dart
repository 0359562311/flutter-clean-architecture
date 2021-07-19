import 'package:flutter/material.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/class.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/schedule.dart';
import 'package:flutter_app_clean_architecture/app/domain/use_cases/class/get_list_class_use_case.dart';
import 'package:flutter_app_clean_architecture/app/presentation/schedule/bloc/list_class_bloc.dart';
import 'package:flutter_app_clean_architecture/app/presentation/schedule/bloc/list_class_event.dart';
import 'package:flutter_app_clean_architecture/app/presentation/schedule/bloc/list_class_state.dart';
import 'package:flutter_app_clean_architecture/global_constants/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class ListSchedule extends StatefulWidget {
  const ListSchedule({Key? key}) : super(key: key);

  @override
  _ListScheduleState createState() => _ListScheduleState();
}

class _ListScheduleState extends State<ListSchedule> {
  final List<int> week= List.generate(20, (index) => index+1);
  late int dropdownvalue = 1;

  final ListClassBloc _bloc =
  ListClassBloc(GetIt.instance<GetListClassUseCase>())..add(ListClassFetchAllEvent());

  @override
  void dispose() {
    // TODO: implement dispose
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Thông tin lịch học'),
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
        body: BlocConsumer<ListClassBloc, ListClassState>(
          bloc: _bloc,
          listener: (context, state){
            if(state is ListClassErrorState){
              showDialog(context: context, builder: (context) => AlertDialog(
                content: Text(state.message),
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
          },
          buildWhen: (ole,newer) {
            return !(newer is ListClassErrorState);
          },
          builder:(context,state) {
            if(state is ListClassLoadingState)
              return Center(
                child: SizedBox(height: 50,width: 50,
                  child: CircularProgressIndicator(),
                ),
              );
            List<Classroom> classroom = [];
            if(state is ListClassCompleteState)
              classroom = state.classes;
            return Container(
            color: Color(0xFFEDF7FC),
                //List class
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:12.0,top: 8),
                     child: DropdownButton(
                       value: dropdownvalue,
                       icon: Icon(Icons.arrow_downward,color: Colors.black,),
                       underline: Container(
                         height: 2,
                         color: Colors.black,
                       ),
                       items: week.map((week) => DropdownMenuItem(
                         child: Text("Tuần $week", style: TextStyle(color: Colors.black,fontSize: 20),),
                         value: week,)).toList(),
                       onChanged: (int? newValue){
                         dropdownvalue = newValue!;
                         _bloc.add(ListClassFilterEvent(dropdownvalue));
                       },
                     ),
                   ),
                   Container(
                     height: 500,
                     child: ListView.separated(
                          padding: EdgeInsets.all(10),
                          itemCount: classroom.length,
                          itemBuilder: (context, position){
                            return InkWell(
                              onTap: (){
                               Navigator.of(context).pushNamed(AppRoutes.routeClassDetail,arguments: {
                                 "classroom": classroom[position],
                                 "week": dropdownvalue
                               });
                              },
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.lightBlueAccent.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 10,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            classroom[position].timeStart +'-' + classroom[position].timeEnd,
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                        Text(
                                            DateFormat("dd-MM-yyyy").format(classroom[position].date),
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 20,),
                                    Text(
                                      classroom[position].name,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 10,); },),
                   ),
                 ],
               ),

          );
          },
        )
      ),
    );
  }
}

class Classroom{
  Class inClass;
  late String timeStart;
  late String timeEnd;
  late String name;
  late DateTime date;
  Schedule schedule;

  Classroom({required this.inClass,required this.timeStart, required this.timeEnd,
    required this.name, required this.date, required this.schedule});
}