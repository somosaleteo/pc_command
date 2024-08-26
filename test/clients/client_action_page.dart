import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pc_command/clients/client_action_page.dart';

void main() {
  testWidgets('ClientActionPage should order ice cream and undo the last order',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ClientActionPage()));

    // Verify the initial state
    expect(find.text('Vanilla'), findsNothing);
    expect(find.text('Chocolate'), findsNothing);

    // Order Vanilla Ice Cream
    await tester.tap(find.text('Order Vanilla'));
    await tester.pump();

    // Verify Vanilla Ice Cream is ordered
    expect(find.text('Vanilla'), findsOneWidget);
    expect(find.text('Chocolate'), findsNothing);

    // Order Chocolate Ice Cream
    await tester.tap(find.text('Order Chocolate'));
    await tester.pump();

    // Verify Chocolate Ice Cream is ordered
    expect(find.text('Vanilla'), findsOneWidget);
    expect(find.text('Chocolate'), findsOneWidget);

    // Undo Last Order
    await tester.tap(find.text('Undo Last Order'));
    await tester.pump();

    // Verify Chocolate Ice Cream is undone
    expect(find.text('Vanilla'), findsOneWidget);
    expect(find.text('Chocolate'), findsNothing);
  });
}
