import 'package:clock/models/stop_watch.dart';

class Countdown extends StopWatch {
  Countdown({required Duration duration, required Function onValueChanged})
      : super(onValueChanged: onValueChanged, duration: duration) {
    value = duration.inSeconds;
    isUp = false;
  }

  set newTime(Duration duration) {
    this.duration = duration;
    value = duration.inSeconds;
    onValueChanged();
  }
}
