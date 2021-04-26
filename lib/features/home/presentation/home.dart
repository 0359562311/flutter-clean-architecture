import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

double screenWidth = 0;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: SliverHeaderChildDelegateImpl(),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 16),
                child: Text("Cac chuc nang:"),
              ),
            ),
            SliverGrid.count(crossAxisCount: 2,
              childAspectRatio: 2.5,
              children: List.generate(4, (index){
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 6,vertical: 6),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(child: Text("chuc nang $index")),
                );
              }),
            ),
            SliverToBoxAdapter(
              child: Container(
                child: Text("Su kien sap toi"),
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, id) => SizedBox(
                      height: 50,
                      child: Text('$id'),
                  ),
                  childCount: 24
                )
            ),
          ],
        ),
      backgroundColor: Colors.grey[200]!,
    );
  }
}

class SliverHeaderChildDelegateImpl extends SliverPersistentHeaderDelegate {
  final double _maxExtent = 200;
  final double? _minExtent = 80;

  SliverHeaderChildDelegateImpl();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return SizedBox(
      width: screenWidth,
      height: maxExtent - shrinkOffset < 80 ? 80: maxExtent - shrinkOffset,
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          SizedBox(
            child: Image.asset(
              "assets/images/fake_slink/yabure.jpg",
              fit: BoxFit.cover,
            ),
            width: screenWidth,
            height: maxExtent - 40 - shrinkOffset < 0 ? 0: maxExtent - 40 - shrinkOffset,
          ),
          Positioned(
            bottom: 0,
            left: shrinkOffset>100?0:(-shrinkOffset+100)/4,
            right: shrinkOffset>100?0:(-shrinkOffset+100)/4,
            height: 80,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(
                      maxExtent - shrinkOffset < 80?0:10
                  )),
                  boxShadow: [
                    BoxShadow(blurRadius: 2,offset: Offset(0,2),color: Colors.grey)
                  ]
              ),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    padding: EdgeInsets.all(10),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.asset("assets/images/fake_slink/icon_user.png",fit: BoxFit.fill,),
                    ),
                  ),
                  Expanded(child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Nguyen Kiem Tan"),
                      Text("UID: 1234")
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