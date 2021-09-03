import 'dart:async';
import 'package:clock/models/counter_model.dart';

class StopWatch with Counter {
  late Timer _timer;
  bool _isReset = true;
  bool _isRunning = false;
  final Duration _updateDelay = const Duration(seconds: 1);
  Duration duration;

  Function onValueChanged;

  bool get isReset => _isReset;
  bool get isRun => _isRunning;

  StopWatch({required this.onValueChanged, this.duration = Duration.zero}) {
    isUp = true;
  }

  set run(bool run) {
    _isRunning = run;
    switch (run) {
      case true:
        _isReset = false;
        _timer = Timer.periodic(_updateDelay, (_) => onUpdate());
        break;
      case false:
        _timer.cancel();
        break;
    }
    onValueChanged();
  }

  void onUpdate() {
    if (isUp) {
      increment();
    } else {
      decrement();
    }
    onValueChanged();
  }

  void reset() {
    value = isUp ? 0 : duration.inSeconds;
    _isReset = true;
    run = false;
  }
}
