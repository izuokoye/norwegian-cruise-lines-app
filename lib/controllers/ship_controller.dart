import 'package:norwegian_cruise_lines/models/ship_type_model.dart';
import 'package:norwegian_cruise_lines/services/api_service.dart';

class ShipController {
  Future<ShipTypeModel> getShipData(String shipType) async {
    ApiService _apiService = ApiService();
    final response = await _apiService.fetchShipType(shipType);
    return ShipTypeModel.fromJson(response);
  }
}
