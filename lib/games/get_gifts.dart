import 'dart:math';

import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:get_gifts/components/background_component.dart';
import 'package:get_gifts/components/gift_component.dart';
import 'package:get_gifts/components/ice_component.dart';
import 'package:get_gifts/components/santa_component.dart';
import 'package:get_gifts/input/joystick.dart';

import '../constants/globals.dart';
import '../screens/game_over_menu.dart';

class GetGifts extends FlameGame with HasDraggables, HasCollisionDetection {
  int score = 0;
  late Timer _timer;
  int _remainingTime = 30;

  late TextComponent _score;
  late TextComponent time;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(BackGroundComponent());

    add(SantaComponent(joystick: joystick));

    add(GiftComponent());

    add(joystick);

    FlameAudio.audioCache.loadAll(
      [
        Globals.itemGrabSound,
        Globals.freezeSound,
      ],
    );

    Random random = Random();
    double x = random.nextDouble() * (size.x - 100);
    double y = random.nextDouble() * (size.y - 100);

    add(
      IceComponent(
        startPosition: Vector2(x, y),
      ),
    );

    add(
      IceComponent(
        startPosition: Vector2(x, y),
      ),
    );

    // add(
    //   IceComponent(
    //     startPosition: Vector2(180, 60),
    //   ),
    // );
    // add(
    //   IceComponent(
    //     startPosition: Vector2(size.x - 100, size.y - 100),
    //   ),
    // );

    add(ScreenHitbox());

    _score = TextComponent(
      text: 'Score: $score',
      position: Vector2(40, 40),
      anchor: Anchor.topLeft,
      textRenderer: TextPaint(
        style: TextStyle(
          color: BasicPalette.white.color,
          fontSize: 22,
        ),
      ),
    );

    add(_score);

    time = TextComponent(
      text: 'Time: $_remainingTime seconds',
      position: Vector2(size.x - 40, 40),
      anchor: Anchor.topRight,
      textRenderer: TextPaint(
        style: TextStyle(
          color: BasicPalette.white.color,
          fontSize: 22,
        ),
      ),
    );

    add(time);

    _timer = Timer(
      1,
      repeat: true,
      onTick: () {
        if (_remainingTime == 0) {
          pauseEngine();
          overlays.add(GameOverMenu.id);
        } else {
          _remainingTime--;
        }
      },
    );
    _timer.start();
  }

  @override
  void update(dt) {
    super.update(dt);
    _timer.update(dt);
    _score.text = 'Score: $score';
    time.text = 'Time: $_remainingTime secs';
  }

  void reset() {
    score = 0;
    _remainingTime = 30;
  }
}
