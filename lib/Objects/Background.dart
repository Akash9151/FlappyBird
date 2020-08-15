import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';

class Background extends Component {
  static double xPosition;
  Size screenSize;

  @override
  void resize(Size size) {
    screenSize = size;
    xPosition = (size.width) - 100;
    super.resize(size);
  }

  @override
  void render(Canvas c) {
    if (screenSize != null) {
      Rect boxRect =
          Rect.fromLTWH(xPosition, (screenSize.height / 2) - 50, 100, 100);
      Paint boxPaint = Paint();
      boxPaint.color = Colors.cyanAccent;
      c.drawRect(boxRect, boxPaint);
    }
  }

  @override
  void update(double t) {
    if (screenSize != null) {
      if (xPosition <= 0) {
        xPosition = screenSize.width - 100;
      }
      xPosition -= t * 200;
    }
  }
}
