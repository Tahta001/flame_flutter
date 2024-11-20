import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:dasar_flame/pages/my_flame_game.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GameWidget(
        game: MyFlameGame(),
      )
    );
  }
}
