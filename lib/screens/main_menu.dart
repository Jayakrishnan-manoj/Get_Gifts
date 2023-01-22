import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants/globals.dart';
import 'game_play.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/${Globals.backGroundSprite}"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: Text(
                  'Get Gifts',
                  style: TextStyle(
                    fontSize: 70,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const GamePlay(),
                      ),
                    );
                  },
                  child: const Text(
                    "Play",
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
