import 'package:flutter/material.dart';
import '../../domain/models/icon_position.dart';

class TappableIcon extends StatelessWidget {
  final IconPosition iconPosition;
  final VoidCallback onTap;

  const TappableIcon({
    super.key,
    required this.iconPosition,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Positioned(
      left: size.width * iconPosition.x - 30,
      top: size.height * iconPosition.y - 30,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: Icon(
            iconPosition.icon,
            size: 40,
            color: Colors.yellow,
          ),
        ),
      ),
    );
  }
}