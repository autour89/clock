import 'dart:async';

class StopWatch {
  late Timer _timer;
  Stopwatch _stopWatch = Stopwatch();
  bool _isReset = true;

  Duration updateDuration = Duration(milliseconds: 80);
  Function onUpdate = () {};
  Function onValueChanged;

  bool get isReset => _isReset;
  bool get isRun => _stopWatch.isRunning;
  Duration get elapsed => _stopWatch.elapsed;

  StopWatch({required this.onValueChanged});

  set run(bool run) {
    switch (run) {
      case false:
        _stopWatch.stop();
        _timer.cancel();
        onValueChanged();
        break;
      default:
        _isReset = false;
        _stopWatch.start();
        _timer = Timer.periodic(
            updateDuration, (_) => {onUpdate(), onValueChanged()});
    }
  }

  void reset() {
    if (isRun) run = false;
    _stopWatch.reset();
    _isReset = true;
    onValueChanged();
  }
}
