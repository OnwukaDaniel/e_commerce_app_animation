import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class HomeDailPaint2 extends CustomPainter {
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
    final imgRadius = radius - 36;
    final paint = Paint()..color = Colors.deepPurpleAccent;
    final imagePaint = Paint()..strokeCap = StrokeCap.round;
    bool isLandScape = size.width > size.height;
    final double r = 1;

    canvas.drawCircle(
      Offset(size.width * .5, s.height * (isLandScape ? 1.7 : .5)),
      radius,
      paint,
    );
    for (int i = 0; i < images.length; i++) {
      final ui.Image img = images[i];

      /// This it the dim form the image to be taken from the image
      final src = Rect.fromLTWH(
        0,
        0,
        img.width.toDouble(),
        img.height.toDouble(),
      );

      final ss =
          dx + (i != 0 ? (i * gapDifference) + (i * imgDiameter) : 0.0) + angle;
      final a = (ss / (imgRadius)) - (pi / 2);

      final dst = Rect.fromCircle(
        center: Offset(s.width / 2, s.height / 2) + Offset.fromDirection(a, imgRadius),
        radius: 50,
      );

      canvas.save();
      canvas.clipPath(Path()..addOval(dst));
      canvas.drawImageRect(img, src, dst, imagePaint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
