import 'package:flame/util.dart';
import 'package:flappybird/game_loop.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Util util = new Util();
  await util.fullScreen();
  await util.setPortraitUpOnly();
  GameLoop loop = new GameLoop();
  runApp(loop.widget);
}
