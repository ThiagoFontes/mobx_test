import 'package:test/test.dart';
import 'package:mobx_test/counter.dart';

void main() {
  test('Counter starts with 0 increments to 10, decrements to -2', () {
    final counter = Counter();

    // Starts at 0
    expect(counter.value, 0);

    // Increments to 10
    for (var i = 0; i < 10; i++) {
      counter.increment();
    }
    expect(counter.value, 10);

    // Decrements to -2
    for (var i = 10; i > -2; i--) {
      counter.decrement();
    }
    expect(counter.value, -2);
  });

  test('Counts to 1000', (){
    final counter = Counter();

    // Counts to 1000
    for(var i = 0; i < 1000; i++) {
      counter.increment();
    }

    expect(counter.value, 1000);
  });
}
