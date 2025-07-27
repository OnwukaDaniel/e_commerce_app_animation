import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

mixin PaintMixin {
  final double tolerance = 0.1; // ~5.7 degrees

  void paintImages(
    Size s,
    Canvas canvas,
    List<ui.Image> images,
    double radius,
    double gapDifference,
    double imgDiameter,
    double angle,
    double dx,
  ) {
    final imgRadius = 36.0;
    final targetAngles = [toRad(250), toRad(15)];
    final imagesRadius = radius - 55;
    final double anglePerImage = toRad(imgRadius * .7);
    final double angularDx = dx / imagesRadius; // Convert drag pixels to radians

    for (int i = 0; i < images.length; i++) {
      final ui.Image img = images[i];

      final src = Rect.fromLTWH(
        0,
        0,
        img.width.toDouble(),
        img.height.toDouble(),
      );

      final a = i * anglePerImage + angularDx + toRad(angle); // All in radians

      final dst = Rect.fromCircle(
        center: Offset(s.width / 2, s.height / 2) +
            Offset.fromDirection(a, imagesRadius),
        radius: imgRadius,
      );

      final imagePaint = Paint()..strokeCap = StrokeCap.round;
      canvas.save();
      canvas.clipPath(Path()..addOval(dst));
      canvas.drawImageRect(img, src, dst, imagePaint);
      canvas.restore();
    }

  }

  double toRad(double degrees) {
    return degrees * (pi / 180);
  }
}
