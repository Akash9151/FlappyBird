import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class FlappyBird extends Component {
  static double xPosition;
  static double yPosition;
  Size screenSize;

  @override
  void render(Canvas canvas) {
    if (screenSize != null) {
      Rect boxRect = Rect.fromLTWH(xPosition, yPosition, 100, 100);
      Paint boxPaint = Paint();
      boxPaint.color = Colors.cyanAccent;
      canvas.drawRect(boxRect, boxPaint);
    }
  }

  @override
  void resize(Size size) {
    screenSize = size;
    xPosition = (size.width / 2) - 50;
    yPosition = (size.height / 2) - 50;
    super.resize(size);
  }

  static void jump() {
    yPosition -= 100;
  }

  @override
  void update(double t) {
    if (screenSize != null) {
      yPosition += t * 200;
    }
  }
}
