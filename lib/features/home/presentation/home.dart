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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: SliverHeaderChildDelegateImpl(),
              pinned: true,
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
      ),
    );
  }
}

class SliverHeaderChildDelegateImpl extends SliverPersistentHeaderDelegate {
  final double _maxExtent = 150;
  final double? _minExtent = 50;

  SliverHeaderChildDelegateImpl();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        SizedBox(
          child: Image.asset("images/background.jpg",fit: BoxFit.cover,),
          width: screenWidth,
          height: 125 - shrinkOffset < 0 ? 50: 125 - shrinkOffset,
        ),
        Positioned(
          bottom: 150-shrinkOffset<50?50:150-shrinkOffset,
          left: 30-shrinkOffset>0?30-shrinkOffset:0,
          right: 30-shrinkOffset>0?30-shrinkOffset:0,
          child: Row(
            children: [
              Text("data"),
              Text("data"),
              Text("data"),
            ],
          ),
        )
      ],
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
    // TODO: implement shouldRebuild
    return false;
  }
}
