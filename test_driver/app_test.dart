// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  // First, define the Finders and use them to locate widgets from the
  // test suite. Note: the Strings provided to the `byValueKey` method must
  // be the same as the Strings we used for the Keys in step 1.
  final counterTextFinder = find.byValueKey('counter');
  final buttonIncrementFinder = find.byValueKey('increment');
  final buttonDecrementFinder = find.byValueKey('decrement');

  FlutterDriver driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });

  test('check flutter driver health', () async {
    final health = await driver.checkHealth();
    expect(health.status, HealthStatus.ok);
  });

  test('starts at 0', () async {
    // Use the `driver.getText` method to verify the counter starts at 0.
    expect(await driver.getText(counterTextFinder), "0");
  });
//
  test('increments the counter', () async {
    // First, tap the button.
    await driver.tap(buttonIncrementFinder);
    await driver.tap(buttonIncrementFinder);

    // Then, verify the counter text is incremented by 2.
    expect(await driver.getText(counterTextFinder), "2");
  });

  test('decrements the counter', () async {
    // First, tap the button.
    for (var i = 0; i < 3; i++) {
      await driver.tap(buttonDecrementFinder);
    }

    // Then, verify the counter text is decremeted by 3.
    expect(await driver.getText(counterTextFinder), "-1");
  });
}