class Player {
  String _playerName = "";
  int _playerAge = 0;
  String _playerEmail = "";
  int _playerPos = 0;
  bool _won = false;
  
  Player(String playerName) {
    _playerName = playerName;
  }

  void setPlayerPos(int val) {
    _playerPos = val;
  }

  void setWon(bool val) {
    _won = val;
  }

  get playerPos => _playerPos;

  get playerName => _playerName;
}