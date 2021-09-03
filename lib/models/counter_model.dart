mixin Counter {
  int value = 0;

  bool isUp = false;

  Duration duration = Duration.zero;

  Duration get elapsed => Duration(seconds: value);

  bool get _canSetDuration =>
      !isUp && duration == Duration.zero && value > duration.inSeconds;

  void increment() => value++;

  void decrement() {
    if (_canSetDuration) {
      duration = Duration(seconds: value);
    }
    if (value > 0) value--;
  }
}
