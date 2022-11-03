import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.23;
  static double pageViewContainer = screenHeight / 3.25;
  static double textViewContainer = screenHeight / 5.96;
//altura dinamica para padding y margin
  static double height10 = screenHeight / 71.6;
  static double height15 = screenHeight / 47.73;
  static double height20 = screenHeight / 35.8;
  static double height30 = screenHeight / 23.8;
//ancho dinamico para padding y margin
  static double width10 = screenHeight / 71.6;
  static double width15 = screenHeight / 47.73;
  static double width20 = screenHeight / 35.8;
  static double width30 = screenHeight / 23.8;

  static double font20 = screenHeight / 35.8;
  static double radius20 = screenHeight / 35.8;
  static double radius30 = screenHeight / 23.8;

  //list view medidas
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextSize = screenWidth / 3.9;
}
