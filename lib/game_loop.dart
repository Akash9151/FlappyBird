import 'dart:ui';

import 'package:box2d_flame/box2d.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';

class GameLoop extends Game {
  Size screenSize;

  static const int WORLD_POOL_SIZE = 100;
  static const int WORLD_POOL_CONTAINER_SIZE = 10;
  //Main physic object -> our game world
  World world;
  //Zero vector -> no gravity
  final Vector2 _gravity = Vector2.zero();

  Paint paint;
//Rectangle based on the size, easy to use
  Rect _screenRect;
  final int scale = 5;

  GameLoop() {
    world = new World.withPool(
        _gravity, DefaultWorldPool(WORLD_POOL_SIZE, WORLD_POOL_CONTAINER_SIZE));
    initialize();
  }

  Future initialize() async {
    //Call the resize as soon as flutter is ready
    resize(await Flame.util.initialDimensions());
  }

  @override
  void render(Canvas canvas) {
    //If no size information -> leave
    if (screenSize == null) {
      return;
    }
    //Save the canvas and resize/scale it based on the screenSize
    canvas.save();
    canvas.scale(screenSize.width / scale);
    //Move the canvas 0,0 to the position of the circle we draw
    canvas.translate(_screenRect.width / 2, _screenRect.height / 2);
    //Simply draw the circle with a radius of 0.1 using our paint
    canvas.drawCircle(Offset(0, 0), .1, paint);
    canvas.restore();
  }

  @override
  Future update(double t) async {
    // TODO: implement update
  }

  @override
  void resize(Size size) {
    paint = Paint();
    paint.color = Color(0xffffffff);
    //Store size and related rectangle
    screenSize = size;
    _screenRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    super.resize(size);
  }
}
