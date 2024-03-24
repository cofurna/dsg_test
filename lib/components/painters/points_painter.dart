import 'dart:math' as math;

import 'package:dsg_test/core/models/point_data_class.dart';
import 'package:flutter/material.dart';

class PointsPainter extends CustomPainter {
  PointsPainter({
    required this.pointsList,
    required this.pointBorderColor,
    required this.pointColor,
    required this.selectPointColor,
    required this.selectPointBorderColor,
    this.selectPoint,
    this.pointWidth = 1,
    this.pointSize = 11,
  });

  final List<PointDataClass> pointsList;
  final Offset? selectPoint;
  final double pointWidth;
  final double pointSize;
  final Color pointBorderColor;
  final Color pointColor;
  final Color selectPointColor;
  final Color selectPointBorderColor;

  Paint get paintPoint => Paint()
    ..color = pointColor
    ..strokeWidth = pointWidth
    ..style = PaintingStyle.fill;

  Paint get paintPointBorder => Paint()
    ..color = pointBorderColor
    ..strokeWidth = 1.5
    ..style = PaintingStyle.stroke;

  Paint get paintSelectPoint => Paint()
    ..color = selectPointColor
    ..strokeWidth = pointWidth
    ..style = PaintingStyle.fill;

  Paint get paintSelectPointBorder => Paint()
    ..color = selectPointBorderColor
    ..strokeWidth = 1.5
    ..style = PaintingStyle.stroke;

  Paint get paintArrow => Paint()
    ..color = selectPointBorderColor
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke
    ..strokeJoin = StrokeJoin.round
    ..strokeCap = StrokeCap.round;

  Paint get paintArrowLine => Paint()
    ..color = selectPointBorderColor
    ..strokeWidth = 4
    ..style = PaintingStyle.stroke
    ..strokeJoin = StrokeJoin.round
    ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    for (final point in pointsList) {
      if (point.isTapped) {
        continue;
      }
      canvas
        ..drawCircle(point.offset, 6, paintPointBorder)
        ..drawOval(
          Rect.fromCenter(
              center: point.offset, width: pointSize, height: pointSize),
          paintPoint,
        );
    }

    if (selectPoint != null) {
      paintArrowsWithCircle(canvas, selectPoint!);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  void paintArrowsWithCircle(Canvas canvas, Offset center) {
    for (double i = 0; i < math.pi * 2;) {
      final path = Path();
      const arrowHeight = 16;
      const arrowWeight = 5;
      const pointPosition = 22;
      const lineStart = arrowWeight + 2;
      const lineEnd = pointPosition - 2;

      final cos = math.cos(i);
      final sin = math.sin(i);

      path
        ..moveTo(center.dx + arrowHeight * cos, center.dy - cos * arrowWeight)
        ..lineTo(center.dx + pointPosition * cos, center.dy)
        ..lineTo(center.dx + arrowHeight * cos, center.dy + arrowWeight * cos)
        ..moveTo(center.dx + arrowWeight * sin, center.dy + arrowHeight * sin)
        ..lineTo(center.dx, center.dy + pointPosition * sin)
        ..lineTo(center.dx - arrowWeight * sin, center.dy + arrowHeight * sin);

      canvas
        ..drawPath(path, paintArrow)
        ..drawLine(
          Offset(center.dx + lineStart * cos, center.dy + lineStart * sin),
          Offset(center.dx + lineEnd * cos, center.dy + lineEnd * sin),
          paintArrowLine,
        );
      i = i + math.pi * 0.5;
    }

    canvas
      ..drawCircle(center, 6, paintSelectPointBorder)
      ..drawOval(
        Rect.fromCenter(center: center, width: pointSize, height: pointSize),
        paintSelectPoint,
      );
  }
}
