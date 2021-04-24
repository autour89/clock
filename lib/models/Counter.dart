import 'dart:async';

class Counter {
  late Timer _timer;
  Stopwatch _stopWatch = Stopwatch();
  bool _isReset = true;
  bool _isRun = false;

  Function onUpdate;

  bool get isReset => _isReset;
  bool get isRun => _isRun;
  Duration get value => _stopWatch.elapsed;

  Counter({required this.onUpdate});

  void pause() {
    _timer.cancel();
    _stopWatch.stop();
    _isRun = false;
  }

  void resume() {
    _isRun = true;
    _isReset = false;
    _stopWatch.start();
    _timer = Timer.periodic(Duration(milliseconds: 80), (_) => onUpdate());
  }

  void reset() {
    if (_isRun) pause();
    _stopWatch.reset();
    _isReset = true;
    onUpdate();
  }
}
