import 'package:flame/game.dart';
import 'package:get_gifts/components/background_component.dart';
import 'package:get_gifts/components/santa_component.dart';

class GetGifts extends FlameGame {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(BackGroundComponent());
    add(SantaComponent());
  }
}
