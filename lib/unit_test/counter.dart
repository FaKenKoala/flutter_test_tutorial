class Counter {
  int _value = 0;
  void increment() => ++_value;

  void reset() => _value = 0;

  int get value => _value;

  int add(int x, int y) => x + y;

  int sub(int x, int y) => x - y;
}
