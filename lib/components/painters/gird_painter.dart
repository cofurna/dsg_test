import 'package:dsg_test/statics/app_consts.dart';
import 'package:flutter/material.dart';

class GridPainter extends CustomPainter {
  final double boxSize = AppConsts.girdStep;

  @override
  void paint(Canvas canvas, Size size) {
    final vertical = (size.width ~/ boxSize) + 1;
    final horisontal = (size.height ~/ boxSize) + 1;

    final paint = Paint()
      ..strokeWidth = 1
      ..color = Colors.blue.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    for (var i = 0; i < vertical; ++i) {
      for (var j = 0; j < horisontal; ++j) {
        final x = boxSize * i;
        final y = boxSize * j;
        canvas.drawCircle(Offset(x, y), 2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
