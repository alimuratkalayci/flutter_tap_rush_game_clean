import 'package:flutter/material.dart';

class GameMenu extends StatelessWidget {
  final bool isGameOver;
  final int score;
  final VoidCallback onStartGame;

  const GameMenu({
    super.key,
    required this.isGameOver,
    required this.score,
    required this.onStartGame,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isGameOver) ...<Widget>[
            Text(
              'Game Over',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Score: $score',
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 40),
          ] else ...<Widget>[
            Text(
              'TAP RUSH',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 40),
          ],
          ElevatedButton(
            onPressed: onStartGame,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 20,
              ),
            ),
            child: Text(
              'Start',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
