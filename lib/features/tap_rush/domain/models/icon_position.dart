import 'package:flutter/material.dart';

class IconPosition {
  final IconData icon;
  final double x; // 0.0 - 1.0 normalized position
  final double y; // 0.0 - 1.0 normalized position

  IconPosition({
    required this.icon,
    required this.x,
    required this.y,
  });
}
