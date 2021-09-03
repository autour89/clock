mixin Counter {
  int value = 0;

  bool isUp = false;

  Duration get elapsed => Duration(seconds: value);

  void increment() => value++;

  void decrement() {
    if (value > 0) value--;
  }
}
