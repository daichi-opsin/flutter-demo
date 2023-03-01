import 'dart:math';

import 'package:flutter/material.dart';

class JankenGame extends StatefulWidget {
  @override
  _JankenGameState createState() => _JankenGameState();
}

class _JankenGameState extends State<JankenGame> {
  final List<String> _hands = ['グー', 'チョキ', 'パー'];
  String _playerHand = '';
  String _computerHand = '';
  int _playerScore = 0;
  int _computerScore = 0;

  void _playGame() {
    setState(() {
      final random = Random();
      _computerHand = _hands[random.nextInt(_hands.length)];
      if (_playerHand == 'グー' && _computerHand == 'チョキ' ||
          _playerHand == 'チョキ' && _computerHand == 'パー' ||
          _playerHand == 'パー' && _computerHand == 'グー') {
        _playerScore++;
      } else if (_playerHand != _computerHand) {
        _computerScore++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('じゃんけんゲーム'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'あなたの手: $_playerHand',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              '相手の手: $_computerHand',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              'スコア: $_playerScore - $_computerScore',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _playerHand = 'グー';
                      _playGame();
                    });
                  },
                  child: Text('グー'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _playerHand = 'チョキ';
                      _playGame();
                    });
                  },
                  child: Text('チョキ'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _playerHand = 'パー';
                      _playGame();
                    });
                  },
                  child: Text('パー'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}