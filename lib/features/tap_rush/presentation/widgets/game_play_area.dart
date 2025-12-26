import 'package:flutter/material.dart';
import '../../domain/models/icon_position.dart';
import 'score_header.dart';
import 'tappable_icon.dart';

class GamePlayArea extends StatelessWidget {
  final int score;
  final int lives;
  final IconPosition? iconPosition;
  final VoidCallback onIconTapped;

  const GamePlayArea({
    super.key,
    required this.score,
    required this.lives,
    required this.iconPosition,
    required this.onIconTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Skor ve can göstergesi
        ScoreHeader(score: score, lives: lives),

        // Aktif icon
        if (iconPosition != null)
          TappableIcon(
            iconPosition: iconPosition!,
            onTap: onIconTapped,
          ),
      ],
    );
  }
}
