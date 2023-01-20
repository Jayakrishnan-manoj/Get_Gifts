import 'package:flame/components.dart';
import 'package:get_gifts/games/get_gifts.dart';
import 'package:get_gifts/constants/globals.dart';

class BackGroundComponent extends SpriteComponent with HasGameRef<GetGifts> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    
    sprite = await gameRef.loadSprite(Globals.backGroundSprite);
    size = gameRef.size;
  }
}
