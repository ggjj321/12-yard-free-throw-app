import 'package:flutter/material.dart';
import 'gradient_render.dart';

class GoalPainter extends CustomPainter {
  late double? centerX;
  late double? centerY;
  late bool isResultMode;

  GoalPainter.resultMode(double x, double y){
    centerX = x;
    centerY = y;
    isResultMode = true;
  }

  GoalPainter.uploadMode(){
    isResultMode = false;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.purpleAccent
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..shader = getLinearGradient(
          Colors.purple, Colors.blue, 0, 300
      );

    if(isResultMode){
      final center = Offset(size.width * centerX!, size.height * centerY!);
      canvas.drawCircle(
        center,
        size.height * 1 / 20,
        paint,
      );
    }

    canvas.drawLine(
      Offset(0, size.height * 1 / 3),
      Offset(size.width, size.height * 1 / 3),
      paint,
    );

    canvas.drawLine(
      Offset(0, size.height * 2 / 3),
      Offset(size.width, size.height * 2 / 3),
      paint,
    );

    canvas.drawLine(
      Offset(size.width * 1 / 4, 0),
      Offset(size.width * 1 / 4, size.height),
      paint,
    );

    canvas.drawLine(
      Offset(size.width * 2 / 4, 0),
      Offset(size.width * 2 / 4, size.height),
      paint,
    );

    canvas.drawLine(
      Offset(size.width * 3 / 4, 0),
      Offset(size.width * 3 / 4, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}