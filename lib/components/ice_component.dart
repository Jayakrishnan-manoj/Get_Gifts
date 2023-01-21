import 'package:flame/components.dart';
import 'package:get_gifts/games/get_gifts.dart';
import 'package:get_gifts/constants/globals.dart';

class IceComponent extends SpriteComponent with HasGameRef<GetGifts> {
  final double _spriteHeight = 130;
  final Vector2 startPosition;

  IceComponent({required this.startPosition});

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite(Globals.iceSprite);
    position = startPosition;
    width = height = _spriteHeight;
    anchor = Anchor.center;
  }
}
