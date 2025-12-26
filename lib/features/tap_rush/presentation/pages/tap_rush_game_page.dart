import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';
import '../widgets/game_menu.dart';
import '../widgets/game_play_area.dart';

class TapRushGamePage extends StatelessWidget {
  const TapRushGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameProvider(),
      child: const Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: _GameContent(),
        ),
      ),
    );
  }
}

class _GameContent extends StatelessWidget {
  const _GameContent();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Oyun başlamadıysa veya bittiyse menu göster
        Selector<GameProvider, bool>(
          selector: (_, provider) => provider.gameState.isGameStarted,
          builder: (context, isGameStarted, child) {
            if (isGameStarted) return const SizedBox.shrink();
            return child!;
          },
          child: Selector<GameProvider, (bool, int)>(
            selector: (_, provider) => (
              provider.gameState.isGameOver,
              provider.gameState.score,
            ),
            builder: (context, data, _) {
              return GameMenu(
                isGameOver: data.$1,
                score: data.$2,
                onStartGame: context.read<GameProvider>().startGame,
              );
            },
          ),
        ),

        // Oyun alanı
        Selector<GameProvider, bool>(
          selector: (_, provider) => provider.gameState.isGameStarted,
          builder: (context, isGameStarted, child) {
            if (!isGameStarted) return const SizedBox.shrink();
            return child!;
          },
          child: Selector<GameProvider, (int, int, dynamic)>(
            selector: (_, provider) => (
              provider.gameState.score,
              provider.gameState.lives,
              provider.currentIconPosition,
            ),
            builder: (context, data, _) {
              return GamePlayArea(
                score: data.$1,
                lives: data.$2,
                iconPosition: data.$3,
                onIconTapped: context.read<GameProvider>().onIconTapped,
              );
            },
          ),
        ),
      ],
    );
  }
}
