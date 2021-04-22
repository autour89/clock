class Counter {
  int _value = 0;
  Function onUpdate;

  int get value => _value;

  Counter({required this.onUpdate});

  void increment() {
    _value++;
    onUpdate();
  }

  void decrement() {
    _value--;
    onUpdate();
  }

  void reset() {
    _value = 0;
    onUpdate();
  }
}
