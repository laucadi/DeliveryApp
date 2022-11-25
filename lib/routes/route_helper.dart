import 'package:flutter_hello_world/pages/food/popular_food_details.dart';
import 'package:flutter_hello_world/pages/home/main_travel_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get/route_manager.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String healthyFood = "/healthy-food";

  static String getInitial() => initial;
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getHealthyFood() => healthyFood;

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainTravelPage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularFoodDetail(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
    //GetPage(name: healthyFood, page: () => HealthyFoodDetail()),
  ];
}
