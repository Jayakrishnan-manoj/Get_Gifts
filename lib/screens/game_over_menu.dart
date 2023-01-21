import 'package:flutter/material.dart';
import 'package:get_gifts/constants/globals.dart';
import 'package:get_gifts/games/get_gifts.dart';

class GameOverMenu extends StatelessWidget {
  const GameOverMenu({required this.gameRef});

  static const String id = 'GameOverMenu';
  final GetGifts gameRef;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/${Globals.backGroundSprite}"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 50,
                ),
                child: Text(
                  'Game Over',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 50,
                ),
                child: Text(
                  "Score: ${gameRef.score}",
                  style: const TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  gameRef.overlays.remove(GameOverMenu.id);
                  gameRef.reset();
                  gameRef.resumeEngine();
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Play Again?',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
