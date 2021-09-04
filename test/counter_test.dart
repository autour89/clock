// Import the test package and Counter class
import 'package:clock/models/watch.dart';
import 'package:test/test.dart';

void main() {
  test('Counter value should be incremented', () {
    final counter = Watch(isStopWatch: true, onValueChanged: () => {});

    expect(counter.elapsed, 1);
  });
}
