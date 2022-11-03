import 'package:flutter/material.dart';
import 'package:flutter_hello_world/utils/dimensions.dart';
import 'package:flutter_hello_world/widgets/app_colum.dart';
import 'package:flutter_hello_world/widgets/app_icon.dart';
import 'package:flutter_hello_world/widgets/expandable_text_widget.dart';

import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Img
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/image/travel2.png",
                    )),
              ),
            ),
          ),
          // Icons Widget
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          // Food Description
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize - 18,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppColumn(text: "Popular Food !"),
                  SizedBox(height: Dimensions.height20),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimensions.height20),
                  const Expanded(
                      child: SingleChildScrollView(
                          child: ExpandableTextWidget(
                              text:
                                  "This is the description of the recipe you have chosen enjoy! This is the description of the recipe you have chosen enjoy! This is the description of the recipe you have Chosen enjoy! This is the description of the recipe you have chosen enjoy! This is the description of the recipe you have chosen enjoy! This is the description of the recipe you have Chosen enjoy! This is the description of the recipe you have chosen enjoy! This is the description of the recipe you have chosen enjoy! This is the description of the recipe you have Chosen enjoy! This is the description of the recipe you have chosen enjoy! This is the description of the recipe you have Chosen enjoy! This is the description of the recipe you have chosen enjoy! This is the description of the recipe you have chosen enjoy! This is the description of the recipe you have Chosen enjoy!")))
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            left: Dimensions.width20,
            right: Dimensions.width20),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 240, 240, 240),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20 * 2),
            topRight: Radius.circular(Dimensions.radius20 * 2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height10,
                  bottom: Dimensions.height10,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white),
              child: Row(
                children: [
                  const Icon(Icons.remove, size: 20, color: Colors.black45),
                  SizedBox(width: Dimensions.width10 / 2),
                  BigText(size: Dimensions.font16 * 1.2, text: "0"),
                  SizedBox(width: Dimensions.width10 / 2),
                  const Icon(Icons.add, size: 20, color: Colors.black45)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height10,
                  bottom: Dimensions.height10,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Dimensions.radius20,
                  ),
                  color: Colors.green[300]),
              child: BigText(
                  size: Dimensions.font16,
                  text: "\$10 | Add to Cart",
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
