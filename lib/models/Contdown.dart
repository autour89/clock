import 'package:clock/models/Counter.dart';
import 'package:clock/models/StopWatch.dart';

class Countdown extends StopWatch with Counter {
  late Duration duration;

  Countdown({required this.duration, required Function onValueChanged})
      : super(onValueChanged: onValueChanged) {
    value = duration.inSeconds;
    onUpdate = () => decrement();
    updateDuration = Duration(seconds: 1);
  }

  @override
  void reset() {
    value = duration.inSeconds;
    super.reset();
  }
}
