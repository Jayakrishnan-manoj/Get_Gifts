import 'package:flame/collisions.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:get_gifts/components/background_component.dart';
import 'package:get_gifts/components/gift_component.dart';
import 'package:get_gifts/components/ice_component.dart';
import 'package:get_gifts/components/santa_component.dart';
import 'package:get_gifts/input/joystick.dart';

import '../constants/globals.dart';

class GetGifts extends FlameGame with HasDraggables, HasCollisionDetection {
  int score = 0;

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
      ],
    );

    add(
      IceComponent(
        startPosition: Vector2(340, 140),
      ),
    );
    add(
      IceComponent(
        startPosition: Vector2(size.x - 340, size.y - 130),
      ),
    );

    add(ScreenHitbox());
  }
}
