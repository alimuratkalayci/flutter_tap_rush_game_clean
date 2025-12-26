import 'dart:async';
import 'package:flutter/material.dart';
import '../../domain/models/game_state.dart';
import '../../domain/models/icon_position.dart';
import '../../domain/services/game_service.dart';

class GameProvider extends ChangeNotifier {
  final GameService _gameService = GameService();

  GameState _gameState = GameState();
  GameState get gameState => _gameState;

  IconPosition? _currentIconPosition;
  IconPosition? get currentIconPosition => _currentIconPosition;

  Timer? _iconTimer;
  Timer? _gameTimer;
  Timer? _delayTimer;

  void startGame() {
    // Önceki oyundan kalan timer'ları temizle
    _cleanupTimers();

    _gameState = GameState(
      isGameStarted: true,
      isGameOver: false,
      score: 0,
      lives: 3,
      elapsedSeconds: 0,
    );
    _currentIconPosition = null;
    notifyListeners();

    // Oyun süresi sayacı
    _gameTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_gameState.isGameStarted && !_gameState.isGameOver) {
        _gameState = _gameState.copyWith(
          elapsedSeconds: _gameState.elapsedSeconds + 1,
        );
        notifyListeners();
      }
    });

    _showNextIcon();
  }

  void _showNextIcon() {
    if (!_gameState.isGameStarted || _gameState.isGameOver) return;

    _currentIconPosition = _gameService.generateRandomIconPosition();
    notifyListeners();

    // Icon görünür kalma süresi
    _iconTimer?.cancel();
    final duration = _gameService.getIconDuration(_gameState.elapsedSeconds);
    _iconTimer = Timer(Duration(milliseconds: duration), () {
      // Durum kontrolü ekle
      if (!_gameState.isGameStarted || _gameState.isGameOver) return;
      if (_currentIconPosition != null) {
        _missedIcon();
      }
    });
  }

  void _missedIcon() {
    // Oyun durumu kontrolü ekle
    if (!_gameState.isGameStarted || _gameState.isGameOver) return;

    _gameState = _gameState.copyWith(lives: _gameState.lives - 1);
    _currentIconPosition = null;

    if (_gameState.lives <= 0) {
      _endGame();
    } else {
      notifyListeners();
      final delay = _gameService.getDelayBetweenIcons(_gameState.elapsedSeconds);
      _delayTimer?.cancel();
      _delayTimer = Timer(Duration(milliseconds: delay), () {
        if (_gameState.isGameStarted && !_gameState.isGameOver) {
          _showNextIcon();
        }
      });
    }
  }

  void onIconTapped() {
    // Oyun durumu kontrolü ekle
    if (!_gameState.isGameStarted || _gameState.isGameOver) return;
    if (_currentIconPosition == null) return;

    _iconTimer?.cancel();
    _gameState = _gameState.copyWith(score: _gameState.score + 1);
    _currentIconPosition = null;
    notifyListeners();

    final delay = _gameService.getDelayBetweenIcons(_gameState.elapsedSeconds);
    _delayTimer?.cancel();
    _delayTimer = Timer(Duration(milliseconds: delay), () {
      if (_gameState.isGameStarted && !_gameState.isGameOver) {
        _showNextIcon();
      }
    });
  }

  void _endGame() {
    _cleanupTimers();
    _gameState = _gameState.copyWith(
      isGameOver: true,
      isGameStarted: false,
    );
    notifyListeners();
  }

  void _cleanupTimers() {
    _iconTimer?.cancel();
    _iconTimer = null;
    _gameTimer?.cancel();
    _gameTimer = null;
    _delayTimer?.cancel();
    _delayTimer = null;
  }

  @override
  void dispose() {
    _cleanupTimers();
    super.dispose();
  }
}