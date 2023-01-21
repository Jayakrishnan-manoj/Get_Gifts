import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:get_gifts/components/background_component.dart';
import 'package:get_gifts/components/santa_component.dart';
import 'package:get_gifts/input/joystick.dart';

class GetGifts extends FlameGame with HasDraggables{
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(BackGroundComponent());
    add(SantaComponent());
    add(joystick);
  }
}
