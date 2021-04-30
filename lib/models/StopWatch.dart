import 'dart:async';

class StopWatch {
  late Timer _timer;
  Stopwatch _stopWatch = Stopwatch();
  bool _isReset = true;

  late Function onUpdate;
  late Duration updateDuration;
  Function onValueChanged;

  bool get isReset => _isReset;
  bool get isRun => _stopWatch.isRunning;
  Duration get elapsed => _stopWatch.elapsed;

  StopWatch({required this.onValueChanged}) {
    onUpdate = () => onValueChanged();
    updateDuration = Duration(milliseconds: 80);
  }

  set run(bool run) {
    switch (run) {
      case false:
        _stopWatch.stop();
        _timer.cancel();
        break;
      default:
        _isReset = false;
        _stopWatch.start();
        _timer = Timer.periodic(updateDuration, (_) => onUpdate());
    }
    onValueChanged();
  }

  void reset() {
    if (isRun) run = false;
    _stopWatch.reset();
    _isReset = true;
    onValueChanged();
  }
}
