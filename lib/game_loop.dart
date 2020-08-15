import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flame/gestures.dart';
import 'package:flappybird/Objects/Background.dart';
import 'package:flappybird/Objects/bird.dart';
import 'package:flappybird/Objects/flappy_bird.dart';
import 'package:flutter/material.dart';

class GameLoop extends BaseGame with TapDetector {
  Bird bird = new Bird();

  GameLoop() {
    add(new Background());
    add(bird);
  }

  @override
  void onTap() {
    bird.jump();
    super.onTap();
  }
}
