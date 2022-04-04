import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:norwegian_cruise_lines/views/screens/home_screen.dart';

void main() {
  testWidgets("""Test the button clicks and fetching data from 
  API and also displaying the data on the screen""",
      (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(
      child: MaterialApp(
        home: HomeScreen(),
      ),
    ));
    await tester.pump();

    // SKY
    final skyButton = find.byKey(const Key('button-key-sky'));
    await tester.tap(skyButton);
    await tester.pump();

    // check to see if the circular progress indicator is running
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();
    // check to see if the data have been populated to the ShipTypeCard
    expect(find.text('Passenger capacity:'), findsNWidgets(1));

    // BLISS
    final blissButton = find.byKey(const Key('button-key-bliss'));
    await tester.tap(blissButton);
    await tester.pump();

    // check to see if the circular progress indicator is running
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();
    // check to see if the data have been populated to the ShipTypeCard
    expect(find.text('Passenger capacity:'), findsNWidgets(2));

    // ESCAPE
    final escapeButton = find.byKey(const Key('button-key-escape'));
    await tester.tap(escapeButton);
    await tester.pump();

    // check to see if the circular progress indicator is running
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();

    // check to see if the data have been populated to the ShipTypeCard
    expect(find.text('Passenger capacity:'), findsNWidgets(3));

    // uncomment the below line of code if
    // you want the app to stay on the screen
    // for 10 seconds after test is finished

    // await Future.delayed(const Duration(seconds: 10));
  });
}
