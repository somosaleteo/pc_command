import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pc_command/clients/client_page.dart';

void main() {
  testWidgets('ClientPage displays orders and handles actions',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ClientPage(),
      ),
    );

    expect(find.text('Ice Cream Shop'), findsOneWidget);

    // Find FABs
    final Finder vanillaFab = find.byTooltip('Order Vanilla');
    final Finder chocolateFab = find.byTooltip('Order Chocolate');
    final Finder undoFab = find.byTooltip('Undo Last Order');

    // Tap on Vanilla Order FAB
    await tester.tap(vanillaFab);
    await tester.pump();

    // Check if Vanilla Ice Cream is ordered
    expect(find.text('Vanilla'), findsOneWidget);

    // Tap on Chocolate Order FAB
    await tester.tap(chocolateFab);
    await tester.pump();

    // Check if Chocolate Ice Cream is ordered
    expect(find.text('Chocolate'), findsOneWidget);

    // Tap on Undo FAB
    await tester.tap(undoFab);
    await tester.pump();

    // Check if Chocolate Ice Cream order is undone
    expect(find.text('Chocolate'), findsNothing);
    expect(find.text('Vanilla'), findsOneWidget);
  });
}
