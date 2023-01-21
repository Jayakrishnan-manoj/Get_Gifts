import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math' as math;
import 'package:get_gifts/games/get_gifts.dart';
import 'package:get_gifts/constants/globals.dart';

class IceComponent extends SpriteComponent with HasGameRef<GetGifts> {
  final double _spriteHeight = 130;
  final Vector2 startPosition;

  late Vector2 _velocity;
  double speed = 300;
  double degree = math.pi / 180;

  IceComponent({required this.startPosition});

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite(Globals.iceSprite);
    position = startPosition;
    width = height = _spriteHeight;
    anchor = Anchor.center;

    double spawnAngle = _getSpawnAngle();

    final double vx = math.cos(spawnAngle * degree) * speed;
    final double vy = math.sin(spawnAngle * degree) * speed;

    _velocity = Vector2(vx, vy);
  }

  @override
  void update(dt) {
    super.update(dt);
    position += _velocity * dt;
  }

  double _getSpawnAngle() {
    final random = math.Random().nextDouble();
    final spawnAngle = lerpDouble(0, 360, random)!;
    return spawnAngle;
  }
}
