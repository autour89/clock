import 'dart:async';
import 'package:clock/models/counter_model.dart';

class StopWatch with Counter {
  Timer? _timer;
  bool _isReset = true;
  final Duration _updateDelay = const Duration(seconds: 1);

  Function onValueChanged;

  bool get isReset => _isReset;
  bool get isRun => _timer == null ? false : _timer!.isActive;

  StopWatch({required this.onValueChanged}) {
    isUp = true;
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

  void onUpdate() {
    if (isUp) {
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
