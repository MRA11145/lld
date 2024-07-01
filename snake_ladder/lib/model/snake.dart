class Snake {
  int _head = 0;
  int _tail = 0;
  Snake(int head, int tail) {
    _head = head;
    _tail = tail;
  }

  Snake.defaultConstructor() {
    _head = 0;
    _tail = 0;
  }

  get head => _head;
  get tail => _tail;
}