import 'dart:async';

class StopWatch {
  int _frequancy = 80; // how often to call onUpdate function
  late Timer _timer;
  Stopwatch _stopWatch = Stopwatch();
  bool _isReset = true;

  Function onUpdate;

  bool get isReset => _isReset;
  bool get isRun => _stopWatch.isRunning;
  Duration get value => _stopWatch.elapsed;

  StopWatch({required this.onUpdate});

  set run(bool run) {
    switch (run) {
      case false:
        _stopWatch.stop();
        _timer.cancel();
        onUpdate();
        break;
      default:
        _isReset = false;
        _stopWatch.start();
        _timer = Timer.periodic(
            Duration(milliseconds: _frequancy), (_) => onUpdate());
    }
  }

  void reset() {
    if (isRun) run = false;
    _stopWatch.reset();
    _isReset = true;
    onUpdate();
  }
}
