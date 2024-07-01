class Board {
  int _size = 0;
  int _start = 0;
  int _end = 0;
  Board(int size, int start, int end) {
    _size = size;
    _start = start;
    _end = end;
  }

  get size => _size;
  get start => _start;
  get end => _end;
}