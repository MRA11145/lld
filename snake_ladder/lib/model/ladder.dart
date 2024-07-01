class Ladder {
  int _start = 0;
  int _end = 0;
  Ladder(int start, int end) {
    _start = start;
    _end = end;
  }

  Ladder.empty() {
    
  }

  get start => _start;
  get end => _end;
}