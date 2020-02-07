import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'widgets/fabs.dart';

import 'counter.dart'; // Import the Counter

final counter = Counter(); // Instantiate the store

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobX Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            // Wrapping in the Observer will automatically re-render on changes to counter.value
            Observer(
              builder: (_) => Text(
                    // Provide a Key to this specific Text widget. This allows
                    // identifing the widget from inside the test suite,
                    // and reading the text.
                    '${counter.value}',
                    key: Key('counter'),
                    style: Theme.of(context).textTheme.display1,
                  ),
            ),
          ],
        ),
      ),
      floatingActionButton: IncrementDecrementFabs(
        decrement: counter.decrement,
        increment: counter.increment
        )
      );
  }
}