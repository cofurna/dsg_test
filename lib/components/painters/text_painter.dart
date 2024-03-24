import 'package:dsg_test/core/extensions/canvas_ext.dart';
import 'package:dsg_test/core/models/line_text_data_class.dart';
import 'package:dsg_test/core/models/point_data_class.dart';
import 'package:dsg_test/core/utils.dart';
import 'package:flutter/material.dart';

class AppTextPainter extends CustomPainter {
  AppTextPainter({
    required this.pointsList,
    required this.textColor,
    this.selectedPoint,
  });

  final List<PointDataClass> pointsList;
  final Offset? selectedPoint;
  final Color textColor;
  TextPainter getTextPainter(String text) {
    return TextPainter(
        text: TextSpan(text: text, style: TextStyle(color: textColor)),
        textDirection: TextDirection.ltr)
      ..layout(maxWidth: 24);
  }

  @override
  void paint(Canvas canvas, Size size) {
    late LineTextDataClass lineProps;
    for (int index = 0; index < pointsList.length - 1; index++) {
      if (pointsList[index].isTapped && selectedPoint != null) {
        lineProps = Utils.getLineSegmentCenterText(
          [selectedPoint!, pointsList[index + 1].offset],
        );
      } else if (pointsList[index + 1].isTapped && selectedPoint != null) {
        lineProps = Utils.getLineSegmentCenterText(
          [pointsList[index].offset, selectedPoint!],
        );
      } else {
        lineProps = Utils.getLineSegmentCenterText(
          [pointsList[index].offset, pointsList[index + 1].offset],
        );
      }

      canvas.drawRotatedText(
        center: lineProps.center,
        textPainter: getTextPainter(lineProps.distance),
        angle: lineProps.radian, //radians
      );
    }

    if (pointsList.first.isTapped && selectedPoint != null) {
      lineProps = Utils.getLineSegmentCenterText(
        [pointsList.last.offset, selectedPoint!],
      );
    } else if (pointsList.last.isTapped && selectedPoint != null) {
      lineProps = Utils.getLineSegmentCenterText(
        [selectedPoint!, pointsList.first.offset],
      );
    } else {
      lineProps = Utils.getLineSegmentCenterText(
        [pointsList.last.offset, pointsList.first.offset],
      );
    }

    canvas.drawRotatedText(
      center: lineProps.center,
      textPainter: getTextPainter(lineProps.distance),
      angle: lineProps.radian, //radians
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
