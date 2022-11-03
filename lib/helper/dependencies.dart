import 'package:flutter_hello_world/controllers/healthy_product_controller.dart';
import 'package:flutter_hello_world/controllers/popular_product_controller.dart';
import 'package:flutter_hello_world/data/api/api_client.dart';
import 'package:flutter_hello_world/data/repository/healthy_product_repo.dart';
import 'package:flutter_hello_world/data/repository/popular_product_repo.dart';
import 'package:flutter_hello_world/utils/app_constant.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiCLient(appBaseUrl: AppConstants.BASE_URL));
  //repositories
  Get.lazyPut(() => PopularProductRepo(apiCLient: Get.find()));
  Get.lazyPut(() => HealthyProductRepo(apiCLient: Get.find()));
  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => HealthyProductController(healthyProductRepo: Get.find()));
}
