import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:norwegian_cruise_lines/constants.dart';
import 'package:norwegian_cruise_lines/controllers/ship_controller.dart';
import 'package:norwegian_cruise_lines/models/ship/ship_change_notifier.dart';
import 'package:norwegian_cruise_lines/models/ship/ship_type_model.dart';

class MockApiService extends Mock implements ShipController {}

void main() {
  late MockApiService mockApiService;
  // system under test
  late ShipChangeNotifier sut;

  setUp(() {
    mockApiService = MockApiService();
    sut = ShipChangeNotifier(mockApiService);
  });

  group('Variables', () {
    test('check if the initial cruise ship values are correct', () {
      expect(sut.shipTypes, kCruiseShips);
    });
    test('check if the initial values are 3 in number', () {
      expect(sut.shipTypes.length, 3);
    });

    // isLoadings
    test('check if the initial value of loading is empty, and also add to it',
        () {
      expect(sut.loadings, []);

      // add to isLoadings
      sut.setLoading(value: false);
      expect(sut.loadings, [false]);
    });

    // isErrors
    test('check if the initial value of errors is empty, and also add to it',
        () {
      expect(sut.errors, []);

      // add to isLoadings
      sut.setError(value: false);
      expect(sut.errors, [false]);
    });
  });

  group('ApiService', () {
    test('Fetch ship type data using ApiService', () async {
      /**
        I used 2 separate loops because,
          combining all of them in one loop throws an error
      **/

      // populate the Loading and Error Variables
      // using the available number of cruise ship
      for (var ship in kCruiseShips) {
        sut.setLoading(value: false);
        sut.setError(value: false);
      }

      // add ship types and ShipTypeModel
      // using the available number of cruise ship
      kCruiseShips.map((e) {
        sut.setShipTypes(e);
        sut.setShipType(shipType: ShipTypeModel());
      });

      // arrange
      when(() => mockApiService.getShipData(kCruiseShips[0])).thenAnswer(
        (_) async => ShipTypeModel(
          shipName: kCruiseShips[0],
          shipFacts: ShipFacts(
            crew: '899',
            passengerCapacity: '2,004 (double occupancy)',
            inauguralDate: '1999',
          ),
        ),
      );

      // act
      // call the end point
      await sut.fetchShipData(index: 0);

      // assert
      // this verifies that one ShipTypeModel was added
      verify(() => mockApiService.getShipData(kCruiseShips[0])).called(1);
    });
  });
}
