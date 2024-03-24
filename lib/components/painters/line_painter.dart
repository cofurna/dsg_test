import 'package:dsg_test/core/models/point_data_class.dart';
import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  LinePainter({
    required this.pointsList,
    required this.lineColor,
    required this.hasSharedArea,
    this.lineWidth = 7,
    this.selectedPoint,
  });

  final List<PointDataClass> pointsList;
  final Offset? selectedPoint;
  final double lineWidth;
  final Color lineColor;
  final bool hasSharedArea;

  Paint get linePaint => Paint()
    ..color = lineColor
    ..strokeWidth = lineWidth
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    if (pointsList.isNotEmpty) {
      for (int index = 0; index < pointsList.length - 1; index++) {
        if (pointsList[index].isTapped && selectedPoint != null) {
          canvas.drawLine(
              selectedPoint!, pointsList[index + 1].offset, linePaint);
        } else if (pointsList[index + 1].isTapped && selectedPoint != null) {
          canvas.drawLine(pointsList[index].offset, selectedPoint!, linePaint);
        } else {
          canvas.drawLine(pointsList[index].offset,
              pointsList[index + 1].offset, linePaint);
        }
      }
      if (hasSharedArea) {
        if (pointsList.first.isTapped && selectedPoint != null) {
          canvas.drawLine(selectedPoint!, pointsList.last.offset, linePaint);
        } else if (pointsList.last.isTapped && selectedPoint != null) {
          canvas.drawLine(pointsList.first.offset, selectedPoint!, linePaint);
        } else {
          canvas.drawLine(
              pointsList.first.offset, pointsList.last.offset, linePaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
