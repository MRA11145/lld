import 'dart:collection';
import 'dart:math';

import 'package:snake_ladder/model/board.dart';
import 'package:snake_ladder/model/dice.dart';
import 'package:snake_ladder/model/ladder.dart';
import 'package:snake_ladder/model/player.dart';
import 'package:snake_ladder/model/snake.dart';

class Game {
  int _numberOfSnakes = 0;
  int _numberOfLadders = 0;

  final Queue<Player> _players = Queue<Player>();
  List<Snake> _snakes = [];
  List<Ladder> _ladders = [];

  late Board _board;
  late Dice _dice;

  Game(int snakes, int ladders, int players, int board, int dice) {
    _numberOfSnakes = snakes;
    _numberOfLadders = ladders;
    _snakes = List.generate(_numberOfSnakes, (index) => Snake.defaultConstructor());
    _ladders = List.generate(_numberOfLadders, (index) => Ladder.empty());
    _board = Board(board, 0, 99);
    _dice = Dice(dice);
    _initBoard();
  }

  void _initBoard() {
    Set<String> slSet = <String>{};
    Random random = Random();
    for (int i = 0; i < _numberOfSnakes; i++) {
      while (true) {
        int snakeStart = random.nextInt(_board.size);
        int snakeEnd = random.nextInt(_board.size);

        if (snakeEnd >= snakeStart) {
          continue;
        }

        String startEndPair = "$snakeStart" + "_" + "$snakeEnd";
        if (!slSet.contains(startEndPair)) {
          Snake snake = Snake(snakeStart, snakeEnd);
          _snakes.add(snake);
          slSet.add(startEndPair);
          break;
        }
      }
    }

    for (int i = 0; i < _numberOfLadders; i++) {
      while (true) {
        int ladderStart = random.nextInt(_board.size);
        int ladderEnd = random.nextInt(_board.size);

        if (ladderEnd >= ladderStart) {
          continue;
        }

        String startEndPair = "$ladderStart" + "_" + "$ladderEnd";
        if (!slSet.contains(startEndPair)) {
          Ladder ladder = Ladder(ladderStart, ladderEnd);
          _ladders.add(ladder);
          slSet.add(startEndPair);
          break;
        }
      }
    }
  }

  void addPlayers(Player player) {
    _players.add(player);
  }

  void playGame() {
    while (true) {
      Player player = _players.first;
      _players.removeFirst();
      int val = _dice.rollDice();
      int newPos = player.playerPos + val;
      if (newPos > _board.end) {
        player.setPlayerPos(player.playerPos);
        _players.addLast(player);
      } else {
        player.setPlayerPos(_getNewPosition(newPos));
        if (player.playerPos == _board.end) {
          player.setWon(true);
          print("Player " + "${player.playerName}" + " Won.");
        } else {
          print("Setting " + "${player.playerName}" + "'s new position to " + "${player.playerPos}");
          _players.addLast(player);
        }
      }
      if (_players.length < 2) {
        break;
      }
    }
  }

  int _getNewPosition(int newPosition) {
    for (final snake in _snakes) {
      if (snake.head == newPosition) {
        print("Snake Bite!"); // Use exclamation mark for emphasis
        return snake.tail;
      }
    }

    for (final ladder in _ladders) {
      if (ladder.start == newPosition) {
        print("Climbed ladder!"); // Use exclamation mark for emphasis
        return ladder.end;
      }
    }

    return newPosition;
  }
}
