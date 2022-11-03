import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hello_world/models/products_model.dart';
import 'package:flutter_hello_world/utils/app_constant.dart';
import 'package:flutter_hello_world/utils/dimensions.dart';
import 'package:flutter_hello_world/widgets/big_text.dart';
import 'package:flutter_hello_world/widgets/icon_and_text_widget.dart';
import 'package:flutter_hello_world/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../controllers/healthy_product_controller.dart';
import '../controllers/popular_product_controller.dart';

class TravelPageBody extends StatefulWidget {
  const TravelPageBody({super.key});

  @override
  State<TravelPageBody> createState() => _TravelPageBodyState();
}

class _TravelPageBodyState extends State<TravelPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return Container(
            height: Dimensions.pageView,
            child: GestureDetector(
              onTap: () {
                //Get.to(()=>)
              },
              child: PageView.builder(
                  controller: pageController,
                  itemCount: popularProducts.popularProductList.length,
                  itemBuilder: (context, position) {
                    return _buildPageItem(
                        position, popularProducts.popularProductList[position]);
                  }),
            ),
          );
        }),
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
              dotsCount: popularProducts.popularProductList.isEmpty
                  ? 1
                  : popularProducts.popularProductList.length,
              position: _currPageValue,
              decorator: DotsDecorator(
                activeColor: Color(0xff00FF4D),
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ));
        }),
        //puntos slider

        //Populares
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(
              left: Dimensions.width30, right: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigText(text: "Platos Saludables"),
              SizedBox(
                width: Dimensions.width10,
              ),
              SmallText(text: "Ver mas"),
            ],
          ),
        ),
        //lista de lugares
        GetBuilder<HealthyProductController>(builder: (healthyProduct) {
          return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: healthyProduct.healthyProductList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: Dimensions.height10,
                  ),
                  child: Row(children: [
                    Container(
                      width: Dimensions.listViewImgSize,
                      height: Dimensions.listViewImgSize,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white38,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(healthyProduct
                                .healthyProductList[index].image!)),
                      ),
                    ),
                    //text container
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight:
                                  Radius.circular(Dimensions.radius20)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.width10,
                              right: Dimensions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(
                                  text: healthyProduct
                                      .healthyProductList[index].title!),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              SmallText(
                                  text:
                                      "Ven a disfrutar de un dia de sol y diversion..."),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconAndTextWidget(
                                    icon: Icons.attach_money,
                                    text: healthyProduct
                                        .healthyProductList[index]
                                        .pricePerServing!
                                        .toDouble(),
                                    iconColor: Colors.green,
                                  ),
                                  IconAndTextWidget(
                                    icon: Icons.location_on,
                                    text: "1,7 km",
                                    iconColor: Colors.lightBlue,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ]),
                );
              });
        }),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductsModel popularProduct) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven ? Color(0XFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(popularProduct.image!))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.textViewContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: 40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15, left: 15, right: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: popularProduct.title!),
                      SizedBox(height: Dimensions.height10),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                                5,
                                (index) => Icon(
                                      Icons.star,
                                      color: Colors.amberAccent,
                                      size: 15,
                                    )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(text: "4.5"),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(text: "80"),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(text: "comentarios"),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconAndTextWidget(
                            icon: Icons.attach_money,
                            text: popularProduct.pricePerServing!.toDouble(),
                            iconColor: Colors.green,
                          ),
                          IconAndTextWidget(
                            icon: Icons.location_on,
                            text: popularProduct.cookingMinutes,
                            iconColor: Colors.lightBlue,
                          ),
                        ],
                      )
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
