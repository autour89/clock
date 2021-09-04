mixin Counter {
  int value = 0;

  void increment() => value++;

  void decrement() {
    if (value > 0) value--;
  }
}
