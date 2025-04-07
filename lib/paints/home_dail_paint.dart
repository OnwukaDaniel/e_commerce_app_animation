import 'package:flutter/material.dart';

class HomeDailPaint extends CustomPainter {
  final Size size;
  final double radius;
  HomeDailPaint(this.size , this.radius);

  @override
  void paint(Canvas canvas, Size s) {
    final paint = Paint()..color = Colors.deepPurpleAccent;
    bool isLandScape = size.width > size.height;

    canvas.drawCircle(
      Offset(size.width * .5, s.height * (isLandScape ? 1.7 : .5)),
      radius,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
