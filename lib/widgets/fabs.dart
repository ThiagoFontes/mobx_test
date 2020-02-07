import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IncrementDecrementFabs extends StatelessWidget {
  final Function increment;
  final Function decrement;

IncrementDecrementFabs({
  @required this.increment,
  @required this.decrement
});

  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: FloatingActionButton(
                onPressed: increment,
                key: Key('increment'),
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
            ),
            FloatingActionButton(
              onPressed: decrement,
              key: Key('decrement'),
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
          ],
        );
  }
  
}