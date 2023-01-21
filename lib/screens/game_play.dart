import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get_gifts/games/get_gifts.dart';
import 'package:get_gifts/screens/game_over_menu.dart';

final GetGifts _getGifts = GetGifts();

class GamePlay extends StatelessWidget {
  const GamePlay({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: _getGifts,
      overlayBuilderMap: {
        GameOverMenu.id: (BuildContext context, GetGifts gameRef) =>
            GameOverMenu(
              gameRef: gameRef,
            ),
      },
    );
  }
}
