import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:norwegian_cruise_lines/constants.dart';
import 'package:norwegian_cruise_lines/controllers/ship_controller.dart';
import 'package:norwegian_cruise_lines/models/ship/ship_type_model.dart';

class ShipChangeNotifier extends ChangeNotifier {
  // calling the api service in the constructor
  // to enable us carry out better unit test
  final ShipController _shipController;
  ShipChangeNotifier(this._shipController);

  // List of ships to be fetched
  final List<String> _shipTypes = kCruiseShips;
  List<String> get shipTypes => _shipTypes;

  // this holds each of the ship types data
  final List<ShipTypeModel> _shipTypeModels = [];
  List<ShipTypeModel> get shipTypeModels => _shipTypeModels;

  // this keeps track of each button state when tapped
  final List<bool> _loadings = [];
  List<bool> get loadings => _loadings;

  // this keeps track of each error state when tapped
  final List<bool> _errors = [];
  List<bool> get errors => _errors;

  // set ship type
  void setShipType({required ShipTypeModel shipType, int? index}) {
    if (index == null) {
      _shipTypeModels.add(shipType);
    } else {
      _shipTypeModels[index] = shipType;
      notifyListeners();
    }
  }

  // set the isLoading
  void setLoading({required bool value, int? index}) {
    if (index == null) {
      _loadings.add(value);
    } else {
      _loadings[index] = value;
      notifyListeners();
    }
  }

  // set the isError
  void setError({required bool value, int? index}) {
    if (index == null) {
      _errors.add(value);
    } else {
      errors[index] = value;
      notifyListeners();
    }
  }

  Future<void> fetchShipData({required int index}) async {
    // Fetch and set the data to the shipTypeModel
    try {
      _shipTypeModels[index] =
          await _shipController.getShipData(_shipTypes[index]);
      _loadings[index] = false;
      notifyListeners();
    } catch (e) {
      _loadings[index] = false;
      _errors[index] = true;
    }
  }

  // for testing purpose only
  void setShipTypes(String shipName) {
    _shipTypes.add(shipName);
  }
}

final shipChangeNotifierProvider = ChangeNotifierProvider((ref) {
  late ShipController _shipController = ShipController();
  return ShipChangeNotifier(_shipController);
});
