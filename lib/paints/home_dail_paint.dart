import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class HomeDailPaint extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.deepPurpleAccent;

    canvas.drawCircle(
      Offset(size.width * .5, size.height * .5),
      size.width,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
