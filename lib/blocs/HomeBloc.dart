import 'package:clock/models/Countdown.dart';
import 'package:clock/models/StopWatch.dart';
import 'package:flutter/foundation.dart';
import '../services/extensions.dart';

class HomeBloc with ChangeNotifier {
  late StopWatch _stopwatch;
  late Countdown _countdown;

  // StopWatch get counter => _stopwatch;
  Countdown get counter => _countdown;

  String get duration => Duration(seconds: _countdown.value).timer();

  String get stopwatchDuration => _stopwatch.elapsed.stopwatch();

  HomeBloc() {
    _stopwatch = StopWatch(onValueChanged: () => _notifyValueChanged());
    _countdown = Countdown(
        duration: Duration(minutes: 5),
        onValueChanged: () => _notifyValueChanged());
  }

  void _notifyValueChanged() {
    notifyListeners();
  }

  void runTimer() =>
      _countdown.isRun ? _countdown.run = false : _countdown.run = true;
}
