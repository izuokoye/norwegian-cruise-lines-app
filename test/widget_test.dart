import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:norwegian_cruise_lines/constants.dart';
import 'package:norwegian_cruise_lines/controllers/ship_controller.dart';
import 'package:norwegian_cruise_lines/models/ship/ship_change_notifier.dart';
import 'package:norwegian_cruise_lines/models/ship/ship_type_model.dart';
import 'package:norwegian_cruise_lines/views/screens/home_screen.dart';

class MockApiService extends Mock implements ShipController {}

void main() {
  late MockApiService mockApiService;
  // system under test
  late ShipChangeNotifier shipChangeNotifier;

  setUp(() {
    mockApiService = MockApiService();
    shipChangeNotifier = ShipChangeNotifier(mockApiService);
  });

  Widget createWidgetUnderTest() {
    return const ProviderScope(
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }

  arrangeShipTypesServiceReturnOneShipTypeModel({
    required int index,
    required ShipFacts shipFacts,
  }) {
    when(() => mockApiService.getShipData(kCruiseShips[index])).thenAnswer(
      (_) async {
        await Future.delayed(const Duration(seconds: 2));
        ShipTypeModel(
          shipName: kCruiseShips[index],
          shipFacts: shipFacts,
        );
      },
    );
  }

  group("Widget ", () {
    testWidgets('title is always displayed', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('Norwegian Cruise Lines'), findsOneWidget);
    });

    testWidgets(
        'makes sure we have 3 ShipTypeCardWidget and 3 buttons on the screen',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(createWidgetUnderTest());

      // this finds the ShipTypeCardWidget with title SKY
      expect(find.text('SKY'), findsOneWidget);
      // this finds the ShipTypeCardWidget with title BLISS
      expect(find.text('BLISS'), findsOneWidget);
      // this finds the ShipTypeCardWidget with title ESCAPE
      expect(find.text('ESCAPE'), findsOneWidget);

      // this finds the 3 buttons on the screen
      expect(find.byKey(const Key('button-key-sky')), findsOneWidget);
      expect(find.byKey(const Key('button-key-bliss')), findsOneWidget);
      expect(find.byKey(const Key('button-key-escape')), findsOneWidget);
    });
  });
}
