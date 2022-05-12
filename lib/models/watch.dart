import 'dart:async';

import 'package:timer/models/counter.dart';

class Watch with Counter {
  Timer? _timer;
  bool _isReset = true;
  final Duration _updateDelay = const Duration(seconds: 1);

  Duration duration;
  Function onValueChanged;

  bool isStopWatch;

  Duration get elapsed => Duration(seconds: value);
  bool get isReset => _isReset;
  bool get isRun => _timer == null ? false : _timer!.isActive;

  Watch(
      {this.isStopWatch = false,
      this.duration = Duration.zero,
      required this.onValueChanged}) {
    if (!isStopWatch) {
      value = duration.inSeconds;
    }
  }

  set run(bool run) {
    switch (run) {
      case true:
        _isReset = false;
        _timer = Timer.periodic(_updateDelay, (_) => onUpdate());
        break;
      case false:
        _timer?.cancel();
        break;
    }
    onValueChanged();
  }

  set newTime(Duration duration) {
    this.duration = duration;
    reset();
  }

  void onUpdate() {
    if (isStopWatch) {
      increment();
    } else {
      decrement();
    }
    onValueChanged();
  }

  void reset() {
    value = duration.inSeconds;
    _isReset = true;
    run = false;
  }
}
