import 'package:flame/util.dart';
import 'package:flappybird/game_loop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Util util = new Util();
  await util.fullScreen();
  await util.setLandscape();

  GameLoop loop = new GameLoop();
  runApp(loop.widget);
}
