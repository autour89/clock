import 'dart:async';

import 'package:clock/models/Counter.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc with ChangeNotifier {
  late Counter _counter;
  late StreamSubscription<dynamic> _counterStream;

  int get count => _counter.value;

  HomeBloc() {
    _counter = Counter();
    _counterStream = Stream.periodic(Duration(seconds: 0))
        .interval(Duration(seconds: 1))
        .listen((_) => increment());
  }

  void increment() {
    _counter.increment();
    notifyListeners();
  }

  void pause() => _counterStream.pause();

  void resume() => _counterStream.resume();
}
