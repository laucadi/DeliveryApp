import 'package:flutter_hello_world/utils/app_constant.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ApiCLient extends GetConnect implements GetxService {
  //late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  ApiCLient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    //token = AppConstants.TOKEN;
    _mainHeaders = {
      'Conten-type': 'application/json; charset=UTF-8',
      //'Autorization': 'Bearer $token',
    };
  }
  Future<Response> getData(
    String uri,
  ) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
