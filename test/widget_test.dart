import 'package:flutter/material.dart';
import 'package:flutter_tap_rush_game_clean/features/tap_rush/presentation/pages/tap_rush_game_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tap_rush_game_clean/main.dart';

void main() {
  testWidgets('Tap Rush game starts', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TapRushGamePage());

    // Verify that game title is shown
    expect(find.text('TAP RUSH'), findsOneWidget);

    // Verify that start button exists
    expect(find.text('OYUNA BAŞLA'), findsOneWidget);

    // Tap the start button
    await tester.tap(find.text('OYUNA BAŞLA'));
    await tester.pumpAndSettle();

    // Verify that game has started (score should be visible)
    expect(find.textContaining('Puan:'), findsOneWidget);
  });
}