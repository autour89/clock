import 'package:clock/models/watch.dart';
import 'package:clock/services/extensions.dart';
import 'package:flutter/foundation.dart';

class HomeBloc extends ChangeNotifier {
  late Watch _stopwatch;
  late Watch _countdown;

  // Watch get counter => _stopwatch;
  Watch get counter => _countdown;

  // String get duration => _stopwatch.elapsed.stopwatch();
  String get duration => _countdown.elapsed.timer();

  HomeBloc() {
    _stopwatch =
        Watch(isStopWatch: true, onValueChanged: () => notifyListeners());
    _countdown = Watch(
        isStopWatch: false,
        duration: const Duration(minutes: 5),
        onValueChanged: () => notifyListeners());
  }

  void runTimer() =>
      // _stopwatch.run = !_stopwatch.isRun;
      _countdown.run = !_countdown.isRun;
}
