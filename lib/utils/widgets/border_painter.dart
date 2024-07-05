import 'dart:math';

import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  final double fillFraction;

  CirclePainter({required this.fillFraction});

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 4;
    double radius = size.width / 2 - strokeWidth / 2;
    Offset center = Offset(size.width / 2, size.height / 2);

    Paint unfilledPaint = Paint()
      ..color = Colors.grey.withOpacity(0.2)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, unfilledPaint);

    Paint filledPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    // Calculate sweep angle based on fillFraction
    double sweepAngle = 2 * pi * fillFraction;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      filledPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
