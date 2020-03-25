import 'package:flutter/material.dart';
import 'package:dice_app/models/game_model.dart';
import 'dart:math';

class ProviderSettings with ChangeNotifier {
  // create a list of  instances on the "Player" object
  final List<Player> players = [];
  int _dice = 0;
  int _roundScore = 0;
  int _activePlayer = 0;
  String _winnerName = '';
  get firstPlayerName => players[0].name;
  get secondPlyerName => players[1].name;
  get firstPlayerScore => players[0].totalScore;
  get secondPlyerScore => players[1].totalScore;
  get roundScore => _roundScore;
  get getdice => _dice;
  int get activePlayer => _activePlayer;
  String get winnerName => _winnerName;

  // add player instance to players List ... called from Login Screen.
  void addPlayer(pName) {
    Player p = Player(name: pName, totalScore: 0);
    players.add(p);
    notifyListeners();
  }

  void skipPlayer() {
    _activePlayer == 0 ? _activePlayer = 1 : _activePlayer = 0;
    _roundScore = 0;
    notifyListeners();
  }

  // if the global score(round score + player score) greater or equal to: 100 .
  // --> asign the name of active player to winnerName variable.
  void checkWinner() {
    if (_roundScore + players[_activePlayer].totalScore >= 100) {
      _winnerName = players[activePlayer].name;
    }
    notifyListeners();
  }

  void rollDice() {
    // generate random number btween(1 and 6).
    var randomNumber = Random();
    _dice = randomNumber.nextInt(6) + 1;
    // if the generated number(dice) is equal to 1..switch turn to the other player
    if (_dice == 1) {
      skipPlayer();
    } else {
      _roundScore += _dice;
      checkWinner();
    }
    notifyListeners();
  }

  void holdDice() {
    players[_activePlayer].totalScore += roundScore;
    skipPlayer();
    notifyListeners();
  }

  void resetScores() {
    players[0].totalScore = 0;
    players[1].totalScore = 0;
    _roundScore = 0;
    _dice = 0;
    _winnerName = '';
  }

  void resetAllData() {
    players.clear();
    _roundScore = 0;
    _dice = 0;
    _winnerName = '';
  }
}
