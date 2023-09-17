import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Player with ChangeNotifier {
  AudioPlayer _currentPlayer = AudioPlayer();

  AudioPlayer get currentPlayer {
    return _currentPlayer;
  }

  setCurrentPlayer(AudioPlayer currentPlayer) {
    _currentPlayer = currentPlayer;
  }
}
