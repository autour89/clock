import 'package:clock/models/count_down.dart';
import 'package:clock/models/stop_watch.dart';
import 'package:flutter/foundation.dart';

import '../services/extensions.dart';

class HomeBloc with ChangeNotifier {
  late StopWatch _stopwatch;
  late Countdown _countdown;

  // StopWatch get counter => _stopwatch;
  Countdown get counter => _countdown;

  // String get duration => _stopwatch.elapsed.stopwatch();
  String get duration => Duration(seconds: _countdown.value).timer();

  HomeBloc() {
    _stopwatch = StopWatch(onValueChanged: () => _notifyValueChanged());
    _countdown = Countdown(
        duration: const Duration(minutes: 5),
        onValueChanged: () => _notifyValueChanged());
  }

  void _notifyValueChanged() {
    notifyListeners();
  }

  void runTimer() =>
      // _stopwatch.isRun ? _stopwatch.run = false : _stopwatch.run = true;
      _countdown.isRun ? _countdown.run = false : _countdown.run = true;
}
