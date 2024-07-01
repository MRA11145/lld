import 'dart:math';

class Dice {
  int _face = 0;

  Dice(int face)  {
    _face = face;
  }

  int rollDice() {
    Random random = Random();
    int randomNumber = random.nextInt(_face);
    return randomNumber;
  }
}