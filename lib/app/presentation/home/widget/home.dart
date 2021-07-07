import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_clean_architecture/core/utils/device_info.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/custom_user.dart';
import 'package:flutter_app_clean_architecture/global_constants/app_routes.dart';
import 'package:flutter_app_clean_architecture/app/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_app_clean_architecture/app/presentation/home/bloc/home_events.dart';
import 'package:flutter_app_clean_architecture/app/presentation/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'identify_device.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

double screenWidth = 0;

class _HomeState extends State<Home> {
  late Items _items1;

  Items _items2 =
      new Items(title: "Thời khóa biểu", img: 'assets/images/fake_slink/schedule2.png',
          onPressed: (context){
            Navigator.of(context).pushNamed(AppRoutes.routeListClass);
          }
      );


  late Items _items4;

  Items _items5 = new Items(
      title: "Thay đổi thiết bị định danh", img: 'assets/images/fake_slink/phone.png',
    onPressed: (_){}
  );

  late HomeBloc _bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = HomeBloc(getUserInformation: GetIt.instance())..add(HomeEvent.init());
    _items1 = new Items(
        title: "Điểm danh", img: 'assets/images/fake_slink/qrscan.png',
        onPressed: (context) async {
          if(GetIt.instance<CustomUser>().deviceData?.deviceId != PlatformInfo.deviceId){
            _showDialog(context, "Tài khoản được định danh với thiết bị khác.");
          }
          else {
            Navigator.of(context).pushNamed(AppRoutes.routeQRScan);
          }
        }
    );
    _items4 = new Items(
        title: "Định danh thiết bị", img: 'assets/images/fake_slink/phone.png',
        onPressed: (_) async {
          if(GetIt.instance<CustomUser>().deviceData?.deviceId != null && GetIt.instance<CustomUser>().role == "Student"){
            _showDialog(context, "Tài khoản đã được định danh");
          }else {
            await showDialog(context: context, builder: (context) => IdentifyDeviceDialog());
            _bloc.add(HomeEvent.init());
          }
        }
    );
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
            child: Text("Đóng",
              style: TextStyle(
                color: Colors.red
              ),
            ),
          ),
        )
      ],
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    //1 diem danh 2 thoi khoa bieu 4 dinh danh thiet bi 5 Thay doi dinh danh
    List<Items> listSinhVien = [_items1, _items2, _items4];
    List<Items> listGiangVien = [ _items2, _items5];
    List<Items> listAdmin = [_items5];

    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/fake_slink/back_ground.jpg'),
                fit: BoxFit.fill)),
        child: BlocConsumer<HomeBloc,HomeState>(
          bloc: _bloc,
          listener: (context,state){
            if(state is HomeErrorState) Navigator.push(
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
            else if(state is HomeComplete) {
              if(state.customUser.deviceData?.deviceId == null && state.customUser.role == "Student") {
                showDialog(context: context, builder: (context) => AlertDialog(
                  content: Text("Tài khoản của bạn chưa được định danh"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Close"))
                  ],
                ));
              }
            }
          },
          buildWhen: (context,state) => !(state is HomeErrorState),
          builder: (context,state){
            if(state is HomeLoading)
              return Center(child: SizedBox(
                  child: CircularProgressIndicator(),
                height: 50,
                width: 50,
              ),);
            CustomUser userInHome = (state as HomeComplete).customUser;
            print(userInHome);
            if(userInHome.role.compareTo('Student') == 0){
              return HomeOption(userInHome: userInHome, list: listSinhVien,);
            }
            else if( userInHome.role.compareTo('Lecturer') == 0){
              return HomeOption(userInHome: userInHome, list: listGiangVien,);
            }
            else return HomeOption(userInHome: userInHome, list: listAdmin,);
          },
        ),
      ),
    );
  }
}

class HomeOption extends StatelessWidget {
  const HomeOption({
    Key? key,
    required this.userInHome,
    required this.list,

  }) : super(key: key);

  final CustomUser userInHome;
  final List<Items> list;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: SliverHeaderChildDelegateImpl(userInHome),
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
            child: Text(
              "Chức năng:",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverGrid.count(
            crossAxisCount: 1,
            childAspectRatio: 4,
            children: list.map((data) {
              return GestureDetector(
                onTap: (){
                  data.onPressed(context);
                },
                child: Container(
                  // padding: EdgeInsets.only(left: 10,right: 10),
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(data.img),
                                      fit: BoxFit.contain)),
                            )
                        ),
                        SizedBox(width: 10,),
                        Text(
                          data.title,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    )
                ),
              );
            }).toList()),
      ],
    );
  }
}

class SliverHeaderChildDelegateImpl extends SliverPersistentHeaderDelegate {
  final double _maxExtent = 180;
  final double? _minExtent = 80;
  final CustomUser userInHome;
  SliverHeaderChildDelegateImpl(this.userInHome);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return SizedBox(
      width: screenWidth,
      height: maxExtent - shrinkOffset < 80 ? 80 : maxExtent - shrinkOffset,
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          SizedBox(
            // child: Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            //   child: TextFormField(
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(25.0),
            //       ),
            //       enabledBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(25.0),
            //           borderSide: BorderSide(
            //             color: Colors.white,
            //             width: 0.0,
            //           )),
            //       prefixIcon: Icon(
            //         Icons.search,
            //         color: Colors.white,
            //         size: 28,
            //       ),
            //       hintText: 'Tìm kiếm',
            //       contentPadding:
            //           EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            //       fillColor: Color.fromRGBO(171, 231, 255, 0.7),
            //       filled: true,
            //     ),
            //     // style: TextStyle(fontSize: 18),
            //   ),
            // ),
            width: screenWidth,
            height: maxExtent - 80 - shrinkOffset < 0
                ? 0
                : maxExtent - 80 - shrinkOffset,
          ),
          Positioned(
            bottom: 0,
            left: shrinkOffset > 100 ? 0 : (-shrinkOffset + 100) / 4,
            right: shrinkOffset > 100 ? 0 : (-shrinkOffset + 100) / 4,
            height: 80,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(maxExtent - shrinkOffset < 80 ? 0 : 10)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2, offset: Offset(0, 2), color: Colors.grey)
                  ]),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 100,
                    padding: EdgeInsets.all(10),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        "assets/images/fake_slink/icon_user.png",
                        color: Colors.blue,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        userInHome.name,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        "Vai trò: ${userInHome.role}",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => _maxExtent;

  @override
  // TODO: implement minExtent
  double get minExtent => _minExtent ?? 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class Items {
  late String title;
  late String img;
  late Function(BuildContext) onPressed;

  Items({required this.title, required this.img, required this.onPressed});
}
