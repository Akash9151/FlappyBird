import 'dart:ui';

import 'package:flame/components/animation_component.dart';
import 'package:flame/components/mixins/resizable.dart';

class Bird extends AnimationComponent with Resizable {
  Bird()
      : super.sequenced(
          50,
          50,
          'character.png',
          3,
          textureWidth: 34.0,
          textureHeight: 24.0,
        );

  void resize(Size size) {
    this.x = (size.width / 2) - 50;
    this.y = (size.height / 2) - 50;
    super.resize(size);
  }

  void jump() {
    this.y -= 100;
  }

  @override
  void update(double t) {
    this.y += t * 200;
    super.update(t);
  }
}
