import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flame/gestures.dart';
import 'package:flappybird/Objects/flappy_bird.dart';
import 'package:flutter/material.dart';

class GameLoop extends Game with TapDetector {
  Size screenSize;
  bool decrease = true;
  FlappyBird bird;

  GameLoop() {
    intialized();
  }

  intialized() {
    bird = screenSize != null
        ? FlappyBird(
            xPosition: (screenSize.width / 2) - 50,
            yPosition: (screenSize.height / 2) - 50)
        : null;
  }

  @override
  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff008080);
    canvas.drawRect(bgRect, bgPaint);

    if (bird != null) {
      bird.render(canvas);
    }
  }

  @override
  Future update(double t) async {
    if (bird != null) {
      bird.update(t);
    }
  }

  @override
  void resize(Size size) {
    screenSize = size;
    intialized();
    super.resize(size);
  }

  @override
  void onTapDown(TapDownDetails details) {
    print(details.globalPosition);
    bird.jump();
    super.onTapDown(details);
  }
}
