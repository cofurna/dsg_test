import 'package:flutter/material.dart';

extension RotatedTextExt on Canvas {
  void drawRotatedText({
    required Offset center,
    required TextPainter textPainter,
    required double angle,
    Alignment alignment = Alignment.center,
  }) {
    textPainter.layout();

    final w = textPainter.width;
    final h = textPainter.height;
    final delta = center.translate(
        -w / 2 + w / 2 * alignment.x, -h / 2 + h / 2 * alignment.y);

    save();
    translate(center.dx, center.dy);
    rotate(angle);
    translate(-center.dx, -center.dy);
    textPainter.paint(this, delta);

    restore();
  }
}
