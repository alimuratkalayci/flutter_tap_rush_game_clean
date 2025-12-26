class GameState {
  final bool isGameStarted;
  final bool isGameOver;
  final int score;
  final int lives;
  final int elapsedSeconds;

  GameState({
    this.isGameStarted = false,
    this.isGameOver = false,
    this.score = 0,
    this.lives = 3,
    this.elapsedSeconds = 0,
  });

  GameState copyWith({
    bool? isGameStarted,
    bool? isGameOver,
    int? score,
    int? lives,
    int? elapsedSeconds,
  }) {
    return GameState(
      isGameStarted: isGameStarted ?? this.isGameStarted,
      isGameOver: isGameOver ?? this.isGameOver,
      score: score ?? this.score,
      lives: lives ?? this.lives,
      elapsedSeconds: elapsedSeconds ?? this.elapsedSeconds,
    );
  }
}
