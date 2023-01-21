import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:get_gifts/games/get_gifts.dart';
import 'package:get_gifts/constants/globals.dart';

enum MovementState {
  idle,
  slideLeft,
  slideRight,
}

class SantaComponent extends SpriteGroupComponent<MovementState>
    with HasGameRef<GetGifts> {
  final double _spriteHeight = 200;

  final double _speed = 500;

  late double _rightBound;
  late double _leftBound;
  late double _upBound;
  late double _downBound;

  JoystickComponent joystick;

  SantaComponent({required this.joystick});

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    Sprite santaIdle = await gameRef.loadSprite(Globals.santaIdleSprite);
    Sprite santaLeftSlide = await gameRef.loadSprite(Globals.santaLeftSprite);
    Sprite santaRightSlide = await gameRef.loadSprite(Globals.santaRightSprite);

    sprites = {
      MovementState.idle: santaIdle,
      MovementState.slideLeft: santaLeftSlide,
      MovementState.slideRight: santaRightSlide,
    };

    _rightBound = gameRef.size.x - 45;
    _leftBound = 45;
    _upBound = 55;
    _downBound = gameRef.size.y - 85;

    current = MovementState.idle;

    position = gameRef.size / 2;
    height = _spriteHeight;
    width = _spriteHeight * 1.42;
    anchor = Anchor.center;

    add(CircleHitbox());
  }

  @override
  void update(dt) {
    super.update(dt);

    if (joystick.direction == JoystickDirection.idle) {
      current = MovementState.idle;
      return;
    }

    if (x >= _rightBound) {
      x = _rightBound - 1;
    }
    if (x <= _leftBound) {
      x = _leftBound + 1;
    }
    if (y >= _downBound) {
      y = _downBound - 1;
    }
    if (y <= _upBound) {
      y = _upBound + 1;
    }

    bool movingLeft = joystick.relativeDelta[0] < 0;

    movingLeft
        ? current = MovementState.slideLeft
        : current = MovementState.slideRight;

    position.add(joystick.relativeDelta * _speed * dt);
  }
}
