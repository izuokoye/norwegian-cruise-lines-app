import 'package:norwegian_cruise_lines/models/ship/ship_type_model.dart';
import 'package:norwegian_cruise_lines/services/api_service.dart';

class ShipController {
  // this method gets the ship data from
  // the fetchShipType api endpoint and
  // convert the data to a ShipTypeModel
  Future<dynamic> getShipData(String shipType) async {
    final ApiService _apiService = ApiService();
    final response = await _apiService.getShipData(shipType);
    return ShipTypeModel.fromJson(response.data);
  }
}
