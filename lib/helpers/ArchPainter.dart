import 'package:flutter/cupertino.dart';
import 'package:shopvtwo/utils/Vary.dart';
import 'dart:math' as math;

class ArchPainter extends CustomPainter {
  var mSize;

  ArchPainter(this.mSize);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Vary.secondary;

    final rect = Rect.fromLTRB(-600, 100, mSize.width, mSize.height + 500);
    final startAngle = -degreeToRadian(100);
    final sweepAngle = degreeToRadian(200);
    final useCenter = false;

    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  degreeToRadian(value) {
    return value * (math.pi / 180);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
