import 'package:e_commerce_app/mixins/paint_mixin.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class HomeDailPaint2 extends CustomPainter with PaintMixin {
  final Size size;
  final double radius;
  final List<ui.Image> images;
  final double dx;
  final double gapDifference;
  final double imgDiameter;
  final double angle;

  HomeDailPaint2(
    this.size,
    this.radius,
    this.images,
    this.dx,
    this.gapDifference,
    this.imgDiameter,
    this.angle,
  );

  @override
  void paint(Canvas canvas, Size s) {
    final paint = Paint()..color = Colors.deepPurpleAccent;
    final strokePaint =
        Paint()
          ..strokeCap = StrokeCap.round
          ..color = Colors.yellow
          ..style = PaintingStyle.stroke
          ..strokeWidth = 8;
    bool isLandScape = size.width > size.height;
    final circleOffset = Offset(
      size.width * .5,
      s.height * (isLandScape ? 1.7 : .5),
    );
    canvas.drawCircle(circleOffset, radius, paint);

    //4.363323129985824 - 4.45 - 4.6
    final arcRect = Rect.fromCircle(center: circleOffset, radius: radius - 2);
    canvas.drawArc(arcRect, toRad(250), toRad(13), false, strokePaint);

    paintImages(s, canvas, images, radius, gapDifference, imgDiameter, angle, dx);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
