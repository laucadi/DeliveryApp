import 'package:flutter_hello_world/models/products_model.dart';
import 'package:get/get.dart';

import '../data/repository/healthy_product_repo.dart';

class HealthyProductController extends GetxController {
  final HealthyProductRepo healthyProductRepo;
  HealthyProductController({required this.healthyProductRepo});
  List<ProductsModel> _healthyProductList = [];
  List<ProductsModel> get healthyProductList => _healthyProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getHealthyProductList() async {
    Response response = await healthyProductRepo.getHealthyProductList();
    if (response.statusCode == 200) {
      _healthyProductList = [];
      _healthyProductList.addAll(Product.fromJson(response.body).results);
      _isLoaded = true;
      update();
    } else {}
  }
}
