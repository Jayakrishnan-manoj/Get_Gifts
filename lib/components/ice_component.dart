import 'dart:ui';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'dart:math' as math;
import 'package:get_gifts/games/get_gifts.dart';
import 'package:get_gifts/constants/globals.dart';

class IceComponent extends SpriteComponent
    with HasGameRef<GetGifts>, CollisionCallbacks {
  final double _spriteHeight = 100;
  final Vector2 startPosition;

  late Vector2 _velocity;
  double speed = 200;
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

    add(CircleHitbox());
  }

  @override
  void update(dt) {
    super.update(dt);
    position += _velocity * dt;
    if (position.x < 0) {
      _velocity.x = -_velocity.x;
      position.x = 0;
    }
    if (position.x > gameRef.size.x - width) {
      _velocity.x = -_velocity.x;
      position.x = gameRef.size.x - width;
    }
    if (position.y < 0) {
      _velocity.y = -_velocity.y;
      position.y = 0;
    }
    if (position.y > gameRef.size.y - height) {
      _velocity.y = -_velocity.y;
      position.y = gameRef.size.y - height;
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is ScreenHitbox) {
      final Vector2 collisionPoint = intersectionPoints.first;

      if (collisionPoint.x == 0 || collisionPoint.x == gameRef.size.x) {
        _velocity = Vector2(-_velocity.x, _velocity.y);
      }

      if (collisionPoint.y == 0 || collisionPoint.y == gameRef.size.y) {
        _velocity = Vector2(_velocity.x, -_velocity.y);
      }
    }
  }

  double _getSpawnAngle() {
    final random = math.Random().nextDouble();
    final spawnAngle = lerpDouble(0, 360, random)!;
    return spawnAngle;
  }
}
