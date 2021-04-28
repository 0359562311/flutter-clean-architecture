import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomBackground extends StatelessWidget{
  /// Widget content.
  final Widget content;

  /// Link Image
  final String? image;

  final bool? singleChildScrollView;

  const CustomBackground({
    Key? key,
    required this.content,
    String? image,
    bool? singleChildScrollView,
}) :
    image = image ?? '',
        singleChildScrollView = singleChildScrollView ?? false,
  super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.black
              // image: DecorationImage(
              //     fit: BoxFit.cover,
              //     image: AssetImage("assets/images/ican/background.jpg")
              // )
          ),
        ),
        singleChildScrollView != null && singleChildScrollView! ?
        SingleChildScrollView(
          child: content,
        ): content,
      ],
    );
  }

}