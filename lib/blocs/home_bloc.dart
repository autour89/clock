import 'package:flutter/foundation.dart';
import 'package:timer/models/watch.dart';
import 'package:timer/services/extensions.dart';

class HomeBloc extends ChangeNotifier {
  late Watch _stopwatch;
  late Watch _countdown;

  Watch get stopwatch => _stopwatch;
  Watch get counter => _countdown;

  String get timeDuration => _stopwatch.elapsed.stopwatch();
  String get timerDuration => _countdown.elapsed.timer();

  HomeBloc() {
    _stopwatch =
        Watch(isStopWatch: true, onValueChanged: () => notifyListeners());
    _countdown = Watch(
        isStopWatch: false,
        duration: const Duration(minutes: 5),
        onValueChanged: () => notifyListeners());
  }

  void runStopWatch() {
    _stopwatch.run = !_stopwatch.isRun;
  }

  void runTimer() {
    _countdown.run = !_countdown.isRun;
  }
}
