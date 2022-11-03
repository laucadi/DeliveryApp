import 'package:flutter/material.dart';
import 'package:flutter_hello_world/controllers/popular_product_controller.dart';
import 'package:flutter_hello_world/home/main_travel_app.dart';
import 'package:get/get.dart';
import 'controllers/healthy_product_controller.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<HealthyProductController>().getHealthyProductList();
    return const GetMaterialApp(
        debugShowCheckedModeBanner: false, home: MainTravelPage());
  }
}
