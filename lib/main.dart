import 'package:flutter/material.dart';
import 'features/tap_rush/tap_rush.dart';

void main() {
  runApp(TapRushApp());
}

class TapRushApp extends StatelessWidget {
  const TapRushApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tap Rush',
      theme: ThemeData.dark(),
      home: TapRushGamePage(),
    );
  }
}
