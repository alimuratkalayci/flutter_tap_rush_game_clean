import 'package:flutter/material.dart';

class ScoreHeader extends StatelessWidget {
  final int score;
  final int lives;

  const ScoreHeader({
    super.key,
    required this.score,
    required this.lives,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Score: $score',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.favorite,
                color: lives > 0 ? Colors.red : Colors.grey,
                size: 32,
              ),
              Icon(
                Icons.favorite,
                color: lives > 1 ? Colors.red : Colors.grey,
                size: 32,
              ),
              Icon(
                Icons.favorite,
                color: lives > 2 ? Colors.red : Colors.grey,
                size: 32,
              ),
            ],
          ),
        ],
      ),
    );
  }
}