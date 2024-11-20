import 'dart:async';

import 'package:flame/components.dart';

class Asteroid extends SpriteComponent with HasGameRef {
  double ukuran = 0.5;
  Asteroid({required this.ukuran}){
    scale = Vector2.all(ukuran);
  }

  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite('meteor/spaceMeteors_001.png');

    anchor = Anchor.center;
    // scale = Vector2.all(0.5);
    // position = Vector2(game.size.x / 2, game.size.y / 2);
  }
}