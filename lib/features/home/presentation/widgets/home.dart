import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_clean_architecture/features/home/domain/entities/user_in_home.dart';
import 'package:flutter_app_clean_architecture/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_app_clean_architecture/features/home/presentation/bloc/home_events.dart';
import 'package:flutter_app_clean_architecture/features/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

double screenWidth = 0;

class _HomeState extends State<Home> {
  Items _items1 = new Items(
      title: "Điểm danh", img: 'assets/images/fake_slink/qrscan.png');
  Items _items2 = new Items(
      title: "Tạo mã QR", img: 'assets/images/fake_slink/qr.png');
  Items _items3 =
      new Items(title: "Thời khóa biểu", img: 'assets/images/fake_slink/schedule2.png');
  Items _items4 = new Items(
      title: "Thay đổi thiết bị định danh", img: 'assets/images/fake_slink/phone.png');

  late HomeBloc _bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = GetIt.instance<HomeBloc>()..add(HomeEvent.init());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    List<Items> list = [_items1, _items2, _items3, _items4];

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
          },
          buildWhen: (context,state) => !(state is HomeErrorState),
          builder: (context,state){
            if(state is HomeLoading)
              return Center(child: SizedBox(
                  child: CircularProgressIndicator(),
                height: 50,
                width: 50,
              ),);
            UserInHome userInHome = (state as HomeComplete).userInHome;
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
                    childAspectRatio: 5,
                    children: list.map((data) {
                      return Container(
                          // padding: EdgeInsets.only(left: 10,right: 10),
                          height: 1,
                          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
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
                      );
                    }).toList()),
                SliverToBoxAdapter(
                  child: Container(
                    child: Text("Sự kiện sắp tới",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                            (_, id) => SizedBox(
                          height: 50,
                          child: Text('$id'),
                        ),
                        childCount: 24)),
              ],
            );
          },
        ),
      ),
    );
  }
}

class SliverHeaderChildDelegateImpl extends SliverPersistentHeaderDelegate {
  final double _maxExtent = 180;
  final double? _minExtent = 80;
  final UserInHome userInHome;
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
                        userInHome.name??"user",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        "DeviceId: ${userInHome.deviceID??"chua xac dinh"}",
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

  Items({required this.title, required this.img});
}
