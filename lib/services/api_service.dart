import 'package:dio/dio.dart';
import 'package:norwegian_cruise_lines/constants.dart';

class ApiService {
  //  this API endpoint fetches the ship data
  Future<Response> getShipData(String shipType) async {
    try {
      var response = await Dio().get('$kBaseUrl/$shipType');
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
