import 'dart:math' as math;

import 'package:dsg_test/core/models/draggin_data_class.dart';
import 'package:dsg_test/core/models/line_text_data_class.dart';
import 'package:dsg_test/core/models/part.dart';
import 'package:dsg_test/core/models/point_data_class.dart';
import 'package:flutter/material.dart';

class Utils {
  static double maxDistance = 20;

  static DraggingDataClass shouldGrab(
      List<PointDataClass> pointsList, Offset target) {
    for (int index = 0; index < pointsList.length; index++) {
      final point = pointsList[index];
      if ((point.offset - target).distance < maxDistance) {
        return DraggingDataClass(part: const Part.point(), index: index);
      }
    }

    if (pointsList.length < 4) {
      return DraggingDataClass(
        part: const Part.newPoint(),
        index: pointsList.isEmpty ? 0 : pointsList.length,
      );
    }
    return const DraggingDataClass(part: Part.noPart());
  }

  static LineTextDataClass getLineSegmentCenterText(List<Offset> points) {
    final double xCenter = (points[0].dx + points[1].dx) / 2;
    final double yCenter = (points[0].dy + points[1].dy) / 2;

    final dx = points[0].dx - points[1].dx;
    final dy = points[0].dy - points[1].dy;
    Offset center = Offset(xCenter, yCenter);

    if (dx > 0) {
      if (dy > 0) {
        center = Offset(xCenter - 10, yCenter + 10);
      } else {
        center = Offset(xCenter + 10, yCenter + 10);
      }
    } else {
      if (dy > 0) {
        center = Offset(xCenter - 10, yCenter - 10);
      } else {
        center = Offset(xCenter + 10, yCenter - 10);
      }
    }

    final radian = math.atan(dy / dx);
    final distance = math.sqrt(dx * dx + dy * dy) / 40;

    return LineTextDataClass(
      center: center,
      radian: radian,
      distance: distance.toStringAsFixed(2),
    );
  }

  // static bool cross(Offset first, Offset second, Offset third, Offset four) {
  //   double n;
  //   if (second.dy - first.dy != 0) {
  //     // a(y)
  //     double q = (second.dx - first.dx) / (first.dy - second.dy);
  //     double sn = (third.dx - four.dx) + (third.dy - four.dy) * q;
  //     if (sn == 0) {
  //       return false;
  //     } // c(x) + c(y)*q
  //     double fn =
  //         (third.dx - first.dx) + (third.dx - first.dy) * q; // b(x) + b(y)*q
  //     n = fn / sn;
  //   } else {
  //     if ((third.dy - four.dy) == 0) {
  //       return false;
  //     } // b(y)
  //     n = (third.dy - first.dy) / (third.dy - four.dy); // c(y)/b(y)
  //   }
  //   // dot[0] = x3 + (x4 - x3) * n; // x3 + (-b(x))*n
  //   // dot[1] = y3 + (y4 - y3) * n; // y3 +(-b(y))*n
  //   return true;
  // }

  // static double shortestDistance(Offset a, Offset b, Offset target) {
  //   double px = b.dx - a.dx;
  //   double py = b.dy - a.dy;
  //   double temp = (px * px) + (py * py);
  //   double u = ((target.dx - a.dx) * px + (target.dy - a.dy) * py) / temp;
  //   if (u > 1) {
  //     u = 1;
  //   } else if (u < 0) {
  //     u = 0;
  //   }
  //   double x = a.dx + u * px;
  //   double y = a.dy + u * py;
  //   double dx = x - target.dx;
  //   double dy = y - target.dy;
  //   double dist = math.sqrt(dx * dx + dy * dy);
  //   return dist;
  // }
}
