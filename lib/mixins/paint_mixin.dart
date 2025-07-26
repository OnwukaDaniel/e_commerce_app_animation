import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:ui' as ui ;

mixin PaintMixin {
  void paintImages(Size s, Canvas canvas, List<ui.Image> images, double radius, double gapDifference, double imgDiameter, double angle, double dx) {
    final imgRadius = radius - 55;
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
        center:
        Offset(s.width / 2, s.height / 2) +
            Offset.fromDirection(a, imgRadius),
        radius: 36,
      );

      final imagePaint = Paint()..strokeCap = StrokeCap.round;
      canvas.save();
      canvas.clipPath(Path()..addOval(dst));
      canvas.drawImageRect(img, src, dst, imagePaint);
      canvas.restore();
    }
  }
}