import 'package:clock/models/StopWatch.dart';
import 'package:flutter/foundation.dart';

class HomeBloc with ChangeNotifier {
  late StopWatch _counter;

  StopWatch get counter => _counter;

  String get duration {
    var min = _toTime(_counter.value.inMinutes);
    var sec = _toTime(_counter.value.inSeconds.remainder(60));
    var miliSec = _toTime(_counter.value.inMilliseconds.remainder(100));

    return _counter.value.inHours > 0
        ? '${_counter.value.inHours}:$min:$sec.$miliSec'
        : '$min:$sec.$miliSec';
  }

  HomeBloc() {
    _counter = StopWatch(onUpdate: notifyListeners);
  }

  void runTimer() =>
      _counter.isRun ? _counter.run = false : _counter.run = true;

  String _toTime(int x) => x < 10 ? '0$x' : x.toString();
}
