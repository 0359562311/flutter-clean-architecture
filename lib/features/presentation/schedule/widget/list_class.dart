import 'package:flutter/material.dart';
import 'package:flutter_app_clean_architecture/features/presentation/schedule/widget/class_detail.dart';
import 'package:flutter_app_clean_architecture/global/app_routes.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class ListClass extends StatefulWidget {
  const ListClass({Key? key}) : super(key: key);

  @override
  _ListClassState createState() => _ListClassState();
}

class _ListClassState extends State<ListClass> {
  final List<String> week= List.generate(20, (index) => 'Tuần $index');
  late String dropdownvalue = 'Tuần 1';
  final List<Classroom> classroom = List.generate(20,
          (index) => Classroom( timeStart: '$index', timeEnd: '$index',
              name: 'Công nghệ phần mềm', date: '$index/$index/2021'));

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
        body: Container(
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
                       child: Text(week, style: TextStyle(color: Colors.black,fontSize: 20),),
                       value: week,)).toList(),
                     onChanged: (String? newValue){
                       setState(() {
                         dropdownvalue = newValue!;
                       });
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
                             Navigator.of(context).pushNamed(AppRoutes.routeClassDetail);
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
                                          classroom[position].timeStart +'AM - ' + classroom[position].timeEnd + 'AM',
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                      Text(
                                          classroom[position].date,
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
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 10,); },),
                 ),
               ],
             ),

        )
      ),
    );
  }
}

class Classroom{
  late String timeStart;
  late String timeEnd;
  late String name;
  late String date;

  Classroom({required this.timeStart, required this.timeEnd,
    required this.name, required this.date});
}