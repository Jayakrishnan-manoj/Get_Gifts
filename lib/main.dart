import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get_gifts/games/get_gifts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(GameWidget(game: GetGifts()));
}
