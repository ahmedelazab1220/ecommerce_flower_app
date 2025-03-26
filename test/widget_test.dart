// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('find first widget', (WidgetTester tester) async {
    // Create a simple widget to test
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: Center(child: Text('Hello, Flutter!'))),
      ),
    );

    // Verify the text is found in the widget tree
    expect(find.text('Hello, Flutter!'), findsOneWidget);
  });
}
