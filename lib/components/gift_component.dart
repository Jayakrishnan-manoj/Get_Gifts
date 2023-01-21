import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:get_gifts/components/santa_component.dart';
import 'package:get_gifts/games/get_gifts.dart';
import 'package:get_gifts/constants/globals.dart';

class GiftComponent extends SpriteComponent
    with HasGameRef<GetGifts>, CollisionCallbacks {
  final double _spriteHeight = 130;

  final Random _random = Random();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite(Globals.giftSprite);
    height = width = _spriteHeight;
    position = _getRandomPosition();
    anchor = Anchor.center;

    add(CircleHitbox());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is SantaComponent) {
      FlameAudio.play(Globals.itemGrabSound);
      removeFromParent();
      gameRef.score++;
      gameRef.add(GiftComponent());
    }
  }

  Vector2 _getRandomPosition() {
    double x = _random.nextInt(gameRef.size.x.toInt()).toDouble();
    double y = _random.nextInt(gameRef.size.y.toInt()).toDouble();
    return Vector2(x, y);
  }
}
