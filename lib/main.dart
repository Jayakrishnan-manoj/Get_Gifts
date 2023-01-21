import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get_gifts/games/get_gifts.dart';
import 'package:get_gifts/screens/main_menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainMenu(),
    ),
  );
}
