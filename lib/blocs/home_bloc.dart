import 'package:clock/models/count_down.dart';
import 'package:clock/models/stop_watch.dart';
import 'package:clock/services/extensions.dart';
import 'package:flutter/foundation.dart';

class HomeBloc extends ChangeNotifier {
  late StopWatch _stopwatch;
  late Countdown _countdown;

  // StopWatch get counter => _stopwatch;
  Countdown get counter => _countdown;

  // String get duration => _stopwatch.elapsed.stopwatch();
  String get duration => _countdown.elapsed.timer();

  HomeBloc() {
    _stopwatch = StopWatch(onValueChanged: () => notifyListeners());
    _countdown = Countdown(
        duration: const Duration(minutes: 5),
        onValueChanged: () => notifyListeners());
  }

  void runTimer() =>
      // _stopwatch.run = !_stopwatch.isRun;
      _countdown.run = !_countdown.isRun;
}
