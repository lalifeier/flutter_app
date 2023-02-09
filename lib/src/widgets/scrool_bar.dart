import 'package:flutter/material.dart';

class Scroolbar extends CustomPainter {
  late Paint _bgPaint;
  late Paint _offsetPaint;

  double offsetRatio;

  Scroolbar({required this.offsetRatio}) {
    _bgPaint = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..color = Colors.grey[350]!;

    _offsetPaint = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..color = Colors.red;
  }

  @override
  void paint(Canvas canvas, Size size) {
    _bgPaint.strokeWidth = size.height;
    _offsetPaint.strokeWidth = size.height;

    canvas.drawLine(const Offset(0, 0), Offset(size.width, 0), _bgPaint);

    if (offsetRatio <= 0) {
      offsetRatio = 0;
    } else if (offsetRatio >= 1) {
      offsetRatio = 1;
    }
    double progress = offsetRatio * size.width / 2;

    canvas.drawLine(Offset(progress, 0), Offset(size.width / 2 + progress, 0),
        _offsetPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
