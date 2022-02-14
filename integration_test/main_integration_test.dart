import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';

import 'package:poc_integration_tests/main.dart';
import 'package:poc_integration_tests/widgets_example.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);

    // Checking widgets by keys
    expect(find.byKey(const Key('button-next-page')), findsOneWidget);

    // Tap button to next page
    await tester.tap(find.byKey(const Key('button-next-page')));
    await tester.pumpAndSettle();

    // Checking widgets by Type
    expect(find.byType(MyWidget), findsOneWidget);
  });
}
