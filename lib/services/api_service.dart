import 'package:dio/dio.dart';
import 'package:norwegian_cruise_lines/constants.dart';

class ApiService {
  Future<dynamic> fetchShipType(String shipType) async {
    try {
      var response = await Dio().get('$kBaseUrl/$shipType');
      return response.data;
    } on DioError catch (e) {
      print('[API Helper - POST] Connection Exception => ' + e.message);
    }
  }
}
