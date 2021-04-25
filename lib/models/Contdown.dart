import 'dart:async' as timer;
import 'package:clock/models/Counter.dart';

class Countdown with Counter {
  late timer.Timer _timer;

  int value = 0;

  Countdown() {
    _timer = timer.Timer.periodic(Duration(seconds: 1), (_) => {});
  }
}
