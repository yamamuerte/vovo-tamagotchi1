
import 'package:flutter/material.dart';
import 'screens/game_screen.dart';

void main() {
  runApp(const VovoApp());
}

class VovoApp extends StatelessWidget {
  const VovoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameScreen(),
    );
  }
}
