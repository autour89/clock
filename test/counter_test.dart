// Import the test package and Counter class
import 'package:test/test.dart';
import 'package:clock/models/Counter.dart';

void main() {
  test('Counter value should be incremented', () {
    final counter = Counter(onUpdate: () => {});

    expect(counter.value, 1);
  });
}
