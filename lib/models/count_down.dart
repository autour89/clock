import 'package:clock/models/counter_model.dart';
import 'package:clock/models/stop_watch.dart';

class Countdown extends StopWatch with Counter {
  late Duration duration;

  Countdown({required this.duration, required Function onValueChanged})
      : super(onValueChanged: onValueChanged) {
    value = duration.inSeconds;
    onUpdate = () => decrement();
    updateDuration = const Duration(seconds: 1);
  }

  @override
  void reset() {
    value = duration.inSeconds;
    super.reset();
  }

  set newTime(Duration duration) {
    this.duration = duration;
    value = this.duration.inSeconds;
    onValueChanged();
  }
}
