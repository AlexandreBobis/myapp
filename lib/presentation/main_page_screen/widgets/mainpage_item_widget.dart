import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/mainpage_item_model.dart'; // ignore: must_be_immutable
/*// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class MainpageItemWidget extends StatelessWidget {
  MainpageItemWidget(this.mainpageItemModelObj, {Key? key})
      : super(
          key: key,
        );

  MainpageItemModel mainpageItemModelObj;

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      imagePath: mainpageItemModelObj.polygon!,
      height: 142.v,
      width: 86.h,
    );
  }
}
*/

import 'dart:math' as math;

class MyArc extends StatelessWidget {
  final double diameter;

  const MyArc({Key? key, this.diameter = 80}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(),
      size: Size(diameter, diameter),
    );
  }
}


// This is the Painter class
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blue;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      math.pi/2,
      math.pi,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}