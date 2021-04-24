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
            child: Image.network(
              "https://i.ytimg.com/vi/ByrUgKNV42Q/"
                  "hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElA"
                  "ADIQj0AgKJD&rs=AOn4CLDYsrfOS4AIC_0r5eVQqkubM4fhDg",
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
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(
                      maxExtent - shrinkOffset < 80?0:10
                  )),
                  boxShadow: [
                    BoxShadow(blurRadius: 2,offset: Offset(0,2),color: Colors.grey)
                  ]
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