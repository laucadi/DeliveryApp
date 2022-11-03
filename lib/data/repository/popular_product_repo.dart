import 'package:flutter_hello_world/data/api/api_client.dart';
import 'package:flutter_hello_world/utils/app_constant.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiCLient apiCLient;

  PopularProductRepo({required this.apiCLient});

  Future<Response> getPopulaProductList() async {
    return await apiCLient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}
