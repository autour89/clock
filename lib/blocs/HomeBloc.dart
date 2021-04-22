import 'dart:async';

import 'package:clock/models/Counter.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc with ChangeNotifier {
  late Counter counter;
  late StreamSubscription<dynamic> _counterStream;

  bool get run => !_counterStream.isPaused;

  String get duration {
    var duration = Duration(seconds: counter.value);
    var hours = toTime(duration.inHours);
    var min = toTime(duration.inMinutes.remainder(60));
    var sec = toTime(duration.inSeconds.remainder(60));

    return '$hours:$min:$sec';
  }

  String toTime(int x) => x < 10 ? '0$x' : x.toString();

  HomeBloc() {
    counter = Counter(onUpdate: notifyListeners);
    _counterStream = Stream.periodic(Duration(seconds: 1))
        .interval(Duration(seconds: 1))
        .listen((_) => counter.increment());
    pause();
  }

  void runPause() {
    if (run) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  void pause() => _counterStream.pause();

  void resume() => _counterStream.resume();

  void reset() {
    if (run) {
      pause();
    }
    counter.reset();
  }
}
