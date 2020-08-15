import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class FlappyBird {
  double xPosition;
  double yPosition;

  FlappyBird({this.xPosition, this.yPosition});

  void render(Canvas canvas) {
    Rect boxRect = Rect.fromLTWH(xPosition, yPosition, 100, 100);
    Paint boxPaint = Paint();
    boxPaint.color = Colors.cyanAccent;
    canvas.drawRect(boxRect, boxPaint);
  }

  void jump() {
    yPosition -= 100;
  }

  void update(double t) {
    yPosition += t * 200;
  }
}
