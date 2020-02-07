// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mobx_test/widgets/fabs.dart';

void main() {
  testWidgets("Testing floating action button",  (WidgetTester tester) async {
    // Triggers a rebuild of the widget after a given duration.
    await tester.pumpWidget(new MaterialApp(
        home: new Material(
          child: IncrementDecrementFabs(decrement: null,increment: null),
        )
    ));

    //Required parameters weren't provided
    expect(find.byIcon(Icons.remove), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
