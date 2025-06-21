
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'src/fila_game.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: GameWidget(game: FilaGame()),
    ),
  ));
}
