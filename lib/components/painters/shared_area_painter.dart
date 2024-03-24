import 'package:dsg_test/core/models/point_data_class.dart';
import 'package:flutter/material.dart';

class SharedAreaPainter extends CustomPainter {
  SharedAreaPainter({
    required this.pointsList,
    required this.areaColor,
    this.selectedPoint,
  });

  final List<PointDataClass> pointsList;
  final Offset? selectedPoint;
  final Color areaColor;

  Paint get _sharedAreaPainter => Paint()
    ..style = PaintingStyle.fill
    ..color = areaColor;

  @override
  void paint(Canvas canvas, Size size) {
    if (pointsList.isNotEmpty) {
      final polygon = Path();
      if (pointsList.first.isTapped && selectedPoint != null) {
        polygon.moveTo(
          selectedPoint!.dx,
          selectedPoint!.dy,
        );
      } else {
        polygon.moveTo(
          pointsList.first.offset.dx,
          pointsList.first.offset.dy,
        );
      }

      for (int i = 1; i < pointsList.length; i++) {
        if (pointsList[i].isTapped && selectedPoint != null) {
          polygon.lineTo(selectedPoint!.dx, selectedPoint!.dy);
        } else {
          polygon.lineTo(pointsList[i].offset.dx, pointsList[i].offset.dy);
        }
      }
      canvas.drawPath(polygon, _sharedAreaPainter);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
