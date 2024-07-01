import 'dart:io';

import 'package:snake_ladder/model/game.dart';
import 'package:snake_ladder/model/player.dart';



void main() {
  int? boardSize;
  print("Enter board Size");
  boardSize = int.parse(stdin.readLineSync()!);
  print("Enter Number of players");
  int? numberOfPlayer = int.parse(stdin.readLineSync()!);
  print("Enter number of snakes");
  int? numberOfSnakes = int.parse(stdin.readLineSync()!);
  print("Enter number of ladders");
  int? numberOfLadders = int.parse(stdin.readLineSync()!);
  print("Enter number of dice");
  int? dice = int.parse(stdin.readLineSync()!);

  Game game = Game(numberOfSnakes, numberOfLadders, numberOfPlayer, boardSize, dice);
  for (int i = 0; i < numberOfPlayer; i++) {
   print("Enter player name");
    String? pName = stdin.readLineSync();
    Player player = Player(pName!);
    game.addPlayers(player);
  }

  game.playGame();
}