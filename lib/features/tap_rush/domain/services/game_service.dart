import 'dart:math';
import 'package:flutter/material.dart';
import '../models/icon_position.dart';

class GameService {
  final Random _random = Random();
  
  final List<IconData> _availableIcons = [
    Icons.star,
    Icons.favorite,
    Icons.flash_on,
    Icons.wb_sunny,
    Icons.emoji_emotions,
  ];

  // Zorluk seviyesine göre icon görünme süresi
  int getIconDuration(int elapsedSeconds) {
    int duration = 2000 - (elapsedSeconds ~/ 10) * 200;
    return duration.clamp(400, 2000);
  }

  // Iconlar arası bekleme süresi
  int getDelayBetweenIcons(int elapsedSeconds) {
    int delay = 500 - (elapsedSeconds ~/ 15) * 50;
    return delay.clamp(100, 500);
  }

  // Rastgele icon pozisyonu oluştur
  IconPosition generateRandomIconPosition() {
    final IconData icon = _availableIcons[_random.nextInt(_availableIcons.length)];
    final double x = 0.1 + _random.nextDouble() * 0.8; // %10-%90 arası
    final double y = 0.15 + _random.nextDouble() * 0.7; // %15-%85 arası
    
    return IconPosition(icon: icon, x: x, y: y);
  }
}
