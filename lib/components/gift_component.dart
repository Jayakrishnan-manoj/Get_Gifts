import 'package:flame/components.dart';
import 'package:get_gifts/games/get_gifts.dart';
import 'package:get_gifts/constants/globals.dart';

class GiftComponent extends SpriteComponent with HasGameRef<GetGifts> {
  final double _spriteHeight = 130;
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite(Globals.giftSprite);
    height = width = _spriteHeight;
    position = gameRef.size / 2;
    anchor = Anchor.center;
  }
}
