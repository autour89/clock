// Import the test package and Counter class
import 'package:test/test.dart';
import 'package:clock/models/StopWatch.dart';

void main() {
  test('Counter value should be incremented', () {
    final counter = StopWatch(onValueChanged: () => {});

    expect(counter.elapsed, 1);
  });
}
