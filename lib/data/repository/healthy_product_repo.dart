import 'package:flutter_hello_world/data/api/api_client.dart';
import 'package:flutter_hello_world/utils/app_constant.dart';
import 'package:get/get.dart';

class HealthyProductRepo extends GetxService {
  final ApiCLient apiCLient;

  HealthyProductRepo({required this.apiCLient});

  Future<Response> getHealthyProductList() async {
    return await apiCLient.getData(AppConstants.HEALTHY_PRODUCT_URI);
  }
}
