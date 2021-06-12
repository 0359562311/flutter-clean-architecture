import 'package:flutter/material.dart';

class ListClass extends StatefulWidget {
  const ListClass({Key? key}) : super(key: key);

  @override
  _ListClassState createState() => _ListClassState();
}

class _ListClassState extends State<ListClass> {

  final List<Classroom> classroom = List.generate(20,
          (index) => Classroom( timeStart: '$index', timeEnd: '$index',name: 'Công nghệ phần mềm'));

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
          child: ListView.separated(
              padding: EdgeInsets.all(10),
            itemCount: classroom.length,
              itemBuilder: (context, position){
                return InkWell(
                  onTap: (){

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
                        SizedBox(width: 20,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                classroom[position].timeStart +'AM',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text('-',style: TextStyle(
                              fontSize: 15,
                            ),),
                            Text(
                                classroom[position].timeEnd + 'AM',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 30,),
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
        )
      ),
    );
  }
}

class Classroom{
  late String timeStart;
  late String timeEnd;
  late String name;

  Classroom({required this.timeStart, required this.timeEnd, required this.name});
}